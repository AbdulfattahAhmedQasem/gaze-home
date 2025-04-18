import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/presentation/widgets/app_text_field.dart';
import 'package:gazhome/presentation/widgets/t_f_prefix_icon.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    required this.controller,
    super.key,
    this.focusNode,
    this.nextNode,
    this.validator,
    this.onSubmitted,
    this.textInputAction,
    this.enabled = true,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: AppStrings.phoneNumber.tr(),
      keyboardType: TextInputType.phone,
      maxLength: 9,
      textInputAction: textInputAction,
      validator: validator,
      onSubmitted: onSubmitted,
      prefixIcon: const TFPrefixIcon(icon: AppSvgs.phoneNumber),
      enabled: enabled,
    );
  }
}
