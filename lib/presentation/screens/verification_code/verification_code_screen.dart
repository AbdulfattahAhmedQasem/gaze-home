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
import 'package:gazhome/presentation/cubit/verification_code/verification_code_cubit.dart';
import 'package:gazhome/presentation/dialogs/action_dialog.dart';
import 'package:gazhome/presentation/screens/verification_code/widgets/otp_field.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/auth_text.dart';
import 'package:gazhome/presentation/widgets/back_icon.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({
    required this.route,
    required this.autoFocus,
    super.key,
  });

  final VerificationCodeRoute route;
  final bool autoFocus;

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final _otpController = TextEditingController();
  final _otpNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, __) {
        if (didPop) {
          return;
        }
        _back();
      },
      child: BlocListener<VerificationCodeCubit, VerificationCodeState>(
        listener: _listener,
        child: AppScaffold(
          appBar: AppBarWidget(leading: BackIcon(onPressed: _back)),
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
                      title: widget.route.title.tr(),
                      description: widget.route.description.tr(),
                    ),
                    24.vSpace,
                    OtpField(
                      controller: _otpController,
                      node: _otpNode,
                      autoFocus: widget.autoFocus,
                      resendAction: () {
                        return context
                            .read<VerificationCodeCubit>()
                            .resendCode();
                      },
                      onCompleted: _submit,
                    ),
                    const Spacer(),
                    AppSizes.inset.vSpace,
                    AppDecoratedButton(
                      text: AppStrings.next.tr(),
                      onPressed: () {
                        _submit(_otpController.text);
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

  void _submit(String otp) {
    if (widget.route.isFromLogin() ||
        widget.route.isFromRegister() ||
        (widget.route.isFromForgotPassword() &&
            sl<SharedData>().userType.isDriver())) {
      context.read<VerificationCodeCubit>().verifyCode(otp);
    } else if (widget.route.isFromAccount()) {
      context.read<VerificationCodeCubit>().verifyPhoneNumber(otp);
    } else {
      context.read<VerificationCodeCubit>().confirmCode(otp);
    }
  }

  void _back() {
    sl<SharedData>().clearToken();
    if (widget.route.isFromForgotPassword() || widget.route.isFromAccount()) {
      context.pop();
    } else {
      context.popUntil(Routes.auth);
    }
  }

  void _listener(BuildContext context, VerificationCodeState state) {
    AppFunctions.handleCubitListener(
      context,
      requestState: state.submitState,
      message: state.message,
      onError: () {
        _otpController.clear();
        FocusScope.of(context).requestFocus(_otpNode);
      },
      onLoaded: () {
        if (widget.route.isFromForgotPassword()) {
          AppFunctions.showToast(state.message, type: MessageType.success);
          context.pushReplacementNamed(
            Routes.forgotPassword,
            arguments: ForgotPasswordStep.reset,
          );
        } else if (widget.route.isFromAccount()) {
          AppFunctions.showToast(state.message, type: MessageType.success);
          context.pop();
        } else {
          AppFunctions.showAppDialog<void>(
            context,
            child: ActionDialog(
              title: AppStrings.completedSuccessfully.tr(),
              type: MessageType.success,
              onPressed: () {
                context.pop(true);
              },
            ),
          ).then((_) {
            context.pop(true);
          });
        }
      },
    );

    AppFunctions.handleCubitListener(
      context,
      requestState: state.resendState,
      message: state.message,
      onError: () {
        _otpController.clear();
        FocusScope.of(context).requestFocus(_otpNode);
      },
      onLoaded: () {
        AppFunctions.showToast(state.message, type: MessageType.success);
        _otpController.clear();
        FocusScope.of(context).requestFocus(_otpNode);
      },
    );
  }
}
