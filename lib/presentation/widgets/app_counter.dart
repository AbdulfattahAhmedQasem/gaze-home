import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/presentation/cubit/counter/counter_cubit.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';

class AppCounter extends StatelessWidget {
  const AppCounter({
    super.key,
    this.onIncrement,
    this.onDecrement,
    this.isIncreaseLoading = false,
    this.isDecreaseLoading = false,
  });

  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final bool isIncreaseLoading;
  final bool isDecreaseLoading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isIncreaseLoading)
              AppLoading.inline()
            else
              AppButton(
                padding: EdgeInsets.all(
                  getValueForScreenType(medium: 8, semiLarge: 10).r,
                ),
                onPressed: () {
                  if (!isDecreaseLoading) {
                    onIncrement?.call();
                    context.read<CounterCubit>().increase();
                  }
                },
                child: SvgPicture.asset(
                  AppSvgs.plus,
                  width: getValueForScreenType(medium: 12, semiLarge: 16).r,
                  height: getValueForScreenType(medium: 12, semiLarge: 16).r,
                ),
              ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Text(
                    '${state.quantity}/',
                    style: AppTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Text(
                      '${state.availableQuantity}',
                      style: AppTextStyle(
                        fontSize: 11.sp,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isDecreaseLoading)
              AppLoading.inline()
            else
              AppButton(
                padding: EdgeInsets.all(
                  getValueForScreenType(medium: 8, semiLarge: 10).r,
                ),
                onPressed: () {
                  if (!isIncreaseLoading) {
                    onDecrement?.call();
                    context.read<CounterCubit>().decrease();
                  }
                },
                child: SvgPicture.asset(
                  AppSvgs.minus,
                  width: getValueForScreenType(medium: 12, semiLarge: 16).r,
                  height: getValueForScreenType(medium: 12, semiLarge: 16).r,
                ),
              ),
          ],
        );
      },
    );
  }
}
