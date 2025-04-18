import 'package:gazhome/core/networking/api_constants.dart';
import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/product_model.dart';

class FavoriteRemoteDataSource {
  const FavoriteRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<ProductModel>> getMyFavorites() async {
    return returnRemoteResponse<List<ProductModel>>(() async {
      final response = await _apiService.get(ApiConstants.favorite);
      return List<ProductModel>.from(
        (response['data'] as List).map<ProductModel>(
          (product) => ProductModel.fromMap(
            (product as DataMap)['product'] as DataMap,
            isFromFavoriteScreen: true,
          ),
        ),
      );
    });
  }

  Future<String> addToFavorites(int productId) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.favorite,
        body: {'product_id': productId},
      );
      return response['message'] as String;
    });
  }

  Future<String> removeFromFavorites(int productId) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.delete(
        '${ApiConstants.favorite}/$productId',
      );
      return response['message'] as String;
    });
  }
}
