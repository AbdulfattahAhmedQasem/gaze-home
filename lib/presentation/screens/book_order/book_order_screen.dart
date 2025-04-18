import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/presentation/cubit/book_order/book_order_cubit.dart';
import 'package:gazhome/presentation/cubit/driver_order_actions/driver_order_actions_cubit.dart';
import 'package:gazhome/presentation/cubit/driver_order_actions/driver_order_actions_listener.dart';
import 'package:gazhome/presentation/screens/book_order/widgets/region_card.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_no_data.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/driver_order_card/driver_order_card.dart';
import 'package:gazhome/presentation/widgets/language_icon.dart';
import 'package:gazhome/presentation/widgets/notification_icon.dart';

class BookOrderScreen extends StatelessWidget {
  const BookOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DriverOrderActionsCubit, DriverOrderActionsState>(
      listener:
          (context, state) => driverActionsListener(
            context: context,
            state: state,
            driverScreenName: DriverScreenName.bookOrder,
          ),
      child: AppScaffold(
        appBar: AppBarWidget(
          title: AppStrings.bookOrder.tr(),
          actions: [const LanguageIcon(), 12.hSpace, const NotificationIcon()],
        ),
        padding: EdgeInsets.only(top: 12.h),
        body: BlocBuilder<BookOrderCubit, BookOrderState>(
          builder: (context, state) {
            if (state.requestState.isLoading()) {
              return AppLoading.fetch();
            } else if (state.requestState.hasError()) {
              return AppErrorWidget(
                message: state.message,
                onTap: context.read<BookOrderCubit>().getInitialData,
              );
            } else if (state.requestState.isLoaded()) {
              if (state.regions.isEmpty) {
                return const AppNoData();
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 42.h,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.hScreenPadding.w,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return RegionCard(
                            region: state.regions[index],
                            currentRegion: state.currentRegion,
                          );
                        },
                        separatorBuilder: (_, __) {
                          return AppSizes.inset.hSpace;
                        },
                        itemCount: state.regions.length,
                      ),
                    ),
                    AppSizes.inset.vSpace,
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (state.ordersState.isLoading()) {
                            return AppLoading.fetch();
                          } else if (state.ordersState.hasError()) {
                            return AppErrorWidget(
                              message: state.message,
                              onTap:
                                  () => context
                                      .read<BookOrderCubit>()
                                      .getOrders(state.currentRegion!),
                            );
                          } else if (state.ordersState.isLoaded()) {
                            return state.orders.isEmpty
                                ? const AppNoData()
                                : RefreshIndicator(
                                  onRefresh:
                                      () => context
                                          .read<BookOrderCubit>()
                                          .getOrders(state.currentRegion!),
                                  child: ListView.separated(
                                    padding: AppSizes.screenPadding.copyWith(
                                      top: 0,
                                    ),
                                    itemBuilder: (context, index) {
                                      return DriverOrderCard(
                                        order: state.orders[index],
                                        driverScreenName:
                                            DriverScreenName.bookOrder,
                                      );
                                    },
                                    separatorBuilder: (_, __) {
                                      return AppSizes.inset.vSpace;
                                    },
                                    itemCount: state.orders.length,
                                  ),
                                );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
