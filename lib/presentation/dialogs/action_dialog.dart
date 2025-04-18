import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/presentation/dialogs/base_dialog.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class ActionDialog extends StatelessWidget {
  const ActionDialog({
    required this.title,
    required this.type,
    this.onPressed,
    this.confirmText,
    this.actions,
    super.key,
  });

  final String title;
  final MessageType type;
  final VoidCallback? onPressed;
  final String? confirmText;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            type.icon,
            width: getValueForScreenType(medium: 50, semiLarge: 70).r,
            height: getValueForScreenType(medium: 50, semiLarge: 70).r,
          ),
          24.vSpace,
          Text(
            title,
            style: AppTextStyle(
              fontSize: getValueForScreenType(medium: 14, semiLarge: 12).sp,
              color: AppColors.c272727,
            ),
            textAlign: TextAlign.center,
          ),
          46.vSpace,
          actions ??
              AppDecoratedButton(
                onPressed: onPressed,
                text: confirmText ?? AppStrings.ok.tr(),
              ),
        ],
      ),
    );
  }
}
