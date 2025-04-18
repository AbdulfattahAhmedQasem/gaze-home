import 'package:gazhome/core/usecases/usecases.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/driver_order_model.dart';
import 'package:gazhome/data/models/order_summary_model.dart';
import 'package:gazhome/data/models/region_model.dart';
import 'package:gazhome/data/models/user_order_model.dart';
import 'package:gazhome/data/repos/order_repo.dart';
import 'package:gazhome/data/requests/complete_order_request.dart';

//** User */

class CreateUserOrderUseCase extends ResultFutureUseCaseWithoutParams<OrderSummaryModel> {
  CreateUserOrderUseCase(this._orderRepo);
  final OrderRepo _orderRepo;

  @override
  ResultFuture<OrderSummaryModel> call() {
    return _orderRepo.createUserOrder();
  }
}

class CompleteUserOrderUseCase extends ResultFutureUseCaseWithParams<(String, dynamic), CompleteOrderRequest> {
  CompleteUserOrderUseCase(this._orderRepo);

  final OrderRepo _orderRepo;

  @override
  ResultFuture<(String, dynamic)> call(CompleteOrderRequest request) {
    return _orderRepo.completeUserOrder(request);
  }
}

class GetUserOrdersUseCase
    extends ResultFutureUseCaseWithoutParams<List<UserOrderModel>> {
  GetUserOrdersUseCase(this._orderRepo);

  final OrderRepo _orderRepo;

  @override
  ResultFuture<List<UserOrderModel>> call() {
    return _orderRepo.getUserOrders();
  }
}

class CancelUserOrderUseCase
    extends ResultFutureUseCaseWithParams<String, int> {
  CancelUserOrderUseCase(this._orderRepo);

  final OrderRepo _orderRepo;

  @override
  ResultFuture<String> call(int orderId) {
    return _orderRepo.cancelUserOrder(orderId);
  }
}

//** Driver */

class GetRegionsUseCase
    extends ResultFutureUseCaseWithoutParams<List<RegionModel>> {
  GetRegionsUseCase(this._orderRepo);

  final OrderRepo _orderRepo;

  @override
  ResultFuture<List<RegionModel>> call() {
    return _orderRepo.getRegions();
  }
}

class GetDriverOrdersForRegionUseCase
    extends ResultFutureUseCaseWithParams<List<DriverOrderModel>, int> {
  GetDriverOrdersForRegionUseCase(this._orderRepo);

  final OrderRepo _orderRepo;

  @override
  ResultFuture<List<DriverOrderModel>> call(int regionId) {
    return _orderRepo.getDriverOrdersForRegion(regionId);
  }
}

class GetDriverOrdersUseCase
    extends ResultFutureUseCaseWithoutParams<List<DriverOrderModel>> {
  GetDriverOrdersUseCase(this._orderRepo);

  final OrderRepo _orderRepo;

  @override
  ResultFuture<List<DriverOrderModel>> call() {
    return _orderRepo.getDriverOrders();
  }
}

class GetDriverOrdersInProfileUseCase
    extends ResultFutureUseCaseWithoutParams<List<DriverOrderModel>> {
  GetDriverOrdersInProfileUseCase(this._orderRepo);

  final OrderRepo _orderRepo;

  @override
  ResultFuture<List<DriverOrderModel>> call() {
    return _orderRepo.getDriverOrdersInProfile();
  }
}

class GetDriverOrderUseCase extends ResultFutureUseCaseWithParams<String, int> {
  GetDriverOrderUseCase(this._orderRepo);

  final OrderRepo _orderRepo;

  @override
  ResultFuture<String> call(int orderId) {
    return _orderRepo.getDriverOrder(orderId);
  }
}

class CancelDriverOrderUseCase
    extends ResultFutureUseCaseWithParams<String, int> {
  CancelDriverOrderUseCase(this._orderRepo);

  final OrderRepo _orderRepo;

  @override
  ResultFuture<String> call(int orderId) {
    return _orderRepo.cancelDriverOrder(orderId);
  }
}

class UpdatePaymentToPaidUseCase extends ResultFutureUseCaseWithParams<String, int> {

  UpdatePaymentToPaidUseCase(this._orderRepo);
  final OrderRepo _orderRepo;

  @override
  ResultFuture<String> call(int orderId) {
    return _orderRepo.updatePaymentToPaid(orderId);
  }
}

class RejectDriverOrderUseCase extends ResultFutureUseCaseWithParams<String, int> {
  RejectDriverOrderUseCase(this._orderRepo);
  final OrderRepo _orderRepo;

  @override
  ResultFuture<String> call(int orderId) {
    return _orderRepo.rejectDriverOrder(orderId);
  }
}
