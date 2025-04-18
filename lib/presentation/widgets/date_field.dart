import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_converter.dart';
import 'package:gazhome/presentation/widgets/app_text_field.dart';
import 'package:gazhome/presentation/widgets/t_f_suffix_icon.dart';

class DateField extends StatelessWidget {
  const DateField({required this.controller, super.key, this.validator});

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDatePicker(context);
      },
      child: AppTextField(
        controller: controller,
        hintText: 'DD / MM / YYYY',
        enabled: false,
        border: AppStyles.decoratedTFBorder(borderColor: AppColors.border),
        suffixIcon: TFSuffixIcon(icon: AppSvgs.calendar, size: 18.r),
        validator: validator,
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    final currentDate = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: AppConverter.formatTextToDate(controller.text),
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 100),
      builder: (context, child) {
        return Transform.scale(
          scale: getValueForScreenType(medium: 1, semiLarge: 2, large: 2),
          child: Theme(
            data: ThemeData(
              datePickerTheme: DatePickerThemeData(
                headerHelpStyle: AppTextStyle(
                  fontSize:
                      getValueForScreenType(
                        medium: 10,
                        semiLarge: 5,
                        large: 5,
                      ).sp,
                ),
                headerHeadlineStyle: AppTextStyle(
                  fontSize:
                      getValueForScreenType(
                        medium: 14,
                        semiLarge: 7,
                        large: 7,
                      ).sp,
                ),
                weekdayStyle: AppTextStyle(
                  fontSize:
                      getValueForScreenType(
                        medium: 12,
                        semiLarge: 6,
                        large: 6,
                      ).sp,
                ),
                dayStyle: AppTextStyle(
                  fontSize:
                      getValueForScreenType(
                        medium: 12,
                        semiLarge: 6,
                        large: 6,
                      ).sp,
                ),
                yearStyle: AppTextStyle(
                  fontSize:
                      getValueForScreenType(
                        medium: 10,
                        semiLarge: 5,
                        large: 5,
                      ).sp,
                ),
                cancelButtonStyle: TextButton.styleFrom(
                  textStyle: AppTextStyle(
                    fontSize:
                        getValueForScreenType(
                          medium: 11,
                          semiLarge: 5,
                          large: 5,
                        ).sp,
                  ),
                  foregroundColor: context.colorScheme.secondary,
                ),
                confirmButtonStyle: TextButton.styleFrom(
                  textStyle: AppTextStyle(
                    fontSize:
                        getValueForScreenType(
                          medium: 11,
                          semiLarge: 5,
                          large: 5,
                        ).sp,
                  ),
                  foregroundColor: context.colorScheme.secondary,
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    ).then((date) {
      if (date != null) {
        controller.text = AppConverter.formatDateToText(date);
      }
    });
  }
}
