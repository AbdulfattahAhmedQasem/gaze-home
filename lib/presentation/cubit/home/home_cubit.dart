import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/errors/app_failure.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/models/category_model.dart';
import 'package:gazhome/data/models/product_model.dart';
import 'package:gazhome/data/usecases/favorite_use_cases.dart';
import 'package:gazhome/data/usecases/home_use_cases.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getBannersUseCase,
    this._getCategoriesUseCase,
    this._getProductsUseCase,
    this._getMyFavoritesUseCase,
  ) : super(const HomeState());

  final GetBannersUseCase _getBannersUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetProductsUseCase _getProductsUseCase;
  final GetMyFavoritesUseCase _getMyFavoritesUseCase;

  Map<int, ProductModel> _favorites = {};

  Future<void> getInitialData() async {
    emit(state.copyWith(requestState: RequestState.loading));
    try {
      final result = await Future.wait([
        _getBanners(),
        _getCategories(),
        _getMyFavorites(),
      ]);
      final banners = result[0] as List<String>;
      final categories = result[1] as List<CategoryModel>;
      final currentCategory = categories.isEmpty ? null : categories.first;
      var products = currentCategory == null
          ? <ProductModel>[]
          : await _getProducts(currentCategory.id);
      products = _setFavoriteStatusInProduct(products);
      emit(
        state.copyWith(
          requestState: RequestState.loaded,
          productsState: RequestState.loaded,
          banners: banners,
          categories: categories,
          products: products,
          currentCategory: currentCategory,
        ),
      );
    } on AppFailure catch (failure) {
      emit(
        state.copyWith(
          requestState: RequestState.error,
          message: failure.message,
        ),
      );
    }
  }

  Future<void> getProducts(CategoryModel category) async {
    emit(
      state.copyWith(
        productsState: RequestState.loading,
        currentCategory: category,
      ),
    );
    try {
      var products = await _getProducts(category.id);
      products = _setFavoriteStatusInProduct(products);
      emit(
        state.copyWith(productsState: RequestState.loaded, products: products),
      );
    } on AppFailure catch (failure) {
      emit(
        state.copyWith(
          productsState: RequestState.error,
          message: failure.message,
        ),
      );
    }
  }

  Future<List<String>> _getBanners() async {
    final result = await _getBannersUseCase();
    return result.when(
      right: (banners) => banners,
      left: (failure) => throw failure,
    );
  }

  Future<List<CategoryModel>> _getCategories() async {
    final result = await _getCategoriesUseCase();
    return result.when(
      right: (categories) => categories,
      left: (failure) => throw failure,
    );
  }

  Future<List<ProductModel>> _getProducts(int categoryId) async {
    final result = await _getProductsUseCase(categoryId);
    return result.when(
      right: (products) => products,
      left: (failure) => throw failure,
    );
  }

  Future<bool> _getMyFavorites() async {
    if (_favorites.isNotEmpty || !sl<SharedData>().isUserAuthenticated) {
      return true;
    }
    final result = await _getMyFavoritesUseCase();
    return result.when(
      right: (products) {
        _favorites = {for (final product in products) product.id: product};
        return true;
      },
      left: (failure) => throw failure,
    );
  }

  List<ProductModel> _setFavoriteStatusInProduct(List<ProductModel> products) {
    final mappedProducts = {
      for (final product in products) product.id: product,
    };
    mappedProducts.forEach((id, product) {
      if (_favorites[id] != null) {
        mappedProducts[id] = mappedProducts[id]!.copyWith(isFavorite: true);
      }
    });
    return mappedProducts.values.toList();
  }

  void changeProductFavoriteState({
    required int productId,
    required bool isFavorite,
  }) {
    final products = [...state.products];
    final index = products.indexWhere((product) => product.id == productId);
    products[index] = products[index].copyWith(isFavorite: isFavorite);
    emit(state.copyWith(products: products));
  }
}
