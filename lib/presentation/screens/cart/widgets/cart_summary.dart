import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/make_order/make_order_cubit.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    required this.numberOfProducts,
    required this.totalCost,
    super.key,
  });

  final int numberOfProducts;
  final num totalCost;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      backgroundColor: context.colorScheme.primary,
      borderColor: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${totalCost.toFixedDecimalNo()} ${AppStrings.sar1.tr()}',
              style: AppTextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeightHelper.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<MakeOrderCubit, MakeOrderState>(
              listener: _listener,
              builder: (context, state) {
                return state.createState.isLoading()
                    ? AppLoading.inline(color: Colors.white)
                    : AppButton(
                      onPressed: context.read<MakeOrderCubit>().createOrder,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      backgroundColor: Colors.white,
                      borderColor: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            AppStrings.completePay.tr(),
                            style: AppTextStyle(
                              fontSize: 10.sp,
                              color: AppColors.c333333,
                              fontWeight: FontWeightHelper.bold,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: context.isRTL() ? 2 : 0,
                            child: SvgPicture.asset(
                              AppSvgs.arrow,
                              width: 14.r,
                              height: 14.r,
                            ),
                          ),
                        ],
                      ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _listener(BuildContext context, MakeOrderState state) {
    if (state.createState.hasError()) {
      AppFunctions.showToast(state.message);
    } else if (state.createState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
      context.pushNamed(
        Routes.completeOrder,
        arguments: context.read<MakeOrderCubit>(),
      );
    }
  }
}
