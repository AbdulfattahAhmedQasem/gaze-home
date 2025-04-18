import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/models/product_model.dart';
import 'package:gazhome/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import 'package:gazhome/presentation/cubit/counter/counter_cubit.dart';
import 'package:gazhome/presentation/screens/home/widgets/product_favorite_icon.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_cached_image.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/price_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.index,
    required this.isFromFavoriteScreen,
    super.key,
  });

  final ProductModel product;
  final int index;
  final bool isFromFavoriteScreen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => sl<CounterCubit>(
        param1: product.quantity == 0 ? 0 : 1,
        param2: product.quantity,
      ),
      child: AppContainer(
        padding: EdgeInsets.zero,
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image section (fixed height)
                SizedBox(
                  height: 130.h,
                  width: double.infinity,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: AppCachedImage(
                            imageUrl: product.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      if (sl<SharedData>().isUserAuthenticated)
                        PositionedDirectional(
                          start: 6.r,
                          top: 6.r,
                          child: ProductFavoriteIcon(
                            productId: product.id,
                            isFavorite: product.isFavorite,
                            index: index,
                            isFromFavoriteScreen: isFromFavoriteScreen,
                          ),
                        ),
                    ],
                  ),
                ),

                // Product info
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title - fixed height with ellipsis if too long
                        SizedBox(
                          height: 50.h,
                          child: Text(
                            context.isRTL() ? product.nameAr : product.nameEn,
                            style: AppTextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeightHelper.bold,
                            ),
                            textAlign: context.isRTL()
                                ? TextAlign.right
                                : TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Flexible space for other elements
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Price
                              PriceWidget(price: product.price),
                              SizedBox(height: 6.h),

                              // Counter
                              _buildCounter(context),
                              SizedBox(height: 6.h),

                              // Add to cart button
                              _buildAddToCartButton(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      height: 28.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.read<CounterCubit>().increase();
                },
                child: SizedBox(
                  width: 32.w,
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '${state.quantity}/${state.availableQuantity}',
                style: AppTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<CounterCubit>().decrease();
                },
                child: SizedBox(
                  width: 32.w,
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: _addToCartListener,
      builder: (context, state) {
        return state.requestState.isLoading() &&
                state.productIds.contains(product.id)
            ? AppLoading.inline()
            : Container(
                width: double.infinity,
                height: 28.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: TextButton(
                  onPressed: () {
                    if (product.quantity <= 0) {
                      AppFunctions.showToast(
                        AppStrings.notAvailable.tr(),
                      );
                    } else {
                      final quantity =
                          context.read<CounterCubit>().state.quantity;
                      AppFunctions.checkAuthenticated(context, () {
                        context.read<AddToCartCubit>().addToCart(
                              productId: product.id,
                              quantity: quantity,
                            );
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    AppStrings.addToCart.tr(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
      },
    );
  }

  void _addToCartListener(BuildContext context, AddToCartState state) {
    if (state.requestState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
      context.read<CounterCubit>().reset();
    } else if (state.requestState.hasError()) {
      AppFunctions.showToast(state.message);
    }
  }
}
