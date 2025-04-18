part of 'add_to_cart_cubit.dart';

@freezed
class AddToCartState with _$AddToCartState {
  const factory AddToCartState({
    @Default(RequestState.initial) RequestState requestState,
    @Default('') String message,
    @Default([]) List<int> productIds,
  }) = _AddToCartState;
}
