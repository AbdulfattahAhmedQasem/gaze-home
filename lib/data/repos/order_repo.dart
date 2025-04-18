import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/datasources/remote/order_remote_data_source.dart';
import 'package:gazhome/data/models/driver_order_model.dart';
import 'package:gazhome/data/models/order_summary_model.dart';
import 'package:gazhome/data/models/region_model.dart';
import 'package:gazhome/data/models/user_order_model.dart';
import 'package:gazhome/data/requests/complete_order_request.dart';

class OrderRepo {
  const OrderRepo(this._orderRemoteDataSource);

  final OrderRemoteDataSource _orderRemoteDataSource;

  //** User */

  ResultFuture<OrderSummaryModel> createUserOrder() async {
    return returnResponse<OrderSummaryModel>(() async {
      return _orderRemoteDataSource.createUserOrder();
    });
  }

  ResultFuture<(String, dynamic)> completeUserOrder(
    CompleteOrderRequest request,
  ) async {
    return returnResponse<(String, dynamic)>(() async {
      return _orderRemoteDataSource.completeUserOrder(request);
    });
  }

  ResultFuture<List<UserOrderModel>> getUserOrders() async {
    return returnResponse<List<UserOrderModel>>(() async {
      return _orderRemoteDataSource.getUserOrders();
    });
  }

  ResultFuture<String> cancelUserOrder(int orderId) async {
    return returnResponse<String>(() async {
      return _orderRemoteDataSource.cancelUserOrder(orderId);
    });
  }

  //** Driver */

  ResultFuture<List<RegionModel>> getRegions() async {
    return returnResponse<List<RegionModel>>(() async {
      return _orderRemoteDataSource.getRegions();
    });
  }

  ResultFuture<List<DriverOrderModel>> getDriverOrdersForRegion(
    int regionId,
  ) async {
    return returnResponse<List<DriverOrderModel>>(() async {
      return _orderRemoteDataSource.getDriverOrdersForRegion(regionId);
    });
  }

  ResultFuture<List<DriverOrderModel>> getDriverOrders() async {
    return returnResponse<List<DriverOrderModel>>(() async {
      return _orderRemoteDataSource.getDriverOrders();
    });
  }

  ResultFuture<List<DriverOrderModel>> getDriverOrdersInProfile() async {
    return returnResponse<List<DriverOrderModel>>(() async {
      return _orderRemoteDataSource.getDriverOrdersInProfile();
    });
  }

  ResultFuture<String> getDriverOrder(int orderId) async {
    return returnResponse<String>(() async {
      return _orderRemoteDataSource.getDriverOrder(orderId);
    });
  }

  ResultFuture<String> cancelDriverOrder(int orderId) async {
    return returnResponse<String>(() async {
      return _orderRemoteDataSource.cancelDriverOrder(orderId);
    });
  }

  ResultFuture<String> updatePaymentToPaid(int orderId) async {
    return returnResponse<String>(() async {
      return _orderRemoteDataSource.updatePaymentToPaid(orderId);
    });
  }

  ResultFuture<String> rejectDriverOrder(int orderId) async {
    return returnResponse<String>(() async {
      return _orderRemoteDataSource.rejectDriverOrder(orderId);
    });
  }
}
