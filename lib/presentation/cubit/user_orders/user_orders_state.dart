part of 'user_orders_cubit.dart';

@freezed
class UserOrdersState with _$UserOrdersState {
  const factory UserOrdersState({
    @Default(RequestState.initial) RequestState requestState,
    @Default(RequestState.initial) RequestState cancelState,
    @Default('') String message,
    @Default([]) List<UserOrderModel> orders,
    @Default([]) List<int> cancelOrderIds,
  }) = _UserOrdersState;
}
