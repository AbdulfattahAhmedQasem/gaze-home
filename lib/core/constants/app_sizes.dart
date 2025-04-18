import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';

class AppSizes {
  const AppSizes._();

  //*** Shared Sizes */
  static const double iconSize = 24;
  static const double elevation = 4;
  static const double bottomSheetRadius = 20;
  static const double border = 1;
  static double inset = 16;
  static double radius = 10;
  static BorderRadius borderRadius = BorderRadius.circular(radius.r);

  //*** Screen Sizes */
  static Size screenSize = const Size(430, 932);
  static double hScreenPadding = 24;
  static double vScreenPadding = 24;
  static EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: hScreenPadding.w,
    vertical: vScreenPadding.h,
  );

  //*** TextField Sizes */
  static double hTFPadding = 16;
  static EdgeInsetsGeometry tFcontentPadding = EdgeInsets.symmetric(
    horizontal: hTFPadding.w,
    vertical: getValueForScreenType(medium: 8, semiLarge: 14).h,
  );

  //*** Button Sizes */
  static EdgeInsetsGeometry buttonPadding = EdgeInsets.symmetric(
    horizontal: 40.w,
    vertical: 12.h,
  );

  //*** AppBar Sizes */
  static double appBarHeight = 50;

  //*** Divider Sizes */
  static const double divider = 1;

  //*** AppRadioTile Sizes */
  static const double radioSize = 16;
  static EdgeInsetsGeometry radioPadding = const EdgeInsets.all(3).r;

  //*** AppCheckBox Sizes */
  static const double checkBoxSize = 16;
  static EdgeInsetsGeometry checkBoxPadding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 16.h,
  );
}
