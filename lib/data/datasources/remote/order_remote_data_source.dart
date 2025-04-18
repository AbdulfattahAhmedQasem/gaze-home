import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/networking/api_constants.dart';
import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/complete_order_model.dart';
import 'package:gazhome/data/models/driver_order_model.dart';
import 'package:gazhome/data/models/order_summary_model.dart';
import 'package:gazhome/data/models/region_model.dart';
import 'package:gazhome/data/models/user_order_model.dart';
import 'package:gazhome/data/models/user_order_product_model.dart';
import 'package:gazhome/data/requests/complete_order_request.dart';

class OrderRemoteDataSource {
  OrderRemoteDataSource(this._apiService);

  final ApiService _apiService;

  //** User */

  Future<OrderSummaryModel> createUserOrder() async {
    return returnRemoteResponse<OrderSummaryModel>(() async {
      final response = await _apiService.get(ApiConstants.createUserOrder);
      return OrderSummaryModel.fromMap(response);
    });
  }

  Future<(String, dynamic)> completeUserOrder(
    CompleteOrderRequest request,
  ) async {
    return returnRemoteResponse<(String, dynamic)>(() async {
      final response = await _apiService.post(
        ApiConstants.completeUserOrder,
        body: request.toMap(),
      );
      if (request.paymentMethod.isCredit()) {
        final url = response['data'] as String;
        final orderId = int.parse(url.split('=').last);
        final paymentUrl = await _getPaymentUrl(orderId);
        return (response['message'] as String, paymentUrl);
      } else {
        return (
          response['message'] as String,
          CompleteOrderModel.fromMap(response['data'] as DataMap),
        );
      }
    });
  }

  Future<String> _getPaymentUrl(int orderId) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.get(
        ApiConstants.paymentUrl,
        queryParameters: {'oid': orderId},
      );
      return response['data'] as String;
    });
  }

  Future<List<UserOrderModel>> getUserOrders() async {
    return returnRemoteResponse<List<UserOrderModel>>(() async {
      final response = await _apiService.get(ApiConstants.userOrders);
      final orders = <int, UserOrderModel>{};
      for (final order in response['data'] as List) {
        final orderId = (order as DataMap)['order_id'] as int;
        if (orders[orderId] == null) {
          orders[orderId] = UserOrderModel.fromMap(order);
        } else {
          orders[orderId]!.products.add(UserOrderProductModel.fromMap(order));
        }
      }
      return orders.values.toList();
    });
  }

  Future<String> cancelUserOrder(int orderId) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.cancelUserOrder,
        body: {'order_id': orderId},
      );
      return response['message'] as String;
    });
  }

  //** Driver */

  Future<List<RegionModel>> getRegions() async {
    return returnRemoteResponse<List<RegionModel>>(() async {
      final response = await _apiService.get(ApiConstants.regions);
      return List<RegionModel>.from(
        (response['data'] as List).map<RegionModel>(
          (region) => RegionModel.fromMap(region as DataMap),
        ),
      );
    });
  }

  Future<List<DriverOrderModel>> getDriverOrdersForRegion(int regionId) async {
    return returnRemoteResponse<List<DriverOrderModel>>(() async {
      final response = await _apiService.get(
        '${ApiConstants.regionOrders}/$regionId',
      );
      return List<DriverOrderModel>.from(
        (response['data'] as List).map<DriverOrderModel>(
          (order) => DriverOrderModel.fromMap(order as DataMap),
        ),
      );
    });
  }

  Future<List<DriverOrderModel>> getDriverOrders() async {
    return returnRemoteResponse<List<DriverOrderModel>>(() async {
      final response = await _apiService.get(ApiConstants.driverOrders);
      return List<DriverOrderModel>.from(
        (response['data'] as List).map<DriverOrderModel>(
          (order) => DriverOrderModel.fromMap(order as DataMap),
        ),
      );
    });
  }

  Future<List<DriverOrderModel>> getDriverOrdersInProfile() async {
    return returnRemoteResponse<List<DriverOrderModel>>(() async {
      final response = await _apiService.get(
        ApiConstants.driverOrdersInProfile,
      );
      return List<DriverOrderModel>.from(
        (response['data'] as List).map<DriverOrderModel>(
          (order) => DriverOrderModel.fromMap(order as DataMap),
        ),
      );
    });
  }

  Future<String> getDriverOrder(int orderId) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.getDriverOrder,
        body: {'order_id': orderId},
      );
      return response['message'] as String;
    });
  }

  Future<String> cancelDriverOrder(int orderId) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.cancelDriverOrder,
        body: {'order_id': orderId},
      );
      return response['message'] as String;
    });
  }

  Future<String> updatePaymentToPaid(int orderId) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.updatePaymentToPaid,
        body: {'order_id': orderId},
      );
      return response['message'] as String;
    });
  }

  Future<String> rejectDriverOrder(int orderId) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.get(
        '${ApiConstants.rejectDriverOrder}/$orderId',
      );
      return response['message'] as String;
    });
  }
}
