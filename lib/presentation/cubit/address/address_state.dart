part of 'address_cubit.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    @Default(RequestState.initial) RequestState requestState,
    @Default(RequestState.initial) RequestState addAddressState,
    @Default(RequestState.initial) RequestState deleteAddressState,
    @Default('') String message,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default([]) List<AddressModel> addresses,
    @Default([]) List<int> deleteAddressIds,
    AddressModel? address,
  }) = _AddressState;
}
