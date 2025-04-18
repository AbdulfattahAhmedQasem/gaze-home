import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';

class TFSuffixIcon extends StatelessWidget {
  const TFSuffixIcon({required this.icon, required this.size, super.key});

  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getValueForScreenType(medium: size, large: size * 2),
      height: getValueForScreenType(medium: size, large: size * 2),
      child: Center(
        child: SvgPicture.asset(
          icon,
          width: getValueForScreenType(medium: size, large: size * 2),
          height: getValueForScreenType(medium: size, large: size * 2),
        ),
      ),
    );
  }
}
