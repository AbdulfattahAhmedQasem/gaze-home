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
import 'package:gazhome/presentation/cubit/login/login_cubit.dart';
import 'package:gazhome/presentation/cubit/register/register_cubit.dart';
import 'package:gazhome/presentation/screens/auth/widgets/auth_buttons.dart';
import 'package:gazhome/presentation/screens/auth/widgets/login_form.dart';
import 'package:gazhome/presentation/screens/auth/widgets/register_form.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/back_icon.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _authType = AuthType.login;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterCubit, RegisterState>(
          listener: _registerListener,
        ),
        BlocListener<LoginCubit, LoginState>(
          listener: _loginListener,
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          _backToMainScreen();
        },
        child: AppScaffold(
          appBar: AppBarWidget(
            leading: BackIcon(
              onPressed: _backToMainScreen,
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
                    12.vSpace,
                    AuthButtons(
                      authType: _authType,
                      onPressed: (authType) {
                        setState(() {
                          _authType = authType;
                        });
                      },
                    ),
                    62.vSpace,
                    AnimatedSwitcher(
                      duration: AppFunctions.duration300ms,
                      child: _authType.isLogin()
                          ? const LoginForm()
                          : const RegisterForm(),
                    ),
                    const Spacer(),
                    AppSizes.inset.vSpace,
                    AppDecoratedButton(
                      text: _authType.isLogin()
                          ? AppStrings.login.tr()
                          : AppStrings.register1.tr(),
                      onPressed: () {
                        if (_authType.isLogin()) {
                          context.read<LoginCubit>().login();
                        } else {
                          context.read<RegisterCubit>().register();
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

  void _backToMainScreen() {
    sl<SharedData>().userType = UserType.individual;
    context.pushReplacementNamed(Routes.main);
  }

  void _registerListener(BuildContext context, RegisterState state) {
    AppFunctions.handleCubitListener(
      context,
      requestState: state.requestState,
      message: state.message,
      onLoaded: () {
        AppFunctions.showToast(state.message, type: MessageType.success);
        final phoneNumber =
            context.read<RegisterCubit>().data.phoneNumberController.text;
        context.pushNamed(
          Routes.verificationCode,
          arguments: {
            'phone': phoneNumber,
            'route': VerificationCodeRoute.register,
          },
        ).then((isVerified) {
          if (((isVerified as bool?) ?? false) == true) {
            context.read<LoginCubit>().setPhoneNumber(phoneNumber);
            context.read<LoginCubit>().resetPassword();
            context.read<RegisterCubit>().resetData();
            setState(() {
              _authType = AuthType.login;
            });
          }
        });
      },
    );
  }

  void _loginListener(BuildContext context, LoginState state) {
    AppFunctions.handleCubitListener(
      context,
      requestState: state.requestState,
      message: state.message,
      onError: () {
        if (state.goToVerificationCodeScreen) {
          context.pushNamed(
            Routes.verificationCode,
            arguments: {
              'phone':
                  '+966${context.read<LoginCubit>().data.phoneNumberController.text}',
              'route': VerificationCodeRoute.login,
            },
          );
        }
      },
      onLoaded: () {
        AppFunctions.showToast(state.message, type: MessageType.success);
        context.pushReplacementNamed(Routes.main);
      },
    );
  }
}
