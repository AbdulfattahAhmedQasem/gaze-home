part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(RequestState.initial) RequestState requestState,
    @Default('') String message,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(false) bool goToVerificationCodeScreen,
    @Default(UserType.individual) UserType userType,
    UserModel? user,
  }) = _LoginState;
}
