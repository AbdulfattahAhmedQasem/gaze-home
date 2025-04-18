import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/driver_order_actions/driver_order_actions_cubit.dart';
import 'package:gazhome/presentation/cubit/driver_orders/driver_orders_cubit.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';

void driverActionsListener({
  required BuildContext context,
  required DriverOrderActionsState state,
  required DriverScreenName driverScreenName,
}) {
  state.whenOrNull(
    loading: () {
      AppFunctions.showAppDialog<void>(
        context,
        barrierDismissible: false,
        child: AppLoading.submit(),
      );
    },
    error: (message) {
      context.closeDialogIfOppened();
      AppFunctions.showToast(message);
    },
    loaded: (message) {
      context.closeDialogIfOppened();
      AppFunctions.showToast(message, type: MessageType.success);
      if (driverScreenName.isBookOrder()) {
        context.mainCubit.updateIndex(1);
      } else {
        context.read<DriverOrdersCubit>().getOrders();
      }
    },
  );
}
