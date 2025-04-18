import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_fonts.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/theming/app_colors.dart';

ThemeData appTheme = ThemeData(
  fontFamily: AppFonts.primary,
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AppColors.background,
  hintColor: AppColors.hint,
  primaryColorLight: AppColors.primaryLight,

  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    shadow: AppColors.shadow,
    error: AppColors.red,
  ),
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.transparent,
    backgroundColor: AppColors.appBarBackground,
    shadowColor: AppColors.shadow,
    elevation: 0,
    centerTitle: false,
    foregroundColor: Colors.white,
    titleSpacing: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.c333333,
      elevation: 0,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      disabledForegroundColor: AppColors.c1f618d,
      foregroundColor: AppColors.c1f618d,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    filled: true,
    fillColor: AppColors.fillColor,
    errorMaxLines: 2,
  ),
  dividerTheme: DividerThemeData(
    thickness: AppSizes.divider.r,
    color: AppColors.border,
  ),
  iconTheme: IconThemeData(size: AppSizes.iconSize.r),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStatePropertyAll(AppColors.c9BA1A5),
    thickness: WidgetStatePropertyAll(6.r),
    trackColor: WidgetStatePropertyAll(AppColors.cEDEDED),
    trackBorderColor: const WidgetStatePropertyAll(Colors.transparent),
    radius: Radius.circular(10.r),
  ),
);
