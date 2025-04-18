import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.dart';
part 'counter_cubit.freezed.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this._initialQuantity, this._availableQuantity)
    : super(
        CounterState.initial(
          quantity: _initialQuantity,
          availableQuantity: _availableQuantity,
        ),
      );

  final int _initialQuantity;
  final int _availableQuantity;

  int _debouncedQuantity = 0;
  int get deboucedQuantity => _debouncedQuantity;

  void increase() {
    if (state.quantity < _availableQuantity) {
      _debouncedQuantity++;
      emit(state.copyWith(quantity: state.quantity + 1));
    }
  }

  void decrease() {
    if (state.quantity > 1) {
      _debouncedQuantity--;
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void reset() {
    emit(state.copyWith(quantity: _initialQuantity));
  }

  void resetDebouncedQuantity({bool resetInitialQuantity = false}) {
    if (resetInitialQuantity) {
      emit(state.copyWith(quantity: state.quantity - _debouncedQuantity));
    }
    _debouncedQuantity = 0;
  }
}
