import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_fonts.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/presentation/my_app.dart';

class AppStyles {
  const AppStyles._();

  //*** TextField Styles */
  static TextStyle tFStyle = AppTextStyle(
    color: AppColors.c333333,
    fontSize: getValueForScreenType(medium: 12, semiLarge: 10).sp,
  );
  static TextStyle tFHintStyle = AppTextStyle(
    color: AppColors.cC1C1C1,
    fontSize: getValueForScreenType(medium: 12, semiLarge: 10).sp,
  );
  static TextStyle tFLabelStyle = AppTextStyle(
    color: AppColors.cC1C1C1,
    fontSize: getValueForScreenType(medium: 12, semiLarge: 10).sp,
  );
  static TextStyle tFFloatingLabelStyle = AppTextStyle(
    color: AppColors.c333333,
    fontSize: getValueForScreenType(medium: 12, semiLarge: 10).sp,
  );
  static TextStyle tFerrorStyle = AppTextStyle(
    color: navigatorKey.currentContext?.colorScheme.error ?? AppColors.red,
    fontSize: 9.sp,
  );

  static OutlineInputBorder decoratedTFBorder({
    Color? borderColor,
    double? radius,
    BorderRadius? borderRadius,
  }) {
    return OutlineInputBorder(
      borderRadius:
          borderRadius ?? BorderRadius.circular(radius ?? AppSizes.radius.r),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.fieldBorder,
        width: AppSizes.border.r,
      ),
    );
  }

  //*** Button Styles */
  static TextStyle buttonStyle([Color? color]) => AppTextStyle(
        color: color ?? AppColors.c333333,
        fontSize: 11.sp,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle textButtonStyle = AppTextStyle(
    color: AppColors.c1f618d,
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.bold,
  );

  //*** CheckBox Tile Styles */
  static TextStyle checkBoxTitleStyle(Color color) => AppTextStyle(
        color: color,
        fontSize: getValueForScreenType(medium: 12, semiLarge: 10).sp,
      );
  static Color checkBoxColor(bool isChecked) => isChecked
      ? navigatorKey.currentContext!.colorScheme.primary
      : AppColors.cC1C1C1;

  //*** Radio Tile Styles */
  static TextStyle radioTitleStyle(Color color) => AppTextStyle(
        fontSize: getValueForScreenType(medium: 12, semiLarge: 10).sp,
        color: color,
      );
  static Color radioColor(bool isSelected) => isSelected
      ? navigatorKey.currentContext!.colorScheme.primary
      : AppColors.cC1C1C1;

  //*** Messages Styles */
  static TextStyle toastStyle = AppTextStyle(fontSize: 12.sp);
  static TextStyle loadingMessageStyle = AppTextStyle(
    fontSize: 12.sp,
    color: Colors.white,
  );
}

class AppTextStyle extends TextStyle {
  AppTextStyle({
    double fontSize = 14,
    Color super.color = Colors.black,
    FontWeight super.fontWeight = FontWeight.normal,
    super.letterSpacing,
    super.wordSpacing,
    super.decoration,
    super.decorationStyle,
    super.decorationColor,
    double? height,
  }) : super(
          fontSize:
              getValueForScreenType(medium: fontSize, semiLarge: fontSize - 4) +
                  (navigatorKey.currentContext!.isRTL() ? 0 : 1.sp),
          fontFamily: AppFonts.primary,
          height: height ?? 1.8,
        );
}
