import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/notifications_count/notifications_count_cubit.dart';
import 'package:gazhome/presentation/widgets/app_bar_icon.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBarIcon(
          onPressed: () {
            AppFunctions.checkAuthenticated(context, () {
              context.pushNamed(Routes.notifications);
            });
          },
          icon: AppSvgs.notification,
        ),
        BlocBuilder<NotificationsCountCubit, int>(
          builder: (context, count) {
            return count > 0
                ? PositionedDirectional(
                  top: 2.r,
                  start: 2.r,
                  child: Container(
                    height: 15.r,
                    width: 15.r,
                    padding: EdgeInsets.all(1.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(8.r),
                        bottomEnd: Radius.circular(8.r),
                      ),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          count.toString(),
                          style: AppTextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeightHelper.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
