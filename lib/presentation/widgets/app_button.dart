import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    this.text,
    this.child,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.textStyle,
    this.borderColor,
    this.padding,
    this.borderRadius,
    this.inkWellBorderRadius,
    this.shape = BoxShape.rectangle,
    this.alignment,
    this.border,
  });

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BorderRadius? inkWellBorderRadius;
  final BoxShape shape;
  final AlignmentGeometry? alignment;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: inkWellBorderRadius ?? AppSizes.borderRadius,
      child: AnimatedContainer(
        duration: AppFunctions.duration300ms,
        width: width,
        height: height,
        padding: padding ?? AppSizes.buttonPadding,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: shape,
          border:
              border ??
              Border.all(
                color: borderColor ?? AppColors.cC1C1C1,
                width: AppSizes.border.r,
              ),
          borderRadius:
              shape == BoxShape.circle
                  ? null
                  : borderRadius ?? AppSizes.borderRadius,
        ),
        alignment: alignment ?? Alignment.center,
        child:
            child ??
            Text(
              text ?? '',
              style: textStyle ?? AppStyles.buttonStyle(textColor),
            ),
      ),
    );
  }
}

class AppDecoratedButton extends StatelessWidget {
  const AppDecoratedButton({
    super.key,
    this.onPressed,
    this.text,
    this.color,
    this.padding,
    this.textStyle,
  });

  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: AppSizes.borderRadius,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color ?? context.colorScheme.primary,
          borderRadius: AppSizes.borderRadius,
        ),
        child: ClipPath(
          clipper: _MyCustomClipper(),
          child: InkWell(
            child: AnimatedContainer(
              duration: AppFunctions.duration300ms,
              padding: padding ?? AppSizes.buttonPadding,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.cC1C1C1,
                  width: AppSizes.border.r,
                ),
                borderRadius: AppSizes.borderRadius,
              ),
              child: FittedBox(
                fit: BoxFit.none,
                child: Text(
                  text ?? '',
                  style: textStyle ?? AppStyles.buttonStyle(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path =
        Path()
          ..moveTo(0, size.height * 0.5)
          ..lineTo(size.width * 0.3, size.height)
          ..lineTo(size.width, size.height)
          ..lineTo(size.width, size.height * 0.5)
          ..lineTo(size.width * 0.7, 0)
          ..lineTo(0, 0)
          ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
