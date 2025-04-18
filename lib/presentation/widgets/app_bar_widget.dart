import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/presentation/widgets/app_logo.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.customTitle,
    this.leading,
    this.actions = const [],
    this.showShadow = false,
  });

  final String? title;
  final Widget? customTitle;
  final Widget? leading;
  final List<Widget> actions;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:
            showShadow
                ? [
                  BoxShadow(
                    color: context.colorScheme.shadow,
                    blurRadius: 4.r,
                    spreadRadius: -4.r,
                    offset: Offset(0, 4.r),
                  ),
                ]
                : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.hScreenPadding.w,
          vertical: 12.h,
        ),
        child: Row(
          children: [
            if (leading != null) leading!,
            ...[
              if (leading != null && customTitle == null) const Spacer(),
              customTitle ?? AppLogo(title: title),
            ],
            if (actions.isNotEmpty) ...[const Spacer(), ...actions],
          ],
        ),
      ),
    );
  }
}
