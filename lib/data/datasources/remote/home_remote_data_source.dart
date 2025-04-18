import 'package:gazhome/core/networking/api_constants.dart';
import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/category_model.dart';
import 'package:gazhome/data/models/product_model.dart';

class HomeRemoteDataSource {
  HomeRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<CategoryModel>> getCategories() async {
    return returnRemoteResponse<List<CategoryModel>>(() async {
      final response = await _apiService.get(ApiConstants.categories);
      return List<CategoryModel>.from(
        (response['data'] as List).map<CategoryModel>(
          (category) => CategoryModel.fromMap(category as DataMap),
        ),
      );
    });
  }

  Future<List<ProductModel>> getProducts(int categoryId) async {
    return returnRemoteResponse<List<ProductModel>>(() async {
      final response = await _apiService.get(
        '${ApiConstants.products}/$categoryId',
      );
      return List<ProductModel>.from(
        (response['data'] as List).map<ProductModel>(
          (category) => ProductModel.fromMap(category as DataMap),
        ),
      );
    });
  }

  Future<List<String>> getBanners() async {
    return returnRemoteResponse<List<String>>(() async {
      final response = await _apiService.get(ApiConstants.banners);
      return List<String>.from(
        (response['data'] as DataMap).values.first as List,
      );
    });
  }
}
