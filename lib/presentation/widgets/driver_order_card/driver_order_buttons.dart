import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/driver_order_actions/driver_order_actions_cubit.dart';
import 'package:gazhome/presentation/cubit/driver_orders/driver_orders_cubit.dart';
import 'package:gazhome/presentation/dialogs/action_dialog.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class DriverOrderButtons extends StatelessWidget {
  const DriverOrderButtons({
    required this.driverScreenName,
    required this.orderId,
    super.key,
  });

  final DriverScreenName driverScreenName;
  final int orderId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DriverOrderActionsCubit>();
    final driverCubit = context.read<DriverOrdersCubit>();
    return SizedBox(
      height: 38.h,
      child: Row(
        children: [
          if (driverScreenName.isBookOrder())
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                child: AppDecoratedButton(
                  onPressed: () {
                    cubit.getOrder(orderId);
                  },
                  text: AppStrings.receiveOrder.tr(),
                  textStyle: AppTextStyle(fontSize: 10.sp),
                ),
              ),
            )
          else ...[
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                child: AppDecoratedButton(
                  onPressed: () {
                    AppFunctions.showAppDialog<void>(
                      context,
                      child: ActionDialog(
                        title: AppStrings.doYouWantToNotDeliverThisOrder.tr(),
                        type: MessageType.question,
                        onPressed: () {
                          context.pop();
                          cubit.rejectOrder(orderId);
                        },
                      ),
                    );
                  },
                  text: AppStrings.notDelivery.tr(),
                  textStyle: AppTextStyle(fontSize: 10.sp),
                ),
              ),
            ),
            12.hSpace,
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                child: AppDecoratedButton(
                  onPressed: () {
                    AppFunctions.showAppDialog<void>(
                      context,
                      child: ActionDialog(
                        title: AppStrings.didTheCustomerRefusedTheOrder.tr(),
                        type: MessageType.question,
                        onPressed: () {
                          context.pop();
                          cubit.cancelOrder(orderId);
                        },
                      ),
                    );
                  },
                  text: AppStrings.rejectOrder.tr(),
                  textStyle: AppTextStyle(fontSize: 10.sp),
                ),
              ),
            ),
            12.hSpace,
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                child: AppDecoratedButton(
                  onPressed: () {
                    AppFunctions.showAppDialog<void>(
                      context,
                      child: ActionDialog(
                        title: AppStrings.hasTheAmountBeenPaidByTheCustomer.tr(),
                        type: MessageType.question,
                        onPressed: () {
                          context.pop();
                          cubit.updatePaymentToPaid(orderId);
                          driverCubit.deleteOrder(orderId);
                        },
                      ),
                    );
                  },
                  text: AppStrings.completeOrder1.tr(),
                  textStyle: AppTextStyle(fontSize: 10.sp),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
