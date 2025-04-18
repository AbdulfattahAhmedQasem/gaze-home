part of 'driver_order_actions_cubit.dart';

@freezed
class DriverOrderActionsState with _$DriverOrderActionsState {
  const factory DriverOrderActionsState.initial() = _Initial;
  const factory DriverOrderActionsState.loading() = _Loading;
  const factory DriverOrderActionsState.loaded(String message) = _Loaded;
  const factory DriverOrderActionsState.error(String message) = _Error;
}
