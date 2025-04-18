import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/core/utilities/debouncer.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/models/cart_response.dart';
import 'package:gazhome/presentation/cubit/cart/cart_cubit.dart';
import 'package:gazhome/presentation/cubit/counter/counter_cubit.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_cached_image.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';
import 'package:gazhome/presentation/widgets/app_counter.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/price_widget.dart';

class CartCard extends StatelessWidget {
  const CartCard({required this.cart, super.key});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final counterCubit = context.read<CounterCubit>();

    return AppContainer(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.name,
                      style: AppTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                    6.vSpace,
                    Text(
                      cart.description,
                      style: AppTextStyle(fontSize: 12.sp),
                    ),
                    19.vSpace,
                    PriceWidget(price: cart.totalPrice),
                  ],
                ),
              ),
              AppCachedImage(
                imageUrl: cart.image,
                width: 110.w,
                height: 130.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
          16.vSpace,
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  SizedBox(
                    width: 140.w,
                    child: AppCounter(
                      onIncrement: () {
                        Debouncer.run(() {
                          sl<SharedData>().cartContextMap[cart.id] = context;
                          cartCubit.increaseQuntaty(
                            cart: cart,
                            quantity: counterCubit.deboucedQuantity,
                          );
                        });
                      },
                      onDecrement: () {
                        Debouncer.run(() {
                          sl<SharedData>().cartContextMap[cart.id] = context;
                          cartCubit.decreaseQuntaty(
                            cart: cart,
                            quantity: counterCubit.deboucedQuantity,
                          );
                        });
                      },
                      isIncreaseLoading: state.increaseState.isLoading() &&
                          state.increaseIds.contains(cart.id),
                      isDecreaseLoading: state.decreaseState.isLoading() &&
                          state.decreaseIds.contains(cart.id),
                    ),
                  ),
                  const Spacer(),
                  if (state.deleteState.isLoading() &&
                      state.deleteIds.contains(cart.id))
                    AppLoading.inline()
                  else
                    AppButton(
                      onPressed: () {
                        sl<SharedData>().cartContextMap[cart.id] = context;
                        cartCubit.removeFromCart(cart);
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppSvgs.trash,
                            width: 12.r,
                            height: 12.r,
                          ),
                          6.hSpace,
                          Text(
                            AppStrings.delete.tr(),
                            style: AppTextStyle(
                              fontSize: 9.sp,
                              color: AppColors.c333333,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
