part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    required UserModel user,
    @Default(RequestState.initial) RequestState updateDataState,
    @Default(RequestState.initial) RequestState changePhoneState,
    @Default(RequestState.initial) RequestState logoutState,
    @Default(RequestState.initial) RequestState deleteAccountState,
    @Default('') String message,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
  }) = _AccountState;
}
