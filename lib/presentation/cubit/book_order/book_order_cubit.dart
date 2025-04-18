import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/errors/app_failure.dart';
import 'package:gazhome/data/models/driver_order_model.dart';
import 'package:gazhome/data/models/region_model.dart';
import 'package:gazhome/data/usecases/order_use_cases.dart';

part 'book_order_state.dart';
part 'book_order_cubit.freezed.dart';

class BookOrderCubit extends Cubit<BookOrderState> {
  BookOrderCubit(this._getRegionsUseCase, this._getDriverOrdersForRegionUseCase)
    : super(const BookOrderState());

  final GetRegionsUseCase _getRegionsUseCase;
  final GetDriverOrdersForRegionUseCase _getDriverOrdersForRegionUseCase;

  Future<void> getInitialData() async {
    emit(state.copyWith(requestState: RequestState.loading));
    try {
      final regions = await _getRegions();
      final currentRegion = regions.isEmpty ? null : regions.first;
      final orders =
          currentRegion == null
              ? <DriverOrderModel>[]
              : await _getOrders(currentRegion.id);
      emit(
        state.copyWith(
          requestState: RequestState.loaded,
          ordersState: RequestState.loaded,
          regions: regions,
          orders: orders,
          currentRegion: currentRegion,
        ),
      );
    } on AppFailure catch (failure) {
      emit(
        state.copyWith(
          requestState: RequestState.error,
          message: failure.message,
        ),
      );
    }
  }

  Future<void> getOrders(RegionModel region) async {
    emit(
      state.copyWith(ordersState: RequestState.loading, currentRegion: region),
    );
    try {
      final orders = await _getOrders(region.id);
      emit(state.copyWith(ordersState: RequestState.loaded, orders: orders));
    } on AppFailure catch (failure) {
      emit(
        state.copyWith(
          ordersState: RequestState.error,
          message: failure.message,
        ),
      );
    }
  }

  Future<List<RegionModel>> _getRegions() async {
    final result = await _getRegionsUseCase();
    return result.when(
      right: (regions) => regions,
      left: (failure) => throw failure,
    );
  }

  Future<List<DriverOrderModel>> _getOrders(int regionId) async {
    final result = await _getDriverOrdersForRegionUseCase(regionId);
    return result.when(
      right: (orders) => orders,
      left: (failure) => throw failure,
    );
  }
}
