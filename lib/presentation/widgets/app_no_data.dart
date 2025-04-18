import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';

class AppNoData extends StatelessWidget {
  const AppNoData({this.message, this.icon, super.key});

  final String? message;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppImages.noData));
  }
}

class InlineNoDataWidget extends StatelessWidget {
  const InlineNoDataWidget({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message ?? AppStrings.noData.tr(),
      style: AppTextStyle(
        fontSize: getValueForScreenType(medium: 14, large: 24).sp,
        color: AppColors.c333333,
      ),
    );
  }
}
