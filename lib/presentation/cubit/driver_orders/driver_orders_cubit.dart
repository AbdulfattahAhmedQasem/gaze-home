// ignore_for_file: cascade_invocations

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/data/models/driver_order_model.dart';
import 'package:gazhome/data/usecases/order_use_cases.dart';

part 'driver_orders_state.dart';
part 'driver_orders_cubit.freezed.dart';

class DriverOrdersCubit extends Cubit<DriverOrdersState> {
  DriverOrdersCubit(
    this._getDriverOrdersUseCase,
    this._getDriverOrdersInProfileUseCase,
  ) : super(const DriverOrdersState.initial());

  final GetDriverOrdersUseCase _getDriverOrdersUseCase;
  final GetDriverOrdersInProfileUseCase _getDriverOrdersInProfileUseCase;

  Future<void> getOrders({bool isFromAccount = false}) async {
    emit(const DriverOrdersState.loading());
    final result =
        isFromAccount
            ? await _getDriverOrdersInProfileUseCase()
            : await _getDriverOrdersUseCase();

    result.when(
      right: (orders) {
        emit(
          DriverOrdersState.loaded(
            isFromAccount
                ? orders
                : orders
                    .where((order) => !order.orderStatus.isDelivered())
                    .toList(),
          ),
        );
      },
      left: (failure) {
        emit(DriverOrdersState.error(failure.message));
      },
    );
  }

  Future<void> deleteOrder(int orderId) async {
    emit(const DriverOrdersState.loading());
    final result = await _getDriverOrdersUseCase();
    result.when(
      right: (orders) {
        orders.removeWhere((order) => order.orderId == orderId);
        print('---------------$orderId');
        emit(DriverOrdersState.loaded(orders));
      },
      left: (failure) {
        emit(DriverOrdersState.error(failure.message));
      },
    );
  }
}
