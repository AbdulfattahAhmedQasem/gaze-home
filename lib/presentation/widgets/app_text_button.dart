import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.onPressed,
    required this.title,
    super.key,
    this.textDecoration,
    this.color,
  });

  final VoidCallback onPressed;
  final String title;
  final TextDecoration? textDecoration;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      ),
      child: Text(
        title,
        style: AppStyles.textButtonStyle.copyWith(
          decoration: textDecoration,
          decorationColor: AppColors.c1f618d,
          color: color,
        ),
      ),
    );
  }
}
