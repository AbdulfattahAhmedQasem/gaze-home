part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(RequestState.initial) RequestState requestState,
    @Default('') String message,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(UserType.individual) UserType type,
  }) = _RegisterState;
}
