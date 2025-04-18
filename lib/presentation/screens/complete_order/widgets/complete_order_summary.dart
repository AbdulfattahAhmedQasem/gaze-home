import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/data/models/order_summary_model.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';

class CompleteOrderSummary extends StatelessWidget {
  const CompleteOrderSummary({required this.orderSummary, super.key});

  final OrderSummaryModel orderSummary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppContainer(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.orderDetails.tr(),
                style: AppTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              7.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.totalPrice.tr(),
                    style: AppTextStyle(
                      fontSize: 10.sp,
                      color: AppColors.c272727,
                    ),
                  ),
                  Text(
                    '${orderSummary.totalCostAfterTax.toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
                    style: AppTextStyle(
                      fontSize: 10.sp,
                      color: AppColors.c57EB4D,
                    ),
                  ),
                ],
              ),
              7.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.shippingAndDeliveryCharges.tr(),
                    style: AppTextStyle(
                      fontSize: 10.sp,
                      color: AppColors.c272727,
                    ),
                  ),
                  Text(
                    '${orderSummary.shippingCost.toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
                    style: AppTextStyle(
                      fontSize: 10.sp,
                      color: AppColors.c57EB4D,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        12.vSpace,
        AppContainer(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.totalIncludingTax.tr(),
                style: AppTextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              Text(
                '${orderSummary.finalTotalCostAfterTax.toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
                style: AppTextStyle(
                  fontSize: 10.sp,
                  color: AppColors.c57EB4D,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
