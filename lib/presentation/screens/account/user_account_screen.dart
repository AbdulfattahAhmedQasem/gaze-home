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
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/account/account_cubit.dart';
import 'package:gazhome/presentation/cubit/user_orders/user_orders_cubit.dart';
import 'package:gazhome/presentation/screens/account/widgets/account_bottom_part.dart';
import 'package:gazhome/presentation/screens/account/widgets/user_account_form.dart';
import 'package:gazhome/presentation/screens/account/widgets/user_order_card.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_no_data.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/blue_text.dart';
import 'package:gazhome/presentation/widgets/notification_icon.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountState>(
      listener: _listener,
      child: AppScaffold(
        appBar: AppBarWidget(
          title: AppStrings.account.tr(),
          actions: const [NotificationIcon()],
        ),
        padding: AppSizes.screenPadding.copyWith(bottom: 16.h),
        body: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: context.read<UserOrdersCubit>().getOrders,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          BlueText(AppStrings.myAccount.tr()),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.h),
                            child: const UserAccountForm(),
                          ),
                          BlueText(AppStrings.myOrders.tr()),
                          15.vSpace,
                          Text(
                            AppStrings.attention.tr(),
                            style: AppTextStyle(
                              fontSize: 12.sp,
                              color: context.colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          12.vSpace,
                        ],
                      ),
                    ),
                    BlocBuilder<UserOrdersCubit, UserOrdersState>(
                      buildWhen:
                          (previous, current) =>
                              previous.requestState != current.requestState ||
                              previous.orders != current.orders,
                      builder: (context, state) {
                        if (state.requestState.isLoading()) {
                          return SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.only(top: 100.h),
                              child: AppLoading.fetch(),
                            ),
                          );
                        } else if (state.requestState.hasError()) {
                          return SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.only(top: 50.h),
                              child: AppErrorWidget(
                                message: state.message,
                                onTap:
                                    context.read<UserOrdersCubit>().getOrders,
                              ),
                            ),
                          );
                        } else if (state.requestState.isLoaded()) {
                          if (state.orders.isEmpty) {
                            return SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.only(top: 32.h),
                                child: const AppNoData(),
                              ),
                            );
                          } else {
                            return SliverList.separated(
                              itemBuilder: (context, index) {
                                return UserOrderCard(
                                  order: state.orders[index],
                                  index: index,
                                );
                              },
                              separatorBuilder: (_, __) {
                                return AppSizes.inset.vSpace;
                              },
                              itemCount: state.orders.length,
                            );
                          }
                        }
                        return const SizedBox.shrink();
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
    if (state.updateDataState.hasError() ||
        state.changePhoneState.hasError() ||
        state.deleteAccountState.hasError()) {
      AppFunctions.showToast(state.message);
    } else if (state.updateDataState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
    } else if (state.changePhoneState.isLoaded()) {
      context.pushNamed(
        Routes.verificationCode,
        arguments: {
          'phone':
              context.read<AccountCubit>().data.phoneNumberController!.text,
          'route': VerificationCodeRoute.account,
        },
      );
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
