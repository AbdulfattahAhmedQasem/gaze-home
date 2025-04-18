import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/dialogs/image_view_dialog.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';

class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    required this.imageUrl,
    this.height,
    this.width,
    this.errorIconSize,
    this.radius,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.padding,
    this.memCacheHeight,
    this.memCacheWidth,
    this.onTap,
    super.key,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final double? errorIconSize;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final int? memCacheHeight;
  final int? memCacheWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            AppFunctions.unFocusKeyboard();
            AppFunctions.showAppDialog<void>(
              context,
              child: ImageViewDialog(images: [imageUrl]),
            );
          },
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius:
                borderRadius ??
                BorderRadius.circular(radius ?? AppSizes.radius.r),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            width: width,
            memCacheHeight: memCacheHeight,
            memCacheWidth: memCacheWidth,
            fit: fit,
            placeholder: (_, __) => AppLoading.image(),
            errorWidget:
                (_, __, ___) => ClipRRect(
                  borderRadius: BorderRadius.circular(
                    radius ?? AppSizes.radius.r,
                  ),
                  child: Image.asset(
                    AppImages.logo,
                    width: errorIconSize ?? width,
                    height: errorIconSize ?? height,
                    cacheWidth: (errorIconSize ?? width)?.cacheSize(context),
                    cacheHeight: (errorIconSize ?? height)?.cacheSize(context),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
