import 'package:gazhome/core/usecases/usecases.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/cart_response.dart';
import 'package:gazhome/data/repos/cart_repo.dart';

class GetCartProductsUseCase
    extends ResultFutureUseCaseWithoutParams<CartResponse> {
  GetCartProductsUseCase(this._cartRepo);

  final CartRepo _cartRepo;

  @override
  ResultFuture<CartResponse> call() {
    return _cartRepo.getProductsCart();
  }
}

class AddToCartUseCase
    extends ResultFutureUseCaseWithParams<String, (int, int)> {
  AddToCartUseCase(this._cartRepo);

  final CartRepo _cartRepo;

  @override
  ResultFuture<String> call((int productId, int quantity) request) {
    return _cartRepo.addToCart(request);
  }
}

class DeleteFromCartUseCase extends ResultFutureUseCaseWithParams<String, int> {
  DeleteFromCartUseCase(this._cartRepo);

  final CartRepo _cartRepo;

  @override
  ResultFuture<String> call(int productId) {
    return _cartRepo.deleteFromCart(productId);
  }
}

class IncreaceProductquntatyUseCase
    extends ResultFutureUseCaseWithParams<String, (int, int)> {
  IncreaceProductquntatyUseCase(this._cartRepo);

  final CartRepo _cartRepo;

  @override
  ResultFuture<String> call((int productId, int quantity) request) {
    return _cartRepo.increaceProductquntaty(request);
  }
}

class DecreaseProductquntatyUseCase
    extends ResultFutureUseCaseWithParams<String, (int, int)> {
  DecreaseProductquntatyUseCase(this._cartRepo);

  final CartRepo _cartRepo;

  @override
  ResultFuture<String> call((int productId, int quantity) request) {
    return _cartRepo.decreaseProductquntaty(request);
  }
}
