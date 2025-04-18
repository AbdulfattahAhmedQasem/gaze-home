import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewDialog extends StatefulWidget {
  const ImageViewDialog({
    required this.images,
    this.initialIndex = 0,
    super.key,
  });
  final List<String> images;
  final int initialIndex;

  @override
  State<ImageViewDialog> createState() => _ImageViewDialogState();
}

class _ImageViewDialogState extends State<ImageViewDialog> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.black,
      content: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            ClipRRect(
              child: PhotoViewGallery.builder(
                pageController: _pageController,
                builder: (BuildContext context, int index) {
                  final image = widget.images[index];
                  return PhotoViewGalleryPageOptions(
                    imageProvider:
                        image.startsWith('http')
                            ? NetworkImage(image)
                            : AssetImage(image),
                  );
                },
                itemCount: widget.images.length,
                loadingBuilder:
                    (context, event) => Center(child: AppLoading.image()),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.95),
              child: SizedBox(
                height: getValueForScreenType(medium: 45, large: 55).r,
                width: getValueForScreenType(medium: 45, large: 55).r,
                child: FloatingActionButton(
                  onPressed: context.pop,
                  backgroundColor: context.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Icon(
                    Icons.close,
                    size: getValueForScreenType(medium: 20, large: 30).r,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
