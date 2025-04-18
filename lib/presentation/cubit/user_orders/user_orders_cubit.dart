import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/data/models/user_order_model.dart';
import 'package:gazhome/data/usecases/order_use_cases.dart';

part 'user_orders_state.dart';
part 'user_orders_cubit.freezed.dart';

class UserOrdersCubit extends Cubit<UserOrdersState> {
  UserOrdersCubit(this._getUserOrdersUseCase, this._cancelUserOrderUseCase)
      : super(const UserOrdersState());

  final GetUserOrdersUseCase _getUserOrdersUseCase;
  final CancelUserOrderUseCase _cancelUserOrderUseCase;

  Future<void> getOrders() async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await _getUserOrdersUseCase();
    result.when(
      right: (orders) {
        emit(state.copyWith(requestState: RequestState.loaded, orders: orders));
      },
      left: (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<void> cancelOrder({required int orderId, required int index}) async {
    emit(
      state.copyWith(
        cancelState: RequestState.loading,
        cancelOrderIds: [...state.cancelOrderIds, orderId],
      ),
    );
    final result = await _cancelUserOrderUseCase(orderId);
    result.when(
      right: (message) {
        final orders = [...state.orders];
        orders[index] = orders[index].copyWith(
          orderStatus: OrderStatus.cancelled,
        );
        emit(
          state.copyWith(
            cancelState: RequestState.loaded,
            orders: orders,
            message: message,
            cancelOrderIds: [...state.cancelOrderIds]..remove(orderId),
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            cancelState: RequestState.error,
            message: failure.message,
            cancelOrderIds: [...state.cancelOrderIds]..remove(orderId),
          ),
        );
      },
    );
  }
}
