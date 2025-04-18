import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/datasources/remote/cart_remote_data_source.dart';
import 'package:gazhome/data/models/cart_response.dart';

class CartRepo {
  const CartRepo(this._cartRemoteDataSource);

  final CartRemoteDataSource _cartRemoteDataSource;

  ResultFuture<CartResponse> getProductsCart() async {
    return returnResponse<CartResponse>(() async {
      return _cartRemoteDataSource.getProductsCart();
    });
  }

  ResultFuture<String> addToCart((int productId, int quantity) request) async {
    return returnResponse<String>(() async {
      return _cartRemoteDataSource.addToCart(request);
    });
  }

  ResultFuture<String> deleteFromCart(int productId) async {
    return returnResponse<String>(() async {
      return _cartRemoteDataSource.deleteFromCart(productId);
    });
  }

  ResultFuture<String> increaceProductquntaty(
    (int productId, int quantity) request,
  ) async {
    return returnResponse<String>(() async {
      return _cartRemoteDataSource.increaceProductquntaty(request);
    });
  }

  ResultFuture<String> decreaseProductquntaty(
    (int productId, int quantity) request,
  ) async {
    return returnResponse<String>(() async {
      return _cartRemoteDataSource.decreaseProductquntaty(request);
    });
  }
}
