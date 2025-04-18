import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/favorite/favorite_cubit.dart';
import 'package:gazhome/presentation/cubit/home/home_cubit.dart';
import 'package:gazhome/presentation/screens/home/widgets/category_card.dart';
import 'package:gazhome/presentation/screens/home/widgets/home_banners.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/language_icon.dart';
import 'package:gazhome/presentation/widgets/notification_icon.dart';
import 'package:gazhome/presentation/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
      listener: _favoriteListener,
      child: AppScaffold(
        appBar: AppBarWidget(
          actions: [const LanguageIcon(), 12.hSpace, const NotificationIcon()],
          showShadow: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.requestState.isLoading()) {
              return AppLoading.fetch();
            } else if (state.requestState.hasError()) {
              return AppErrorWidget(
                message: state.message,
                onTap: context.read<HomeCubit>().getInitialData,
              );
            } else if (state.requestState.isLoaded()) {
              return RefreshIndicator(
                onRefresh: context.read<HomeCubit>().getInitialData,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: HomeBanners(banners: state.banners),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 42.h,
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.hScreenPadding.w,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryCard(
                                category: state.categories[index],
                                currentCategory: state.currentCategory,
                              );
                            },
                            separatorBuilder: (_, __) {
                              return AppSizes.inset.hSpace;
                            },
                            itemCount: state.categories.length,
                          ),
                        ),
                      ),
                    ),
                    if (state.productsState.isLoading())
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: context.height * 0.2),
                          child: AppLoading.fetch(),
                        ),
                      )
                    else if (state.productsState.hasError())
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: context.height * 0.1),
                          child: AppErrorWidget(
                            message: state.message,
                            onTap: () {
                              context.read<HomeCubit>().getProducts(
                                    state.currentCategory!,
                                  );
                            },
                          ),
                        ),
                      )
                    else if (state.productsState.isLoaded())
                      SliverPadding(
                        padding: EdgeInsets.only(
                          left: AppSizes.hScreenPadding.w,
                          right: AppSizes.hScreenPadding.w,
                          bottom: AppSizes.vScreenPadding.h,
                        ),
                        sliver: SliverGrid.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                              isFromFavoriteScreen: false,
                            );
                          },
                          itemCount: state.products.length,
                        ),
                      )
                    else
                      const SliverToBoxAdapter(),
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

  void _favoriteListener(BuildContext context, FavoriteState state) {
    if (state.addState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
    } else if (state.addState.hasError()) {
      AppFunctions.showToast(state.message);
    } else if (state.removeState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
    } else if (state.removeState.hasError()) {
      AppFunctions.showToast(state.message);
    }
  }
}
