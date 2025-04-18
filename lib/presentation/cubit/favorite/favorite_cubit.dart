import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/data/models/product_model.dart';
import 'package:gazhome/data/usecases/favorite_use_cases.dart';

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(
    this._getMyFavoritesUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
  ) : super(const FavoriteState());

  final GetMyFavoritesUseCase _getMyFavoritesUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  Future<void> getMyFavorites() async {
    emit(
      state.copyWith(
        requestState: RequestState.loading,
        removeState: RequestState.initial,
      ),
    );
    final result = await _getMyFavoritesUseCase();
    result.when(
      right: (products) {
        emit(
          state.copyWith(requestState: RequestState.loaded, products: products),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<bool> addToFavorites(int productId) async {
    emit(
      state.copyWith(
        addState: RequestState.loading,
        removeState: RequestState.initial,
        addIds: [...state.addIds, productId],
      ),
    );
    final result = await _addToFavoritesUseCase(productId);
    return result.when(
      right: (message) async {
        emit(
          state.copyWith(
            addState: RequestState.loaded,
            message: message,
            addIds: [...state.addIds]..remove(productId),
          ),
        );
        return true;
      },
      left: (failure) async {
        emit(
          state.copyWith(
            addState: RequestState.error,
            message: failure.message,
            addIds: [...state.addIds]..remove(productId),
          ),
        );
        return false;
      },
    );
  }

  Future<bool> removeFromFavorites({
    required int productId,
    required int index,
    required bool isFromFavoriteScreen,
  }) async {
    emit(
      state.copyWith(
        removeState: RequestState.loading,
        addState: RequestState.initial,
        removeIds: [...state.removeIds, productId],
      ),
    );
    final result = await _removeFromFavoritesUseCase(productId);
    return result.when(
      right: (message) async {
        final products = [...state.products];
        emit(
          state.copyWith(
            removeState: RequestState.loaded,
            message: message,
            products:
                isFromFavoriteScreen ? (products..removeAt(index)) : products,
            removeIds: [...state.removeIds]..remove(productId),
          ),
        );
        return true;
      },
      left: (failure) async {
        emit(
          state.copyWith(
            removeState: RequestState.error,
            message: failure.message,
            removeIds: [...state.removeIds]..remove(productId),
          ),
        );
        return false;
      },
    );
  }
}
