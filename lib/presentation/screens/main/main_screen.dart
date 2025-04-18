import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/services/notifications_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/data/static_data/static_data.dart';
import 'package:gazhome/presentation/cubit/driver_orders/driver_orders_cubit.dart';
import 'package:gazhome/presentation/cubit/home/home_cubit.dart';
import 'package:gazhome/presentation/cubit/main/main_cubit.dart';
import 'package:gazhome/presentation/cubit/notifications_count/notifications_count_cubit.dart';
import 'package:gazhome/presentation/dialogs/quit_dialog.dart';
import 'package:gazhome/presentation/screens/main/widgets/main_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (sl<SharedData>().notificationMessage.isNotEmpty) {
      NotificationsService.goToTargetScreenFromTerminated(context);
    }
  }

  @override
  void didChangeDependencies() {
    context.mainCubit.updateIndex(0);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    super.didChangeAppLifecycleState(appLifecycleState);
    if (appLifecycleState == AppLifecycleState.resumed) {
      context.read<NotificationsCountCubit>().getNotificationsCount();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (context.mainCubit.state == 0) {
          AppFunctions.showAppDialog<void>(context, child: const QuitDialog());
        } else {
          context.mainCubit.updateIndex(0);
        }
      },
      child: BlocConsumer<MainCubit, int>(
        listener: (context, index) {
          if (sl<SharedData>().userType.isDriver()) {
            if (index == 1) {
              context.read<DriverOrdersCubit>().getOrders();
            } else if (index == 2) {
              context.read<DriverOrdersCubit>().getOrders(isFromAccount: true);
            }
          }
          if (index == 0) {
            if (!sl<SharedData>().userType.isDriver()) {
              if (!context.read<HomeCubit>().state.requestState.isLoaded()) {
                context.read<HomeCubit>().getInitialData();
              }
            }
          }
        },
        builder: (context, index) {
          final mainItems =
              sl<SharedData>().userType.isDriver()
                  ? mainDriverItems
                  : mainUserItems;
          return Scaffold(
            body: Column(
              children: [
                Expanded(child: mainItems[index].screen),
                MainNavBar(items: mainItems, currentIndex: index),
              ],
            ),
          );
        },
      ),
    );
  }
}
