part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(RequestState.initial) RequestState requestState,
    @Default(RequestState.initial) RequestState productsState,
    @Default('') String message,
    @Default([]) List<String> banners,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<ProductModel> products,
    CategoryModel? currentCategory,
  }) = _HomeState;
}
