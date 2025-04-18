import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/presentation/cubit/cart/cart_cubit.dart';
import 'package:gazhome/presentation/cubit/counter/counter_cubit.dart';
import 'package:gazhome/presentation/cubit/make_order/make_order_cubit.dart';
import 'package:gazhome/presentation/screens/cart/widgets/cart_card.dart';
import 'package:gazhome/presentation/screens/cart/widgets/cart_count.dart';
import 'package:gazhome/presentation/screens/cart/widgets/cart_summary.dart';
import 'package:gazhome/presentation/widgets/address_button.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_no_data.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/notification_icon.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        appBar: AppBarWidget(
          title: AppStrings.cart.tr(),
          actions: const [NotificationIcon()],
        ),
        padding: AppSizes.screenPadding.copyWith(top: 0, bottom: 0),
        body: BlocConsumer<CartCubit, CartState>(
          listener: _listener,
          buildWhen: (previous, current) =>
              previous.requestState != current.requestState ||
              previous.cartProducts != current.cartProducts,
          builder: (context, state) {
            if (state.requestState.isLoading()) {
              return AppLoading.fetch();
            } else if (state.requestState.hasError()) {
              return AppErrorWidget(
                message: state.message,
                onTap: () {
                  context.read<CartCubit>().getCartProducts();
                },
              );
            } else if (state.requestState.isLoaded()) {
              return RefreshIndicator(
                onRefresh: context.read<CartCubit>().getCartProducts,
                child: Column(
                  children: [
                    CartCount(numberOfProducts: state.cartProducts.length),
                    if (state.cartProducts.isEmpty)
                      const Expanded(child: AppNoData())
                    else ...[
                      10.vSpace,
                      BlocBuilder<MakeOrderCubit, MakeOrderState>(
                        builder: (context, state) {
                          return AddressButton(address: state.address);
                        },
                      ),
                      10.vSpace,
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final cart = state.cartProducts[index];
                            return BlocProvider<CounterCubit>(
                              create: (context) => sl<CounterCubit>(
                                param1: cart.quantityInCart,
                                param2: cart.quantity,
                              ),
                              child: CartCard(cart: cart),
                            );
                          },
                          separatorBuilder: (_, __) {
                            return AppSizes.inset.vSpace;
                          },
                          itemCount: state.cartProducts.length,
                        ),
                      ),
                      12.vSpace,
                      CartSummary(
                        numberOfProducts: state.cartProducts.length,
                        totalCost: state.totalCost,
                      ),
                    ],
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _listener(BuildContext context, CartState state) {
    final cartContextMap = sl<SharedData>().cartContextMap;
    if (state.increaseState.hasError() || state.decreaseState.hasError()) {
      AppFunctions.showToast(state.message);
      (cartContextMap[state.currentCartId!]!)
          .read<CounterCubit>()
          .resetDebouncedQuantity(resetInitialQuantity: true);
      cartContextMap.remove(state.currentCartId);
    } else if (state.deleteState.hasError()) {
      AppFunctions.showToast(state.message);
    } else if (state.increaseState.isLoaded() ||
        state.decreaseState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
      (cartContextMap[state.currentCartId!]!)
          .read<CounterCubit>()
          .resetDebouncedQuantity();
      cartContextMap.remove(state.currentCartId);
    } else if (state.deleteState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
      context.read<CartCubit>().getCartProducts();
    }
  }
}
