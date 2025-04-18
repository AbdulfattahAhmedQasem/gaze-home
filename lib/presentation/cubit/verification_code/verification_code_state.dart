part of 'verification_code_cubit.dart';

@freezed
class VerificationCodeState with _$VerificationCodeState {
  const factory VerificationCodeState({
    @Default(RequestState.initial) RequestState submitState,
    @Default(RequestState.initial) RequestState resendState,
    @Default('') String message,
  }) = _PhoneNumberVerificationState;
}
