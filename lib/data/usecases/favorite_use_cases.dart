import 'package:gazhome/core/usecases/usecases.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/product_model.dart';
import 'package:gazhome/data/repos/favorite_repo.dart';

class GetMyFavoritesUseCase
    extends ResultFutureUseCaseWithoutParams<List<ProductModel>> {
  GetMyFavoritesUseCase(this._favoriteRepo);

  final FavoriteRepo _favoriteRepo;

  @override
  ResultFuture<List<ProductModel>> call() {
    return _favoriteRepo.getMyFavorites();
  }
}

class AddToFavoritesUseCase extends ResultFutureUseCaseWithParams<String, int> {
  AddToFavoritesUseCase(this._favoriteRepo);

  final FavoriteRepo _favoriteRepo;

  @override
  ResultFuture<String> call(int productId) {
    return _favoriteRepo.addToFavorites(productId);
  }
}

class RemoveFromFavoritesUseCase
    extends ResultFutureUseCaseWithParams<String, int> {
  RemoveFromFavoritesUseCase(this._favoriteRepo);

  final FavoriteRepo _favoriteRepo;

  @override
  ResultFuture<String> call(int productId) {
    return _favoriteRepo.removeFromFavorites(productId);
  }
}
