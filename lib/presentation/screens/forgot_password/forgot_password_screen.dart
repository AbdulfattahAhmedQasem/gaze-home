import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:gazhome/presentation/dialogs/action_dialog.dart';
import 'package:gazhome/presentation/screens/forgot_password/widgets/forgot_password_form.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/auth_text.dart';
import 'package:gazhome/presentation/widgets/back_icon.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({required this.step, super.key});

  final ForgotPasswordStep step;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, __) {
        if (didPop) {
          return;
        }
        _back(context);
      },
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: _listener,
        child: AppScaffold(
          appBar: AppBarWidget(
            leading: BackIcon(
              onPressed: () {
                _back(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: AppSizes.screenPadding,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: context.width,
                minHeight: context.height * 0.8,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    60.vSpace,
                    AuthText(
                      title: AppStrings.resetPassword.tr(),
                      description:
                          step.isSend()
                              ? AppStrings.enterPhoneNumber.tr()
                              : AppStrings.enterNewPassword.tr(),
                    ),
                    24.vSpace,
                    ForgotPasswordForm(step: step),
                    const Spacer(),
                    AppSizes.inset.vSpace,
                    AppDecoratedButton(
                      text: AppStrings.next.tr(),
                      onPressed: () {
                        switch (step) {
                          case ForgotPasswordStep.send:
                            cubit.sendCode();
                          case ForgotPasswordStep.reset:
                            cubit.resetPassword();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _back(BuildContext context) {
    sl<SharedData>().clearToken();
    if (sl<SharedData>().isChangePassword) {
      context.popUntil(Routes.main);
    } else {
      if (step.isReset()) {
        context.pop();
      } else {
        context.popUntil(Routes.auth);
      }
    }
  }

  void _listener(BuildContext context, ForgotPasswordState state) {
    AppFunctions.handleCubitListener(
      context,
      requestState: state.requestState,
      message: state.message,
      onLoaded: () {
        switch (step) {
          case ForgotPasswordStep.send:
            AppFunctions.showToast(state.message, type: MessageType.success);
            context.pushNamed(
              Routes.verificationCode,
              arguments: {
                'phone':
                    context
                        .read<ForgotPasswordCubit>()
                        .data
                        .phoneNumberController
                        .text,
                'route': VerificationCodeRoute.forgotPassword,
              },
            );
          case ForgotPasswordStep.reset:
            AppFunctions.showAppDialog<void>(
              context,
              child: ActionDialog(
                title: AppStrings.completedSuccessfully.tr(),
                type: MessageType.success,
                onPressed: () {
                  if (sl<SharedData>().isChangePassword) {
                    context.popUntil(Routes.main);
                  } else {
                    context.popUntil(Routes.auth);
                  }
                },
              ),
            ).then((_) {
              if (sl<SharedData>().isChangePassword) {
                context.popUntil(Routes.main);
              } else {
                context.popUntil(Routes.auth);
              }
            });
        }
      },
    );
  }
}
