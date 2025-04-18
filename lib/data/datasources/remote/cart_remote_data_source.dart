import 'package:gazhome/core/networking/api_constants.dart';
import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/data/models/cart_response.dart';

class CartRemoteDataSource {
  CartRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<CartResponse> getProductsCart() async {
    return returnRemoteResponse<CartResponse>(() async {
      final response = await _apiService.get(ApiConstants.cart);
      return CartResponse.fromMap(response);
    });
  }

  Future<String> addToCart((int productId, int quantity) request) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.addToCart,
        body: {'product_id': request.$1, 'quantity': request.$2},
      );
      return response['message'] as String;
    });
  }

  Future<String> deleteFromCart(int productId) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.deleteFromCart,
        body: {'product_id': productId},
      );
      return response['message'] as String;
    });
  }

  Future<String> increaceProductquntaty(
    (int productId, int quantity) request,
  ) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.increaceProductquntaty,
        body: {'product_id': request.$1, 'quantity': request.$2},
      );
      return response['message'] as String;
    });
  }

  Future<String> decreaseProductquntaty(
    (int productId, int quantity) request,
  ) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.decreaseProductquntaty,
        body: {'product_id': request.$1, 'quantity': request.$2},
      );
      return response['message'] as String;
    });
  }
}
