import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/splash/splash_cubit.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.hScreenPadding.w),
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.when(
            language: () {
              context.pushReplacementNamed(Routes.language);
            },
            main: () {
              context.pushReplacementNamed(Routes.main);
            },
          );
        },
        child: SizedBox(
          width: double.maxFinite,
          child: TweenAnimationBuilder(
            duration: AppFunctions.duration2s,
            tween: Tween<double>(begin: context.height * 0.4, end: 120.h),
            curve: Curves.fastEaseInToSlowEaseOut,
            builder: (context, value, _) {
              return Container(
                height: getValueForScreenType(medium: 200, semiLarge: 300).r,
                width: getValueForScreenType(medium: 200, semiLarge: 300).r,
                margin: EdgeInsets.only(top: value),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: AppColors.cFEEE00, blurRadius: 100.r),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.gazHome.tr(),
                          style: AppTextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeightHelper.bold,
                            color: context.colorScheme.secondary,
                          ),
                        ),
                        12.hSpace,
                        Image.asset(AppImages.logo, width: 48.r, height: 48.r),
                      ],
                    ),
                    7.vSpace,
                    Text('V 1.1.1', style: AppTextStyle(fontSize: 14.sp)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
