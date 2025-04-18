import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/presentation/cubit/favorite/favorite_cubit.dart';
import 'package:gazhome/presentation/cubit/home/home_cubit.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';

class ProductFavoriteIcon extends StatelessWidget {
  const ProductFavoriteIcon({
    required this.productId,
    required this.isFavorite,
    required this.index,
    required this.isFromFavoriteScreen,
    super.key,
  });

  final int productId;
  final bool isFavorite;
  final int index;
  final bool isFromFavoriteScreen;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {
        if (isFavorite) {
          context
              .read<FavoriteCubit>()
              .removeFromFavorites(
                productId: productId,
                index: index,
                isFromFavoriteScreen: isFromFavoriteScreen,
              )
              .then((isSuccess) {
                if (isSuccess) {
                  context.read<HomeCubit>().changeProductFavoriteState(
                    productId: productId,
                    isFavorite: false,
                  );
                }
              });
        } else {
          context.read<FavoriteCubit>().addToFavorites(productId).then((
            isSuccess,
          ) {
            if (isSuccess) {
              context.read<HomeCubit>().changeProductFavoriteState(
                productId: productId,
                isFavorite: true,
              );
            }
          });
        }
      },
      padding: EdgeInsets.all(2.r),
      width: 35.r,
      height: 35.r,
      borderColor: Colors.transparent,
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return state.addState.isLoading() &&
                      state.addIds.contains(productId) ||
                  state.removeState.isLoading() &&
                      state.removeIds.contains(productId)
              ? AppLoading.inline()
              : SvgPicture.asset(
                isFavorite ? AppSvgs.favorite1 : AppSvgs.favorite2,
                width: 35.r,
                height: 35.r,
                colorFilter: AppColors.colorFliter(
                  isFavorite ? AppColors.red : AppColors.cC1C1C1,
                ),
              );
        },
      ),
    );
  }
}
