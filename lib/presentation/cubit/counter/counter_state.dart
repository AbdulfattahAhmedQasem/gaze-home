part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState({
    required int quantity,
    required int availableQuantity,
  }) = _CounterState;

  factory CounterState.initial({
    required int quantity,
    required int availableQuantity,
  }) {
    return CounterState(
      quantity: quantity,
      availableQuantity: availableQuantity,
    );
  }
}
