import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/presentation/dialogs/base_dialog.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class QuitDialog extends StatelessWidget {
  const QuitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppSvgs.error,
            width: getValueForScreenType(medium: 50, semiLarge: 70).r,
            height: getValueForScreenType(medium: 50, semiLarge: 70).r,
          ),
          24.vSpace,
          Text(
            AppStrings.doYouWantToQuit.tr(),
            style: AppTextStyle(
              fontSize: getValueForScreenType(medium: 14, semiLarge: 12).sp,
              color: AppColors.c272727,
            ),
            textAlign: TextAlign.center,
          ),
          46.vSpace,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  onPressed: () async {
                    await SystemNavigator.pop();
                  },
                  text: AppStrings.yes.tr(),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  backgroundColor: context.colorScheme.primary,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
              ),
              12.w.hSpace,
              Expanded(
                child: AppButton(
                  onPressed: () {
                    context.pop();
                  },
                  text: AppStrings.no.tr(),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  backgroundColor: AppColors.cEDEDED,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
