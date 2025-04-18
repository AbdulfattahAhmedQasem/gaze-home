import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/data/models/cart_response.dart';
import 'package:gazhome/data/usecases/cart_use_cases.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._getCartProductsUseCase,
    this._increaceProductquntatyUseCase,
    this._decreaceProductquntatyUseCase,
    this._deleteFromCartUseCase,
  ) : super(const CartState());

  final GetCartProductsUseCase _getCartProductsUseCase;
  final IncreaceProductquntatyUseCase _increaceProductquntatyUseCase;
  final DecreaseProductquntatyUseCase _decreaceProductquntatyUseCase;
  final DeleteFromCartUseCase _deleteFromCartUseCase;

  Future<void> getCartProducts() async {
    emit(
      state.copyWith(
        requestState: RequestState.loading,
        increaseState: RequestState.initial,
        decreaseState: RequestState.initial,
        deleteState: RequestState.initial,
      ),
    );
    final result = await _getCartProductsUseCase();
    result.when(
      right: (cartResponse) {
        emit(
          state.copyWith(
            requestState: RequestState.loaded,
            cartProducts: cartResponse.cartProducts,
            totalCost: cartResponse.totalCost,
            totalPriceAfterTax: cartResponse.totalCostWithShipping,
          ),
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

  Future<void> increaseQuntaty({
    required CartModel cart,
    required int quantity,
  }) async {
    emit(
      state.copyWith(
        increaseState: RequestState.loading,
        decreaseState: RequestState.initial,
        deleteState: RequestState.initial,
        increaseIds: [...state.increaseIds, cart.id],
      ),
    );
    final result = await _increaceProductquntatyUseCase((cart.id, quantity));
    result.when(
      right: (message) {
        final cartProducts = [...state.cartProducts];
        final newQuantity = cart.quantityInCart + quantity;

        final index = cartProducts.indexOf(cart);
        cartProducts[index] = cartProducts[index].copyWith(
          quantityInCart: newQuantity,
          totalPrice: cart.price * newQuantity,
        );

        emit(
          state.copyWith(
            increaseState: RequestState.loaded,
            message: message,
            cartProducts: cartProducts,
            totalCost: state.totalCost + cart.price * quantity,
            increaseIds: [...state.increaseIds]..remove(cart.id),
            currentCartId: cart.id,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            increaseState: RequestState.error,
            message: failure.message,
            increaseIds: [...state.increaseIds]..remove(cart.id),
            currentCartId: cart.id,
          ),
        );
      },
    );
  }

  Future<void> decreaseQuntaty({
    required CartModel cart,
    required int quantity,
  }) async {
    emit(
      state.copyWith(
        decreaseState: RequestState.loading,
        increaseState: RequestState.initial,
        deleteState: RequestState.initial,
        decreaseIds: [...state.decreaseIds, cart.id],
      ),
    );
    final result = await _decreaceProductquntatyUseCase((cart.id, quantity));
    result.when(
      right: (message) {
        final cartProducts = [...state.cartProducts];
        final newQuantity = cart.quantityInCart - (-quantity);
        final index = cartProducts.indexOf(cart);
        cartProducts[index] = cartProducts[index].copyWith(
          quantityInCart: newQuantity,
          totalPrice: cart.price * newQuantity,
        );

        emit(
          state.copyWith(
            decreaseState: RequestState.loaded,
            message: message,
            cartProducts: cartProducts,
            totalCost: state.totalCost - cart.price * quantity,
            decreaseIds: [...state.decreaseIds]..remove(cart.id),
            currentCartId: cart.id,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            decreaseState: RequestState.error,
            message: failure.message,
            decreaseIds: [...state.decreaseIds]..remove(cart.id),
            currentCartId: cart.id,
          ),
        );
        return false;
      },
    );
  }

  Future<void> removeFromCart(CartModel cart) async {
    emit(
      state.copyWith(
        deleteState: RequestState.loading,
        increaseState: RequestState.initial,
        decreaseState: RequestState.initial,
        deleteIds: [...state.deleteIds, cart.id],
      ),
    );
    final result = await _deleteFromCartUseCase(cart.id);
    result.when(
      right: (message) {
        emit(
          state.copyWith(
            deleteState: RequestState.loaded,
            message: message,
            cartProducts: [...state.cartProducts]..remove(cart),
            totalCost: state.totalCost - cart.totalPrice,
            deleteIds: [...state.deleteIds]..remove(cart.id),
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            deleteState: RequestState.error,
            message: failure.message,
            deleteIds: [...state.deleteIds]..remove(cart.id),
          ),
        );
      },
    );
  }
}
