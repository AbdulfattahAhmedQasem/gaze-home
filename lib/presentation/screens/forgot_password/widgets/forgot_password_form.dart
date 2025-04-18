import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/core/utilities/validator_mixin.dart';
import 'package:gazhome/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:gazhome/presentation/widgets/app_check_box.dart';
import 'package:gazhome/presentation/widgets/password_field.dart';
import 'package:gazhome/presentation/widgets/phone_field.dart';

class ForgotPasswordForm extends StatelessWidget with ValidatorMixin {
  const ForgotPasswordForm({required this.step, super.key});

  final ForgotPasswordStep step;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();

    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen:
          (previous, current) =>
              previous.autovalidateMode != current.autovalidateMode ||
              previous.userType != current.userType,
      builder: (context, state) {
        return Form(
          key: cubit.data.formKey,
          autovalidateMode: state.autovalidateMode,
          child: Column(
            children: [
              if (step.isSend()) ...[
                PhoneField(
                  controller: cubit.data.phoneNumberController,
                  validator: validatePhoneNumber,
                  onSubmitted: (_) => cubit.sendCode(),
                ),
                if (!sl<SharedData>().isChangePassword) ...[
                  AppSizes.inset.vSpace,
                  AppCheckBox(
                    isChecked: state.userType.isDriver(),
                    title: AppStrings.isYouADriver.tr(),
                    onChanged: cubit.changeUserType,
                  ),
                ],
              ] else ...[
                PasswordField(
                  controller: cubit.data.passwordController,
                  nextNode: cubit.data.confirmPasswordNode,
                  textInputAction: TextInputAction.next,
                  validator: validatePassword,
                ),
                AppSizes.inset.vSpace,
                PasswordField(
                  controller: cubit.data.confirmPasswordController,
                  labelText: AppStrings.confirmPassword.tr(),
                  focusNode: cubit.data.confirmPasswordNode,
                  validator:
                      (confirmPassword) => validateConfirmPassword(
                        confirmPassword,
                        cubit.data.passwordController.text,
                      ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
