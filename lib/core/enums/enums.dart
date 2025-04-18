import 'package:flutter/material.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/presentation/my_app.dart';

enum RequestState { initial, loading, error, loaded }

extension RequestStateExtension on RequestState {
  bool isInitial() => this == RequestState.initial;
  bool isLoading() => this == RequestState.loading;
  bool isLoaded() => this == RequestState.loaded;
  bool hasError() => this == RequestState.error;
}

enum MessageType {
  success(AppSvgs.success),
  error(AppSvgs.error),
  question(AppSvgs.question);

  const MessageType(this.icon);
  final String icon;
}

extension MessageTypeExtension on MessageType {
  Color get color {
    final context = navigatorKey.currentContext!;
    switch (this) {
      case MessageType.success:
        return AppColors.c57EB4D;
      case MessageType.error:
        return context.colorScheme.error;
      case MessageType.question:
        return context.colorScheme.primary;
    }
  }
}

enum AuthType { login, register }

extension AuthTypeExtension on AuthType {
  bool isLogin() => this == AuthType.login;
  bool isRegister() => this == AuthType.register;
}

enum UserType {
  individual('user'),
  business('company'),
  driver('driver');

  const UserType(this.key);
  final String key;
}

extension UserTypeExtension on UserType {
  bool isIndividual() => this == UserType.individual;
  bool isBusiness() => this == UserType.business;
  bool isDriver() => this == UserType.driver;
}

enum ForgotPasswordStep { send, reset }

extension ForgotPasswordStepExtension on ForgotPasswordStep {
  bool isSend() => this == ForgotPasswordStep.send;
  bool isReset() => this == ForgotPasswordStep.reset;
}

enum VerificationCodeRoute {
  login(AppStrings.confirmYourAccount, AppStrings.enterYourCode),
  register(AppStrings.accountCompleted, AppStrings.enterYourCode),
  forgotPassword(AppStrings.resetPassword, AppStrings.codeSent),
  account(AppStrings.resetAccountData, AppStrings.codeSent);

  const VerificationCodeRoute(this.title, this.description);

  final String title;
  final String description;
}

extension VerificationCodeRouteExtension on VerificationCodeRoute {
  bool isFromLogin() => this == VerificationCodeRoute.login;
  bool isFromRegister() => this == VerificationCodeRoute.register;
  bool isFromForgotPassword() => this == VerificationCodeRoute.forgotPassword;
  bool isFromAccount() => this == VerificationCodeRoute.account;
}

enum StatusCode {
  unauthenticated(401);

  const StatusCode(this.code);
  final int code;
}

enum OrderStatus {
  cancelled(1, Colors.red),
  pending(1, Colors.red),
  shipped(2, Colors.orange),
  delivered(3, Colors.green);

  const OrderStatus(this.value, this.color);
  final int value;
  final Color color;
}

extension OrderStatusExtension on OrderStatus {
  bool isPending() => this == OrderStatus.pending;
  bool isDelivered() => this == OrderStatus.delivered;
}

enum PaymentMethod {
  credit(AppStrings.creditCard, AppSvgs.credit, 'online'),
  cash(AppStrings.paymentInCashUponDelivery, AppSvgs.home, 'cod');

  const PaymentMethod(this.title, this.icon, this.key);
  final String title;
  final String icon;
  final String key;
}

extension PaymentMethodExtension on PaymentMethod {
  bool isCredit() => this == PaymentMethod.credit;
}

enum DriverScreenName { bookOrder, myOrders, account }

extension DriverScreenNameExtension on DriverScreenName {
  bool isBookOrder() => this == DriverScreenName.bookOrder;
  bool isMyOrders() => this == DriverScreenName.myOrders;
  bool isAccount() => this == DriverScreenName.account;
}
