part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(RequestState.initial) RequestState requestState,
    @Default(RequestState.initial) RequestState deleteState,
    @Default(RequestState.initial) RequestState increaseState,
    @Default(RequestState.initial) RequestState decreaseState,
    @Default('') String message,
    @Default([]) List<CartModel> cartProducts,
    @Default([]) List<int> deleteIds,
    @Default([]) List<int> increaseIds,
    @Default([]) List<int> decreaseIds,
    int? currentCartId,
    @Default(0) num totalCost,
    @Default(0) num totalPriceAfterTax,
  }) = _CartState;
}
