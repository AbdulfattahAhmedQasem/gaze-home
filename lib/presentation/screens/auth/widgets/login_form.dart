import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/core/utilities/validator_mixin.dart';
import 'package:gazhome/presentation/cubit/login/login_cubit.dart';
import 'package:gazhome/presentation/widgets/app_check_box.dart';
import 'package:gazhome/presentation/widgets/app_text_button.dart';
import 'package:gazhome/presentation/widgets/password_field.dart';
import 'package:gazhome/presentation/widgets/phone_field.dart';

class LoginForm extends StatelessWidget with ValidatorMixin {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.autovalidateMode != current.autovalidateMode ||
          previous.userType != current.userType,
      builder: (context, state) {
        return Form(
          key: cubit.data.formKey,
          autovalidateMode: state.autovalidateMode,
          child: Column(
            children: [
              PhoneField(
                controller: cubit.data.phoneNumberController,
                nextNode: cubit.data.passwordNode,
                textInputAction: TextInputAction.next,
                validator: validatePhoneNumber,
              ),
              AppSizes.inset.vSpace,
              PasswordField(
                controller: cubit.data.passwordController,
                focusNode: cubit.data.passwordNode,
                validator: validatePassword,
              ),
              AppSizes.inset.vSpace,
              AppCheckBox(
                isChecked: state.userType.isDriver(),
                title: AppStrings.isYouADriver.tr(),
                onChanged: cubit.changeUserType,
              ),
              64.vSpace,
              AppTextButton(
                onPressed: () {
                  sl<SharedData>().userType = UserType.individual;
                  context
                      .pushNamed(
                    Routes.forgotPassword,
                    arguments: ForgotPasswordStep.send,
                  )
                      .then((_) {
                    sl<SharedData>().userType = state.userType;
                  });
                },
                title: AppStrings.forgotPassword.tr(),
                textDecoration: TextDecoration.underline,
              ),
            ],
          ),
        );
      },
    );
  }


  void _listener(BuildContext context, LoginState state) {
    AppFunctions.handleCubitListener(
      context,
      requestState: state.requestState,
      message: state.message,
      onError: () {
        if (state.goToVerificationCodeScreen) {
          context.pushNamed(
            Routes.verificationCode,
            arguments: {
              'phone': '+966${context.read<LoginCubit>().data.phoneNumberController.text}',
              'route': VerificationCodeRoute.login,
            },
          );
        }
      },
      onLoaded: () {
        AppFunctions.showToast(state.message, type: MessageType.success);
        context.pop();
      },
    );
  }
}
