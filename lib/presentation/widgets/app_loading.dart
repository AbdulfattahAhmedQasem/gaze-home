import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    required this.indicatorType,
    super.key,
    this.size,
    this.colors,
    this.message,
  });

  factory AppLoading.fetch() {
    return AppLoading(
      indicatorType: Indicator.ballBeat,
      size: getValueForScreenType(medium: 80, semiLarge: 100, large: 120).r,
    );
  }

  factory AppLoading.submit({String? message}) {
    return AppLoading(
      indicatorType: Indicator.orbit,
      size: getValueForScreenType(medium: 90, large: 120).r,
      colors: const [Colors.white],
      message: message,
    );
  }

  factory AppLoading.inline({Color? color}) {
    return AppLoading(
      indicatorType: Indicator.circleStrokeSpin,
      size: getValueForScreenType(medium: 25, large: 50).r,
      colors: color != null ? [color] : null,
    );
  }

  factory AppLoading.image() {
    return AppLoading(
      indicatorType: Indicator.ballScale,
      size: getValueForScreenType(medium: 50, large: 75).r,
    );
  }

  final Indicator indicatorType;
  final double? size;
  final List<Color>? colors;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: LoadingIndicator(
              indicatorType: indicatorType,
              colors:
                  colors ??
                  [context.colorScheme.primary, context.colorScheme.secondary],
            ),
          ),
          if (message != null) ...[
            AppSizes.inset.vSpace,
            Text(message!, style: AppStyles.loadingMessageStyle),
          ],
        ],
      ),
    );
  }
}
