import 'package:flutter/material.dart';
import 'package:gazhome/core/extensions/string_extension.dart';

class AppColors {
  const AppColors._();

  static final primary = '#F69E05'.color;
  static final primaryLight = primary.withValues(alpha: 0.19);
  static final secondary = '#B72446'.color;
  static final background = '#FFFFFF'.color;
  static final appBarBackground = '#FFFFFF'.color;
  static final border = '#C1C1C1'.color;
  static final cC1C1C1 = '#C1C1C1'.color;
  static final fieldBorder = '#E8E8E8'.color;
  static final shadow = '#000000'.color.withValues(alpha: 0.16);
  static final hint = '#81878A'.color;
  static final red = '#B72446'.color;
  static final fillColor = '#FFFFFF'.color;
  static final c57EB4D = '#27ae60'.color;

  static final c373B55 = '#373B55'.color;
  static final c1f618d = '#1f618d'.color;
  static final cFEEE00 = '#FEEE00'.color;
  static final c555555 = '#555555'.color;
  static final cE5E5E5 = '#E5E5E5'.color;
  static final c9D9D9D = '#9D9D9D'.color;
  static final c333333 = '#333333'.color;
  static final c272727 = '#272727'.color;

  static final c9BA1A5 = '#9BA1A5'.color;
  static final cEDEDED = '#EDEDED'.color;

  static ColorFilter colorFliter(Color color) =>
      ColorFilter.mode(color, BlendMode.srcIn);
}
