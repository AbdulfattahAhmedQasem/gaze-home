import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/responsive/context_extension.dart';

extension NumExtension on num {
  SizedBox get vSpace => SizedBox(height: toDouble().h);
  SizedBox get hSpace => SizedBox(width: toDouble().w);
  int cacheSize(BuildContext context) =>
      (this * context.mediaQuery.devicePixelRatio).round();

  String toFixedDecimalNo() => toStringAsFixed(2);
}
