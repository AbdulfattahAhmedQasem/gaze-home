import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/datasources/remote/favorite_remote_data_source.dart';
import 'package:gazhome/data/models/product_model.dart';

class FavoriteRepo {
  FavoriteRepo(this._favoriteRemoteDataSource);

  final FavoriteRemoteDataSource _favoriteRemoteDataSource;

  ResultFuture<List<ProductModel>> getMyFavorites() async {
    return returnResponse<List<ProductModel>>(() async {
      return _favoriteRemoteDataSource.getMyFavorites();
    });
  }

  ResultFuture<String> addToFavorites(int productId) async {
    return returnResponse<String>(() async {
      return _favoriteRemoteDataSource.addToFavorites(productId);
    });
  }

  ResultFuture<String> removeFromFavorites(int productId) async {
    return returnResponse<String>(() async {
      return _favoriteRemoteDataSource.removeFromFavorites(productId);
    });
  }
}
