import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/data/models/notification_model.dart';
import 'package:gazhome/presentation/cubit/notifications/notifications_cubit.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.notification,
    required this.index,
    super.key,
  });

  final NotificationModel notification;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppContainer(
            width: 40.r,
            height: 40.r,
            shape: BoxShape.circle,
            alignment: Alignment.center,
            child: Text(
              '📨',
              style: AppTextStyle(
                fontSize: 8.sp,
                color: context.colorScheme.secondary,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
          12.hSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: AppTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: AppColors.c373B55,
                  ),
                ),
                2.vSpace,
                Text(
                  notification.createdAt,
                  style: AppTextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: AppColors.cC1C1C1,
                  ),
                ),
                10.vSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notification.description,
                        style: AppTextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeightHelper.bold,
                          color: AppColors.c333333,
                        ),
                      ),
                    ),
                    // 12.hSpace,
                    // BlocBuilder<NotificationsCubit, NotificationsState>(
                    //   builder: (context, state) {
                    //     return state.deleteState.isLoading() &&
                    //             state.deleteIds.contains(notification.id)
                    //         ? AppLoading.inline()
                    //         : AppButton(
                    //             onPressed: () {
                    //               context
                    //                   .read<NotificationsCubit>()
                    //                   .deleteNotification(
                    //                     id: notification.id,
                    //                     index: index,
                    //                   );
                    //             },
                    // width:
                    //                         getValueForScreenType(
                    //                           medium: 28,
                    //                           semiLarge: 32,
                    //                         ).r,
                    //                     height:
                    //                         getValueForScreenType(
                    //                           medium: 28,
                    //                           semiLarge: 32,
                    //                         ).r,
                    //             shape: BoxShape.circle,
                    //             padding: EdgeInsets.zero,
                    //             backgroundColor: AppColors.c1f618d,
                    //             borderColor: AppColors.c1f618d,
                    //             child: SvgPicture.asset(
                    //               AppSvgs.trash,
                    // width:
                    //                           getValueForScreenType(
                    //                             medium: 14,
                    //                             semiLarge: 16,
                    //                           ).r,
                    //                       height:
                    //                           getValueForScreenType(
                    //                             medium: 14,
                    //                             semiLarge: 16,
                    //                           ).r,
                    //               colorFilter: AppColors.colorFliter(
                    //                 Colors.white,
                    //               ),
                    //             ),
                    //           );
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
