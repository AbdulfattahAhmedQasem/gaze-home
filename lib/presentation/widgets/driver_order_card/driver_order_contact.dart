import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class DriverOrderContact extends StatelessWidget {
  const DriverOrderContact({
    required this.icon,
    required this.value,
    required this.onPressed,
    super.key,
  });

  final String icon;
  final String value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      borderColor: Colors.transparent,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24.r,
            height: 24.r,
          ),
          12.hSpace,
          Expanded(
            child: Text(
              value,
              style: AppTextStyle(
                fontSize: 12.sp,
                color: AppColors.c333333,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
