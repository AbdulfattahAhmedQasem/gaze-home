import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/data/usecases/order_use_cases.dart';

part 'driver_order_actions_state.dart';
part 'driver_order_actions_cubit.freezed.dart';

class DriverOrderActionsCubit extends Cubit<DriverOrderActionsState> {
  DriverOrderActionsCubit(
    this._getDriverOrderUseCase,
    this._rejectDriverOrderUseCase,
    this._cancelDriverOrderUseCase,
    this._updatePaymentToPaidUseCase,
  ) : super(const DriverOrderActionsState.initial());

  final GetDriverOrderUseCase _getDriverOrderUseCase;
  final RejectDriverOrderUseCase _rejectDriverOrderUseCase;
  final CancelDriverOrderUseCase _cancelDriverOrderUseCase;
  final UpdatePaymentToPaidUseCase _updatePaymentToPaidUseCase;

  Future<void> getOrder(int orderId) async {
    emit(const DriverOrderActionsState.loading());
    final result = await _getDriverOrderUseCase(orderId);
    result.when(
      right: (message) {
        emit(DriverOrderActionsState.loaded(message));
      },
      left: (failure) {
        emit(DriverOrderActionsState.error(failure.message));
      },
    );
  }

  Future<void> rejectOrder(int orderId) async {
    emit(const DriverOrderActionsState.loading());
    final result = await _rejectDriverOrderUseCase(orderId);
    result.when(
      right: (message) {
        emit(DriverOrderActionsState.loaded(message));
      },
      left: (failure) {
        emit(DriverOrderActionsState.error(failure.message));
      },
    );
  }

  Future<void> cancelOrder(int orderId) async {
    emit(const DriverOrderActionsState.loading());
    final result = await _cancelDriverOrderUseCase(orderId);
    result.when(
      right: (message) {
        emit(DriverOrderActionsState.loaded(message));
      },
      left: (failure) {
        emit(DriverOrderActionsState.error(failure.message));
      },
    );
  }

  Future<void> updatePaymentToPaid(int orderId) async {
    emit(const DriverOrderActionsState.loading());
    final result = await _updatePaymentToPaidUseCase(orderId);
    result.when(
      right: (message) {
        emit(DriverOrderActionsState.loaded(message));
      },
      left: (failure) {
        emit(DriverOrderActionsState.error(failure.message));
      },
    );
  }

}
