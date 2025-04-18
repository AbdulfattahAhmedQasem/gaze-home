import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';

class AuthText extends StatelessWidget {
  const AuthText({required this.title, required this.description, super.key});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyle(
              color: AppColors.c1f618d,
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(width: 16.w, child: Divider(height: 24.h)),
          const Spacer(),
          Text(
            description,
            style: AppTextStyle(
              color: AppColors.c333333,
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
