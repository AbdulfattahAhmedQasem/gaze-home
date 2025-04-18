import 'package:gazhome/core/usecases/usecases.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/category_model.dart';
import 'package:gazhome/data/models/product_model.dart';
import 'package:gazhome/data/repos/home_repo.dart';

class GetCategoriesUseCase
    extends ResultFutureUseCaseWithoutParams<List<CategoryModel>> {
  GetCategoriesUseCase(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  ResultFuture<List<CategoryModel>> call() {
    return _homeRepo.getCategories();
  }
}

class GetProductsUseCase
    extends ResultFutureUseCaseWithParams<List<ProductModel>, int> {
  GetProductsUseCase(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  ResultFuture<List<ProductModel>> call(int categoryId) {
    return _homeRepo.getProducts(categoryId);
  }
}

class GetBannersUseCase extends ResultFutureUseCaseWithoutParams<List<String>> {
  GetBannersUseCase(this._homeRepo);

  final HomeRepo _homeRepo;

  @override
  ResultFuture<List<String>> call() {
    return _homeRepo.getBanners();
  }
}
