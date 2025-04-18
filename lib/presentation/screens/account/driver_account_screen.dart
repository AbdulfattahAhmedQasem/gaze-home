import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/account/account_cubit.dart';
import 'package:gazhome/presentation/cubit/driver_orders/driver_orders_cubit.dart';
import 'package:gazhome/presentation/screens/account/widgets/account_bottom_part.dart';
import 'package:gazhome/presentation/screens/account/widgets/driver_account_form.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_no_data.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/blue_text.dart';
import 'package:gazhome/presentation/widgets/driver_order_card/driver_order_card.dart';
import 'package:gazhome/presentation/widgets/notification_icon.dart';

class DriverAccountScreen extends StatelessWidget {
  const DriverAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountState>(
      listener: _listener,
      child: AppScaffold(
        appBar: AppBarWidget(
          title: AppStrings.account.tr(),
          actions: const [NotificationIcon()],
        ),
        padding: AppSizes.screenPadding.copyWith(top: 0, bottom: 16.h),
        body: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: context.read<DriverOrdersCubit>().getOrders,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const DriverAccountForm(),
                          24.vSpace,
                          BlueText(AppStrings.myOrders.tr()),
                          12.vSpace,
                        ],
                      ),
                    ),
                    BlocBuilder<DriverOrdersCubit, DriverOrdersState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () {
                            return const SliverToBoxAdapter(
                              child: SizedBox.shrink(),
                            );
                          },
                          loading: () {
                            return SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.only(top: 100.h),
                                child: AppLoading.fetch(),
                              ),
                            );
                          },
                          loaded: (orders) {
                            if (orders.isEmpty) {
                              return const SliverToBoxAdapter(
                                child: AppNoData(),
                              );
                            } else {
                              return SliverList.separated(
                                itemBuilder: (context, index) {
                                  return DriverOrderCard(
                                    order: orders[index],
                                    driverScreenName: DriverScreenName.account,
                                  );
                                },
                                separatorBuilder: (_, __) {
                                  return AppSizes.inset.vSpace;
                                },
                                itemCount: orders.length,
                              );
                            }
                          },
                          error: (message) {
                            return SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.only(top: 30.h),
                                child: AppErrorWidget(
                                  message: message,
                                  onTap: context
                                      .read<DriverOrdersCubit>()
                                      .getOrders,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            AppSizes.inset.vSpace,
            const AccountBottomPart(),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, AccountState state) {
    if (state.deleteAccountState.hasError()) {
      AppFunctions.showToast(state.message);
    } else if (state.deleteAccountState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
      context.pushReplacementNamed(Routes.auth);
    }
    AppFunctions.handleCubitListener(
      context,
      requestState: state.logoutState,
      message: state.message,
      onLoaded: () {
        AppFunctions.showToast(state.message, type: MessageType.success);
        context.pushReplacementNamed(Routes.auth);
      },
    );
  }
}
