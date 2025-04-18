import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/utilities/app_functions.dart';

class AppDots extends StatelessWidget {
  const AppDots({required this.currentIndex, required this.length, super.key});

  final int currentIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    final dots = <Widget>[];
    for (var index = 0; index < length; index++) {
      dots.add(
        AnimatedContainer(
          duration: AppFunctions.duration300ms,
          height: getValueForScreenType(medium: 8, large: 16).r,
          width: getValueForScreenType(medium: 8, large: 16).r,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                index == currentIndex
                    ? context.colorScheme.primary
                    : AppColors.cEDEDED,
          ),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      color: Colors.black12,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dots.map((dot) => dot).toList(),
        ),
      ),
    );
  }
}
