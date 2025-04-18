import 'package:flutter/material.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';

class ScreenTypeLayout extends StatelessWidget {
  const ScreenTypeLayout({
    required this.mobile,
    this.smallMobile,
    this.tablet,
    super.key,
  });

  final Widget mobile;
  final Widget? smallMobile;
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    final deviceScreenType = context.deviceScreenType;

    if (deviceScreenType.isLarge() && tablet != null) {
      return tablet!;
    } else if (deviceScreenType.isSmall() && smallMobile != null) {
      return smallMobile!;
    }
    return mobile;
  }
}
