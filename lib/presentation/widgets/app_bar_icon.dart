import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({required this.onPressed, super.key, this.icon, this.child});

  final VoidCallback onPressed;
  final String? icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      width: 45.r,
      height: 45.r,
      padding: EdgeInsets.zero,
      child: Center(
        child:
            child ??
            (icon != null
                ? SvgPicture.asset(
                  icon!,
                  colorFilter: AppColors.colorFliter(AppColors.c333333),
                  height: 18.r,
                  width: 18.r,
                )
                : null),
      ),
    );
  }
}
