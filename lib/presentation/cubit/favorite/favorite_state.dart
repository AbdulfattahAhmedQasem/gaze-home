part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(RequestState.initial) RequestState requestState,
    @Default(RequestState.initial) RequestState addState,
    @Default(RequestState.initial) RequestState removeState,
    @Default('') String message,
    @Default([]) List<ProductModel> products,
    @Default([]) List<int> addIds,
    @Default([]) List<int> removeIds,
  }) = _FavoriteState;
}
