import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/dialogs/image_view_dialog.dart';
import 'package:gazhome/presentation/widgets/app_cached_image.dart';
import 'package:gazhome/presentation/widgets/app_dots.dart';

class HomeBanners extends StatefulWidget {
  const HomeBanners({required this.banners, super.key});

  final List<String> banners;

  @override
  State<HomeBanners> createState() => _HomeBannersState();
}

class _HomeBannersState extends State<HomeBanners> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = getValueForScreenType(medium: 210, large: 310).h;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: height,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.banners.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      AppFunctions.unFocusKeyboard();
                      AppFunctions.showAppDialog<void>(
                        context,
                        child: ImageViewDialog(
                          images:
                              widget.banners.map((banner) => banner).toList(),
                          initialIndex: _currentIndex,
                        ),
                      );
                    },
                    child: AppCachedImage(
                      imageUrl: banner,
                      memCacheHeight: (height - 20).cacheSize(context),
                      height: height,
                      width: double.maxFinite,
                      onTap: () {
                        AppFunctions.unFocusKeyboard();
                        AppFunctions.showAppDialog<void>(
                          context,
                          child: ImageViewDialog(
                            images:
                                widget.banners.map((banner) => banner).toList(),
                            initialIndex: _currentIndex,
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }).toList(),
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: AppDots(
              currentIndex: _currentIndex,
              length: widget.banners.length,
            ),
          ),
        ],
      ),
    );
  }
}
