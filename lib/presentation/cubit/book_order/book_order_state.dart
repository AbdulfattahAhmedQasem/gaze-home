part of 'book_order_cubit.dart';

@freezed
class BookOrderState with _$BookOrderState {
  const factory BookOrderState({
    @Default(RequestState.initial) RequestState requestState,
    @Default(RequestState.initial) RequestState ordersState,
    @Default('') String message,
    @Default([]) List<RegionModel> regions,
    @Default([]) List<DriverOrderModel> orders,
    RegionModel? currentRegion,
  }) = _BookOrderState;
}
