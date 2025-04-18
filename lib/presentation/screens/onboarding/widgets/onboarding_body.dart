import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/data/models/onboarding_model.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({required this.onboarding, super.key});

  final OnboardingModel onboarding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(onboarding.image)),
        Expanded(
          child: Column(
            children: [
              Text(
                onboarding.title,
                style: AppTextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              64.vSpace,
              Text(
                onboarding.description,
                style: AppTextStyle(fontSize: 14.sp, color: AppColors.c9D9D9D),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
