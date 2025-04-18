import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class OnboardingBar extends StatelessWidget {
  const OnboardingBar({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _Bar(isCurrent: index >= 0),
              AppSizes.inset.hSpace,
              _Bar(isCurrent: index >= 1),
              AppSizes.inset.hSpace,
              _Bar(isCurrent: index >= 2),
            ],
          ),
          12.vSpace,
          AppButton(
            width: 120.w,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
            text: AppStrings.skip.tr(),
            onPressed: () {
              context.pushReplacementNamed(Routes.main);
            },
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.isCurrent});

  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: AppFunctions.duration300ms,
        height: 4.h,
        color: isCurrent ? context.colorScheme.primary : AppColors.cE5E5E5,
      ),
    );
  }
}
