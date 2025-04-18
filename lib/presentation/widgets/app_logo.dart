import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(AppImages.logo, width: 26.r, height: 26.r),
        8.hSpace,
        Text(
          title ?? AppStrings.gazHome.tr(),
          style: AppTextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeightHelper.bold,
            color: context.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
