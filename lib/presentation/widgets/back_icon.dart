import 'package:flutter/material.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/presentation/widgets/app_bar_icon.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: context.isRTL() ? 0 : 2,

      child: AppBarIcon(
        onPressed: onPressed ?? context.pop,
        icon: AppSvgs.arrow,
      ),
    );
  }
}
