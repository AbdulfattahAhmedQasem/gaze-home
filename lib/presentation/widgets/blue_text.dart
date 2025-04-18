import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';

class BlueText extends StatelessWidget {
  const BlueText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.c1f618d,
      ),
    );
  }
}
