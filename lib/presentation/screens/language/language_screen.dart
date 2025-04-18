import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/services/languagge_service.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/presentation/widgets/app_logo.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  AppImages.languageScreen,
                  width: double.maxFinite,
                  height: double.maxFinite,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: AppSizes.hScreenPadding.w,
                  right: AppSizes.hScreenPadding.w,
                  top: context.mediaQuery.padding.top + 20.h,
                  bottom: 0,
                  child: Column(
                    children: [
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: AppLogo(),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.welcomeTo.tr(),
                              style: AppTextStyle(fontSize: 30.sp),
                            ),
                            20.vSpace,
                            Text(
                              AppStrings.selectYourBestLanguage.tr(),
                              style: AppTextStyle(
                                fontSize: 14.sp,
                                color: AppColors.c1f618d,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2 * AppSizes.hScreenPadding.w,
                vertical: 2 * AppSizes.vScreenPadding.h,
              ),
              child: Column(
                children: [
                  _LanguageCard(
                    title: AppStrings.arabic,
                    onTap: () {
                      context.updateLanguage(Language.ar);
                    },
                  ),
                  AppSizes.inset.vSpace,
                  _LanguageCard(
                    title: AppStrings.english,
                    onTap: () {
                      context.updateLanguage(Language.en);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        context.pushReplacementNamed(Routes.onboarding);
      },
      borderRadius: BorderRadius.circular(AppSizes.radius.r),
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 23.w,
          end: 17.w,
          top: 17.h,
          bottom: 17.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.cC1C1C1,
            width: AppSizes.border.r,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radius.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle(fontSize: 14.sp, color: AppColors.c555555),
            ),
            RotatedBox(
              quarterTurns: context.isRTL() ? 2 : 0,
              child: SvgPicture.asset(AppSvgs.arrow, width: 16.r, height: 16.r),
            ),
          ],
        ),
      ),
    );
  }
}
