import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';
import 'package:gazhome/data/usecases/auth_usecases.dart';

part 'verification_code_cubit.freezed.dart';
part 'verification_code_state.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit(
    this._verifyCodeUseCase,
    this._sendCodeUseCase,
    this._confirmCodeUseCase,
    this._verifyPhoneNumberUseCase,
    this._cacheUserUseCase,
    this._phone,
  ) : super(const VerificationCodeState());

  final VerifyCodeUseCase _verifyCodeUseCase;
  final SendCodeUseCase _sendCodeUseCase;
  final ConfirmCodeUseCase _confirmCodeUseCase;
  final VerifyPhoneNumberUseCase _verifyPhoneNumberUseCase;
  final CacheUserUseCase _cacheUserUseCase;
  final String _phone;

  Future<void> verifyCode(String code) async {
    emit(
      state.copyWith(
        submitState: RequestState.loading,
        resendState: RequestState.initial,
      ),
    );

    final result = await _verifyCodeUseCase(code);
    result.when(
      right: (response) {
        emit(
          state.copyWith(
            submitState: RequestState.loaded,
            message: response.$2,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            submitState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<void> confirmCode(String code) async {
    emit(
      state.copyWith(
        submitState: RequestState.loading,
        resendState: RequestState.initial,
      ),
    );

    final result = await _confirmCodeUseCase((_phone, code));
    result.when(
      right: (response) {
        emit(
          state.copyWith(
            submitState: RequestState.loaded,
            message: response.$2,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            submitState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<void> verifyPhoneNumber(String code) async {
    emit(
      state.copyWith(
        submitState: RequestState.loading,
        resendState: RequestState.initial,
      ),
    );

    final result = await _verifyPhoneNumberUseCase((_phone, code));
    result.when(
      right: (response) {
        _cacheUserUseCase(response.$1);
        emit(
          state.copyWith(
            submitState: RequestState.loaded,
            message: response.$2,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            submitState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<bool> resendCode() async {
    emit(
      state.copyWith(
        resendState: RequestState.loading,
        submitState: RequestState.initial,
      ),
    );

    final result = await _sendCodeUseCase(_phone);
    return result.when(
      right: (response) {
        sl<SharedData>().setUserType(response.$1.userType);
        emit(
          state.copyWith(
            resendState: RequestState.loaded,
            message: response.$2,
          ),
        );
        return true;
      },
      left: (failure) {
        emit(
          state.copyWith(
            resendState: RequestState.error,
            message: failure.message,
          ),
        );
        return false;
      },
    );
  }
}
