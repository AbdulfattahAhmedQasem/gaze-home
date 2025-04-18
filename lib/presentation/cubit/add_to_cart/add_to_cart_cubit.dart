import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/data/usecases/cart_use_cases.dart';

part 'add_to_cart_state.dart';
part 'add_to_cart_cubit.freezed.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this._addToCartUseCase) : super(const AddToCartState());

  final AddToCartUseCase _addToCartUseCase;

  Future<void> addToCart({
    required int productId,
    required int quantity,
  }) async {
    emit(
      state.copyWith(
        requestState: RequestState.loading,
        productIds: [...state.productIds, productId],
      ),
    );
    final result = await _addToCartUseCase((productId, quantity));
    result.when(
      right: (message) {
        emit(
          state.copyWith(
            requestState: RequestState.loaded,
            message: message,
            productIds: [...state.productIds]..remove(productId),
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            message: failure.message,
            productIds: [...state.productIds]..remove(productId),
          ),
        );
      },
    );
  }
}
