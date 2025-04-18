import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/datasources/remote/home_remote_data_source.dart';
import 'package:gazhome/data/models/category_model.dart';
import 'package:gazhome/data/models/product_model.dart';

class HomeRepo {
  const HomeRepo(this._homeRemoteDataSource);

  final HomeRemoteDataSource _homeRemoteDataSource;

  ResultFuture<List<CategoryModel>> getCategories() async {
    return returnResponse<List<CategoryModel>>(() async {
      return _homeRemoteDataSource.getCategories();
    });
  }

  ResultFuture<List<ProductModel>> getProducts(int categoryId) async {
    return returnResponse<List<ProductModel>>(() async {
      return _homeRemoteDataSource.getProducts(categoryId);
    });
  }

  ResultFuture<List<String>> getBanners() async {
    return returnResponse<List<String>>(() async {
      return _homeRemoteDataSource.getBanners();
    });
  }
}
