// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/services/notifications_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/models/user_model.dart';
import 'package:gazhome/data/requests/login_request.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';
import 'package:gazhome/data/usecases/auth_usecases.dart';
import 'package:gazhome/presentation/cubit/base/base_cubit.dart';
import 'package:gazhome/presentation/cubit/base/base_data.dart';

part 'login_cubit.freezed.dart';
part 'login_data.dart';
part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState, LoginData> {
  LoginCubit(
    this._loginUseCase,
    this._cacheFirstTimeUseCase,
    this._cacheUserUseCase,
    this._cacheTokenUseCase,
  ) : super(const LoginState(), LoginData._());

  final LoginUseCase _loginUseCase;
  final CacheFirstTimeUseCase _cacheFirstTimeUseCase;
  final CacheUserUseCase _cacheUserUseCase;
  final CacheTokenUseCase _cacheTokenUseCase;

  Future<void> login() async {
    AppFunctions.unFocusKeyboard();
    if (data.formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(requestState: RequestState.loading));
      final request = LoginRequest(
        phoneNumber: data.phoneNumberController.text,
        password: data.passwordController.text,
        fcmToken: await NotificationsService.getFcm(),
      );
      final result = await _loginUseCase(request);
      result.when(
        right: (response) {
          _cacheFirstTimeUseCase();
          _cacheUserUseCase(response.$1);
          _cacheTokenUseCase(response.$1.token);
          sl<SharedData>().isUserAuthenticated = true;
          sl<SharedData>().setUserType(response.$1.userType);
          emit(
            state.copyWith(
              requestState: RequestState.loaded,
              user: response.$1,
              message: response.$2,
            ),
          );
        },
        left: (failure) {
          emit(
            state.copyWith(
              requestState: RequestState.error,
              message: failure.message,
              goToVerificationCodeScreen:
                  failure.code == StatusCode.unauthenticated.code,
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
    final userType = sl<SharedData>().userType =
        isDriver ? UserType.driver : UserType.individual;
    emit(
      state.copyWith(userType: userType, requestState: RequestState.initial),
    );
  }

  void resetPassword() {
    data.passwordController.clear();
  }

  void setPhoneNumber(String phoneNumber) {
    data.phoneNumberController.text = phoneNumber;
  }

  @override
  Future<void> close() {
    data.dispose();
    return super.close();
  }
}
