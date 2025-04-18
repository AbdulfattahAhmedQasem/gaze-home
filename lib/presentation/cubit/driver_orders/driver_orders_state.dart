part of 'driver_orders_cubit.dart';

@freezed
class DriverOrdersState with _$DriverOrdersState {
  const factory DriverOrdersState.initial() = _Initial;
  const factory DriverOrdersState.loading() = _Loading;
  const factory DriverOrdersState.loaded(List<DriverOrderModel> orders) =
      _Loaded;
  const factory DriverOrdersState.error(String message) = _Error;
}
