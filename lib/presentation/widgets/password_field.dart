import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_text_field.dart';
import 'package:gazhome/presentation/widgets/t_f_prefix_icon.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.controller,
    this.labelText,
    super.key,
    this.focusNode,
    this.nextNode,
    this.validator,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String? labelText;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      nextNode: widget.nextNode,
      labelText: widget.labelText ?? AppStrings.password.tr(),
      obscureText: _isObscureText,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      prefixIcon: const TFPrefixIcon(icon: AppSvgs.lock),
      suffixIcon: Padding(
        padding: EdgeInsetsDirectional.only(
          end: getValueForScreenType(medium: 0, semiLarge: 6.w),
        ),
        child: AppButton(
          width: getValueForScreenType(medium: 16, semiLarge: 19).r,
          height: getValueForScreenType(medium: 16, semiLarge: 19).r,
          borderColor: Colors.transparent,
          padding: EdgeInsets.zero,
          child: SvgPicture.asset(
            AppSvgs.eye,
            colorFilter: _isObscureText
                ? null
                : AppColors.colorFliter(AppColors.c1f618d),
            width: getValueForScreenType(medium: 16, semiLarge: 18).r,
            height: getValueForScreenType(medium: 16, semiLarge: 18).r,
          ),
          onPressed: () {
            setState(() {
              _isObscureText = !_isObscureText;
            });
          },
        ),
      ),
    );
  }
}
