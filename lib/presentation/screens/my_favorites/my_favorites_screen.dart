import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/favorite/favorite_cubit.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_no_data.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/notification_icon.dart';
import 'package:gazhome/presentation/widgets/product_card.dart';

class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: AppStrings.favorite.tr(),
        actions: const [NotificationIcon()],
      ),
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: _listener,
        builder: (context, state) {
          if (state.requestState.isLoading()) {
            return AppLoading.fetch();
          } else if (state.requestState.hasError()) {
            return AppErrorWidget(
              message: state.message,
              onTap: context.read<FavoriteCubit>().getMyFavorites,
            );
          } else if (state.requestState.isLoaded()) {
            if (state.products.isEmpty) {
              return const AppNoData();
            } else {
              return RefreshIndicator(
                onRefresh: context.read<FavoriteCubit>().getMyFavorites,
                child: GridView.builder(
                  padding: AppSizes.screenPadding,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: getValueForScreenType(
                      medium: 0.67,
                      semiLarge: 0.7,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: state.products[index],
                      index: index,
                      isFromFavoriteScreen: true,
                    );
                  },
                  itemCount: state.products.length,
                ),
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _listener(BuildContext context, FavoriteState state) {
    if (state.removeState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
    } else if (state.removeState.hasError()) {
      AppFunctions.showToast(state.message);
    }
  }
}
