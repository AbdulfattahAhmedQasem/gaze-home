import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.filled,
    this.fillColor,
    this.autofocus = false,
    this.textInputAction,
    this.focusNode,
    this.nextNode,
    this.initialValue,
    this.readOnly = false,
    this.contentPadding,
    this.expands = false,
    this.maxLength,
    this.showCounter = false,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final bool? filled;
  final Color? fillColor;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final String? initialValue;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final bool expands;
  final int? maxLength;
  final bool showCounter;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: '●',
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      style: textStyle ?? AppStyles.tFStyle,
      autofocus: autofocus,
      textInputAction: textInputAction,
      readOnly: readOnly,
      expands: expands,
      maxLength: maxLength,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted:
          onSubmitted ?? (_) => FocusScope.of(context).requestFocus(nextNode),
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyles.tFLabelStyle,
        floatingLabelStyle: AppStyles.tFFloatingLabelStyle,
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.tFHintStyle,
        errorStyle: errorStyle ?? AppStyles.tFerrorStyle,
        prefixIcon: prefixIcon == null
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [AppSizes.hTFPadding.hSpace, prefixIcon!],
              ),
        prefixIconConstraints: BoxConstraints(maxWidth: 45.w),
        suffixIcon: suffixIcon,
        filled: filled,
        fillColor: fillColor,
        contentPadding: contentPadding ?? AppSizes.tFcontentPadding,
        counterText: showCounter ? null : '',
        border: border ?? AppStyles.decoratedTFBorder(),
        enabledBorder: border ?? AppStyles.decoratedTFBorder(),
        disabledBorder: border ?? AppStyles.decoratedTFBorder(),
        focusedBorder: focusedBorder ??
            AppStyles.decoratedTFBorder(
              borderColor: context.colorScheme.primary,
            ),
        focusedErrorBorder: errorBorder ??
            AppStyles.decoratedTFBorder(borderColor: context.colorScheme.error),
        errorBorder: errorBorder ??
            AppStyles.decoratedTFBorder(borderColor: context.colorScheme.error),
      ),
    );
  }
}
