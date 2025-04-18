import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';

class AppRadioTile<T> extends StatelessWidget {
  const AppRadioTile({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.icon,
    super.key,
  });

  final String title;
  final T? value;
  final T? groupValue;
  final void Function(T value) onChanged;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (value != null) {
          onChanged(value as T);
        }
      },
      child: AppContainer(
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 12.h),
        width: double.maxFinite,
        border: Border.all(
          color: AppStyles.radioColor(value == groupValue),
          width: AppSizes.border.r,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: AppFunctions.duration300ms,
              height: AppSizes.radioSize.r,
              width: AppSizes.radioSize.r,
              padding: AppSizes.radioPadding,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppStyles.radioColor(value == groupValue),
                  width: AppSizes.border.r,
                ),
              ),
              child:
                  value == groupValue
                      ? Center(
                        child: AnimatedContainer(
                          duration: AppFunctions.duration300ms,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppStyles.radioColor(value == groupValue),
                          ),
                        ),
                      )
                      : const SizedBox.shrink(),
            ),
            7.hSpace,
            Text(
              title,
              style: AppStyles.radioTitleStyle(
                AppStyles.radioColor(value == groupValue),
              ),
            ),
            if (icon != null) ...[
              const Spacer(),
              SvgPicture.asset(icon!, width: 16.r, height: 16.r),
            ],
          ],
        ),
      ),
    );
  }
}
