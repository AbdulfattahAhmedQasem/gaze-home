import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({required this.price, super.key});

  final num price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${price.toFixedDecimalNo()} ',
          style: AppTextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        Text(
          AppStrings.sar.tr(),
          style: AppTextStyle(
            fontSize: 14.sp,
            color: context.colorScheme.primary,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
      ],
    );
  }
}
