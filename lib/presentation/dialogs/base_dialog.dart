import 'package:flutter/material.dart';
import 'package:gazhome/core/constants/app_sizes.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({super.key, this.child, this.padding});

  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: AppSizes.borderRadius),
      titlePadding: EdgeInsets.zero,
      contentPadding: AppSizes.screenPadding,
      content: child,
    );
  }
}
