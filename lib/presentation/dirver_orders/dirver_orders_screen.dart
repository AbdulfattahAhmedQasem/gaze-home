import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/presentation/cubit/driver_order_actions/driver_order_actions_cubit.dart';
import 'package:gazhome/presentation/cubit/driver_order_actions/driver_order_actions_listener.dart';
import 'package:gazhome/presentation/cubit/driver_orders/driver_orders_cubit.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_no_data.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/driver_order_card/driver_order_card.dart';
import 'package:gazhome/presentation/widgets/notification_icon.dart';

class DirverOrdersScreen extends StatelessWidget {
  const DirverOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DriverOrderActionsCubit, DriverOrderActionsState>(
      listener: (context, state) => driverActionsListener(
        context: context,
        state: state,
        driverScreenName: DriverScreenName.myOrders,
      ),
      child: AppScaffold(
        appBar: AppBarWidget(
          title: AppStrings.myOrders1.tr(),
          actions: const [NotificationIcon()],
        ),
        body: BlocBuilder<DriverOrdersCubit, DriverOrdersState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                return const SizedBox.shrink();
              },
              loading: () {
                return AppLoading.fetch();
              },
              loaded: (orders) {
                return orders.isEmpty
                    ? const AppNoData()
                    : RefreshIndicator(
                        onRefresh: () =>
                            context.read<DriverOrdersCubit>().getOrders(),
                        child: ListView.separated(
                          padding: AppSizes.screenPadding,
                          itemBuilder: (context, index) {
                            return DriverOrderCard(
                              order: orders[index],
                              driverScreenName: DriverScreenName.myOrders,
                            );
                          },
                          separatorBuilder: (_, __) {
                            return AppSizes.inset.vSpace;
                          },
                          itemCount: orders.length,
                        ),
                      );
              },
              error: (message) {
                return AppErrorWidget(
                  message: message,
                  onTap: context.read<DriverOrdersCubit>().getOrders,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
