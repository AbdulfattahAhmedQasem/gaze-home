import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';

class TFPrefixIcon extends StatelessWidget {
  const TFPrefixIcon({required this.icon, super.key});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: getValueForScreenType(medium: 0, semiLarge: 6.w),
      ),
      child: SvgPicture.asset(
        icon,
        width: getValueForScreenType(medium: 20, semiLarge: 22).r,
        height: getValueForScreenType(medium: 20, semiLarge: 22).r,
        colorFilter: AppColors.colorFliter(context.colorScheme.primary),
      ),
    );
  }
}
