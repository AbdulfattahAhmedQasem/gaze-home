import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/theming/app_colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    this.child,
    super.key,
    this.padding,
    this.height,
    this.width,
    this.alignment,
    this.shape = BoxShape.rectangle,
    this.border,
    this.borderColor,
    this.backgroundColor,
  });

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final BoxShape shape;
  final BoxBorder? border;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        shape: shape,
        color: backgroundColor,
        border: border ??
            Border.all(
              color: borderColor ?? AppColors.cC1C1C1,
              width: AppSizes.border.r,
            ),
        borderRadius: shape == BoxShape.circle ? null : AppSizes.borderRadius,
      ),
      child: child,
    );
  }
}
