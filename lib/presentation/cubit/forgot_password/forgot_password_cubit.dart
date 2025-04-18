import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/usecases/auth_usecases.dart';
import 'package:gazhome/presentation/cubit/base/base_cubit.dart';
import 'package:gazhome/presentation/cubit/base/base_data.dart';

part 'forgot_password_data.dart';
part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

class ForgotPasswordCubit
    extends BaseCubit<ForgotPasswordState, ForgotPasswordData> {
  ForgotPasswordCubit(this._sendCodeUseCase, this._resetPasswordUseCase)
    : super(const ForgotPasswordState(), ForgotPasswordData._()) {
    if (sl<SharedData>().isChangePassword &&
        sl<SharedData>().userType.isDriver()) {
      emit(state.copyWith(userType: UserType.driver));
    }
  }

  final SendCodeUseCase _sendCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  Future<void> sendCode() async {
    AppFunctions.unFocusKeyboard();
    if (data.formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(requestState: RequestState.loading));
      final result = await _sendCodeUseCase(data.phoneNumberController.text);
      await result.when(
        right: (response) async {
          sl<SharedData>().token = response.$1.token;
          emit(
            state.copyWith(
              requestState: RequestState.loaded,
              message: response.$2,
            ),
          );
        },
        left: (failure) {
          emit(
            state.copyWith(
              requestState: RequestState.error,
              message: failure.message,
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          autovalidateMode: AutovalidateMode.always,
          requestState: RequestState.initial,
        ),
      );
    }
  }

  Future<void> resetPassword() async {
    AppFunctions.unFocusKeyboard();
    if (data.formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(requestState: RequestState.loading));
      final result = await _resetPasswordUseCase(data.passwordController.text);
      await result.when(
        right: (response) async {
          sl<SharedData>().clearToken();
          emit(
            state.copyWith(
              requestState: RequestState.loaded,
              message: response.$2,
            ),
          );
        },
        left: (failure) {
          emit(
            state.copyWith(
              requestState: RequestState.error,
              message: failure.message,
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          autovalidateMode: AutovalidateMode.always,
          requestState: RequestState.initial,
        ),
      );
    }
  }

  void changeUserType(bool isDriver) {
    final userType =
        sl<SharedData>().userType =
            isDriver ? UserType.driver : UserType.individual;
    emit(
      state.copyWith(userType: userType, requestState: RequestState.initial),
    );
  }

  @override
  Future<void> close() {
    data.dispose();
    return super.close();
  }
}
