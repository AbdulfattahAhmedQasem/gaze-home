part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(RequestState.initial) RequestState requestState,
    @Default('') String message,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(UserType.individual) UserType userType,
  }) = _ForgotPasswordState;
}
