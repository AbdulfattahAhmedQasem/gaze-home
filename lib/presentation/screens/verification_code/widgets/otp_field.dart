import 'dart:async';

import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/widgets/app_text_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    required this.controller,
    required this.node,
    required this.resendAction,
    this.autoFocus = true,
    this.onCompleted,
    this.validator,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode node;
  final bool autoFocus;
  final Future<bool> Function() resendAction;
  final void Function(String)? onCompleted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                getValueForScreenType(medium: 2, large: 4) *
                AppSizes.hScreenPadding.w,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: PinCodeTextField(
              controller: controller,
              focusNode: node,
              autoFocus: autoFocus,
              length: 4,
              hintCharacter: '✶',
              hintStyle: AppTextStyle(
                color: AppColors.border,
                fontSize: getValueForScreenType(medium: 20, large: 34).sp,
              ),
              animationType: AnimationType.fade,
              textStyle: AppTextStyle(
                fontSize: getValueForScreenType(medium: 16, large: 30).sp,
                fontWeight: FontWeightHelper.bold,
              ),
              keyboardType: TextInputType.number,
              cursorHeight: getValueForScreenType(medium: 1, large: 2).h,
              cursorWidth: getValueForScreenType(medium: 10, large: 16).w,
              pinTheme: PinTheme(
                fieldOuterPadding: EdgeInsets.zero,
                shape: PinCodeFieldShape.box,
                borderWidth: AppSizes.border.r,
                errorBorderWidth: AppSizes.border.r,
                activeBorderWidth: AppSizes.border.r,
                disabledBorderWidth: AppSizes.border.r,
                inactiveBorderWidth: AppSizes.border.r,
                selectedBorderWidth: AppSizes.border.r,
                fieldHeight: getValueForScreenType(medium: 56.r, large: 80.r),
                fieldWidth: getValueForScreenType(medium: 56.r, large: 80.r),
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: context.colorScheme.primary,
                inactiveColor: AppColors.border,
                selectedColor: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(14.r),
              ),
              animationDuration: AppFunctions.duration300ms,
              backgroundColor: Colors.transparent,
              cursorColor: context.colorScheme.primary,
              enableActiveFill: true,
              beforeTextPaste: (text) {
                return true;
              },
              enablePinAutofill: false,
              appContext: context,
              onCompleted: onCompleted,
              validator: validator,
            ),
          ),
        ),
        40.vSpace,
        OtpTimer(resendAction),
      ],
    );
  }
}

class OtpTimer extends StatefulWidget {
  const OtpTimer(this.resendAction, {super.key});
  final Future<bool> Function() resendAction;

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  int _duration = 60;
  String _time = '01:00';

  Timer? _timer;

  @override
  void didChangeDependencies() {
    _startTimer();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_duration > 0)
          Text(
            _time,
            style: AppTextStyle(
              fontSize: getValueForScreenType(medium: 14, large: 24).sp,
            ),
          ),
        AppTextButton(
          onPressed: () async {
            if (_duration <= 0) {
              await widget.resendAction().then((isSent) {
                if (isSent) {
                  showLog(isSent);
                  _startTimer();
                }
              });
            }
          },
          title: AppStrings.resendCode.tr(),
        ),
      ],
    );
  }

  void _startTimer() {
    _duration = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_duration > 0) {
        setState(() {
          _duration--;
          final min = (_duration / 60).floor();
          final sec = _duration % 60;
          _time = '${min >= 10 ? min : '0$min'}:${sec >= 10 ? sec : '0$sec'}';
        });
      } else {
        _timer?.cancel();
      }
    });
  }
}
