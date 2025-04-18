import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/notifications/notifications_cubit.dart';
import 'package:gazhome/presentation/cubit/notifications_count/notifications_count_cubit.dart';
import 'package:gazhome/presentation/screens/notifications/widgets/notification_card.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_no_data.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/back_icon.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsCountCubit, int>(
      listener: (context, count) {
        if (count > 0) {
          context.read<NotificationsCubit>().getNotifications();
        }
      },
      child: AppScaffold(
        appBar: AppBarWidget(
          leading: const BackIcon(),
          title: AppStrings.notifications.tr(),
        ),
        body: BlocConsumer<NotificationsCubit, NotificationsState>(
          listener: _listener,
          builder: (context, state) {
            if (state.requestState.isLoading()) {
              return AppLoading.fetch();
            } else if (state.requestState.hasError()) {
              return AppErrorWidget(
                message: state.message,
                onTap: context.read<NotificationsCubit>().getNotifications,
              );
            } else if (state.requestState.isLoaded()) {
              if (state.notifications.isEmpty) {
                return const AppNoData();
              } else {
                return RefreshIndicator(
                  onRefresh:
                      context.read<NotificationsCubit>().getNotifications,
                  child: ListView.separated(
                    padding: AppSizes.screenPadding,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        notification: state.notifications[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (_, __) {
                      return AppSizes.inset.vSpace;
                    },
                    itemCount: state.notifications.length,
                  ),
                );
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _listener(BuildContext context, NotificationsState state) {
    if (state.requestState.isLoaded()) {
      context.read<NotificationsCountCubit>().resetNotificationsCount();
    }
    if (state.deleteState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
    } else if (state.deleteState.hasError()) {
      AppFunctions.showToast(state.message);
    }
  }
}
