part of 'support_cubit.dart';

@freezed
class SupportState with _$SupportState {
  const factory SupportState({
    @Default(RequestState.initial) RequestState requestState,
    @Default('') String message,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(false) bool goToVerificationCodeScreen,
  }) = _SupportState;
}
