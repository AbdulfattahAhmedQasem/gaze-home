import 'package:easy_localization/easy_localization.dart' as lnag;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_launcher.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';

class DriverSupportBody extends StatelessWidget {
  const DriverSupportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppContainer(
          padding: EdgeInsets.all(16.r),
          child: Text(
            AppStrings.complaintsMessage.tr(),
            style: AppTextStyle(fontSize: 12.sp, color: AppColors.c272727),
          ),
        ),
        24.vSpace,
        AppContainer(
          padding: EdgeInsets.all(16.r),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.pleaseContactUsInCaseOfComplaint.tr(),
                  style: AppTextStyle(
                    fontSize: 10.sp,
                    color: AppColors.c1f618d,
                  ),
                ),
              ),
              AppButton(
                onPressed: () {
                  AppLauncher.launchWhatsApp(context, '59 456 6777');
                },
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                borderColor: Colors.transparent,
                child: Row(
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        '59 456 6777',
                        style: AppTextStyle(
                          fontSize: 12.sp,
                          color: AppColors.c272727,
                        ),
                      ),
                    ),
                    12.hSpace,
                    SvgPicture.asset(
                      AppSvgs.whatsApp,
                      width: 24.r,
                      height: 24.r,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
