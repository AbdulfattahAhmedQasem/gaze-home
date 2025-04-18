import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/requests/register_request.dart';
import 'package:gazhome/data/usecases/auth_usecases.dart';
import 'package:gazhome/presentation/cubit/base/base_cubit.dart';
import 'package:gazhome/presentation/cubit/base/base_data.dart';

part 'register_data.dart';
part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends BaseCubit<RegisterState, RegisterData> {
  RegisterCubit(this._registerUseCase)
      : super(const RegisterState(), RegisterData._());

  final RegisterUseCase _registerUseCase;

  Future<void> register() async {
    AppFunctions.unFocusKeyboard();
    if (data.formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(requestState: RequestState.loading));
      final request = RegisterRequest(
        type: state.type,
        firstName: data.firstNameController.text,
        lastName: data.lastNameController.text,
        phoneNumber: data.phoneNumberController.text,
        password: data.passwordController.text,
        passwordConfirmation: data.confirmPasswordController.text,
        taxNumber: data.taxNumberController.text,
        commercialRegister: data.commercialRegisterController.text,
      );
      final result = await _registerUseCase(request);
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

  void changeUserType(UserType type) {
    emit(state.copyWith(requestState: RequestState.initial, type: type));
  }

  void resetData() {
    data.resetData();
  }

  @override
  Future<void> close() {
    data.dispose();
    return super.close();
  }
}
