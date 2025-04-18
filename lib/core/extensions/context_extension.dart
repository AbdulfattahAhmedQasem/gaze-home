import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/services/languagge_service.dart';
import 'package:gazhome/presentation/cubit/main/main_cubit.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).popAndPushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      newRouteName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  bool isDialogOppened() => ModalRoute.of(this)?.isCurrent != true;

  void closeDialogIfOppened() {
    if (isDialogOppened()) {
      pop();
    }
  }

  bool isKeyboardAppeared() => View.of(this).viewInsets.bottom > 0.0;

  bool isRTL() => LanguageService.isRTL(this);

  Future<void> updateLanguage([Language? language]) =>
      LanguageService.updateLanugage(this, language: language);

  MainCubit get mainCubit => read<MainCubit>();
}
