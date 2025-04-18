import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    required this.isChecked,
    this.onChanged,
    this.title,
    this.customTitle,
    this.flex = 0,
    this.size,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  final void Function(bool isChecked)? onChanged;
  final bool isChecked;
  final String? title;
  final Widget? customTitle;
  final int flex;
  final double? size;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged == null
          ? null
          : () {
              AppFunctions.unFocusKeyboard();
              onChanged!(!isChecked);
            },
      splashColor: Colors.black.withValues(alpha: 0.02),
      highlightColor: Colors.black.withValues(alpha: 0.02),
      borderRadius: AppSizes.borderRadius,
      child: AppContainer(
        borderColor: AppColors.fieldBorder,
        padding: AppSizes.checkBoxPadding,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Container(
              width: size ?? AppSizes.checkBoxSize.r,
              height: size ?? AppSizes.checkBoxSize.r,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppStyles.checkBoxColor(isChecked),
                  width: AppSizes.border.r,
                ),
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: isChecked
                  ? Center(
                      child: SvgPicture.asset(
                        AppSvgs.check,
                        height: getValueForScreenType(medium: 9, large: 22).r,
                        colorFilter: AppColors.colorFliter(
                          AppStyles.checkBoxColor(isChecked),
                        ),
                      ),
                    )
                  : null,
            ),
            if (customTitle != null)
              customTitle!
            else if (title != null) ...[
              7.hSpace,
              Expanded(
                flex: flex,
                child: Text(
                  title!,
                  style: AppStyles.checkBoxTitleStyle(
                    AppStyles.checkBoxColor(isChecked),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
