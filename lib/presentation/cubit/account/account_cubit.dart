import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/models/user_model.dart';
import 'package:gazhome/data/requests/update_account_request.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';
import 'package:gazhome/data/usecases/auth_usecases.dart';
import 'package:gazhome/presentation/cubit/base/base_cubit.dart';
import 'package:gazhome/presentation/cubit/base/base_data.dart';

part 'account_data.dart';
part 'account_state.dart';
part 'account_cubit.freezed.dart';

class AccountCubit extends BaseCubit<AccountState, AccountData> {
  AccountCubit(
    this._getUserUseCase,
    this._updateAccountUseCase,
    this._changePhoneNumberUseCase,
    this._logoutUseCase,
    this._deleteAccountUseCase,
    this._removeUserUseCase,
    this._removeTokenUseCase,
    this._cacheUserUseCase,
  ) : super(AccountState(user: _getUserUseCase()), AccountData._()) {
    final user = _getUserUseCase();
    if (!sl<SharedData>().userType.isDriver()) {
      data
        ..firstNameController!.text = user.firstName
        ..lastNameController!.text = user.lastName
        ..phoneNumberController!.text = user.phoneNumber;
    }
  }

  final GetUserUseCase _getUserUseCase;
  final UpdateAccountUseCase _updateAccountUseCase;
  final ChangePhoneNumberUseCase _changePhoneNumberUseCase;
  final LogoutUseCase _logoutUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  final RemoveUserUseCase _removeUserUseCase;
  final RemoveTokenUseCase _removeTokenUseCase;
  final CacheUserUseCase _cacheUserUseCase;

  Future<bool?> updateAccount() async {
    AppFunctions.unFocusKeyboard();
    if (data.formKey.currentState?.validate() ?? false) {
      var isAnyDataChanged = false;
      final user = _getUserUseCase();
      if (user.firstName.trim() != data.firstNameController!.text.trim() ||
          user.lastName.trim() != data.lastNameController!.text.trim()) {
        isAnyDataChanged = true;
        await _updateAccountData();
      }
      if (user.phoneNumber != data.phoneNumberController!.text) {
        isAnyDataChanged = true;
        await _changePhoneNumber();
      }
      return isAnyDataChanged;
    } else {
      emit(
        state.copyWith(
          autovalidateMode: AutovalidateMode.always,
          updateDataState: RequestState.initial,
          changePhoneState: RequestState.initial,
        ),
      );
      return null;
    }
  }

  Future<void> _updateAccountData() async {
    emit(
      state.copyWith(
        updateDataState: RequestState.loading,
        changePhoneState: RequestState.initial,
        logoutState: RequestState.initial,
        deleteAccountState: RequestState.initial,
      ),
    );
    final result = await _updateAccountUseCase(
      UpdateAccountRequest(
        firstName: data.firstNameController!.text,
        lastName: data.lastNameController!.text,
      ),
    );
    result.when(
      right: (response) {
        _cacheUserUseCase(response.$1);
        emit(
          state.copyWith(
            updateDataState: RequestState.loaded,
            message: response.$2,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            updateDataState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<void> _changePhoneNumber() async {
    emit(
      state.copyWith(
        changePhoneState: RequestState.loading,
        updateDataState: RequestState.initial,
        logoutState: RequestState.initial,
        deleteAccountState: RequestState.initial,
      ),
    );
    final result = await _changePhoneNumberUseCase(
      data.phoneNumberController!.text,
    );
    result.when(
      right: (message) {
        emit(
          state.copyWith(
            changePhoneState: RequestState.loaded,
            message: message,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            changePhoneState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<void> logout() async {
    emit(
      state.copyWith(
        logoutState: RequestState.loading,
        changePhoneState: RequestState.initial,
        updateDataState: RequestState.initial,
        deleteAccountState: RequestState.initial,
      ),
    );
    final result = await _logoutUseCase();
    result.when(
      right: (message) {
        _removeUserUseCase();
        _removeTokenUseCase();
        sl<SharedData>()
          ..isUserAuthenticated = false
          ..userType = UserType.individual;
        emit(
          state.copyWith(logoutState: RequestState.loaded, message: message),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            logoutState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<void> deleteAccount() async {
    emit(
      state.copyWith(
        deleteAccountState: RequestState.loading,
        changePhoneState: RequestState.initial,
        updateDataState: RequestState.initial,
        logoutState: RequestState.initial,
      ),
    );
    final result = await _deleteAccountUseCase();
    result.when(
      right: (message) {
        _removeUserUseCase();
        _removeTokenUseCase();
        sl<SharedData>()
          ..isUserAuthenticated = false
          ..userType = UserType.individual;
        emit(
          state.copyWith(
            deleteAccountState: RequestState.loaded,
            message: message,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            deleteAccountState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    data.dispose();
    return super.close();
  }
}
