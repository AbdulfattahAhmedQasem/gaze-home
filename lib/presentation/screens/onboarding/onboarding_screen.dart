import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/data/static_data/static_data.dart';
import 'package:gazhome/presentation/screens/onboarding/widgets/onboarding_bar.dart';
import 'package:gazhome/presentation/screens/onboarding/widgets/onboarding_body.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var _index = 0;
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: AppSizes.screenPadding,
      body: Column(
        children: [
          OnboardingBar(index: _index),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _index = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingBody(
                  onboarding: onboardingData[index],
                );
              },
              itemCount: onboardingData.length,
            ),
          ),
          AppDecoratedButton(
            onPressed: () {
              if (_index < 2) {
                _index++;
                _controller.animateToPage(
                  _index,
                  duration: AppFunctions.duration300ms,
                  curve: Curves.easeInOut,
                );
              } else {
                context.pushReplacementNamed(Routes.main);
              }
            },
            text: _index == 2 ? AppStrings.start.tr() : AppStrings.next.tr(),
          ),
        ],
      ),
    );
  }
}
