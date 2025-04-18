import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';

class OrderStatusBar extends StatelessWidget {
  const OrderStatusBar({
    required this.status,
    required this.currentStatus,
    super.key,
  });

  final OrderStatus status;
  final OrderStatus currentStatus;

  @override
  Widget build(BuildContext context) {
    var crossAxisAlignment = CrossAxisAlignment.center;
    if (status == OrderStatus.pending) {
      crossAxisAlignment = CrossAxisAlignment.start;
    } else if (status == OrderStatus.delivered) {
      crossAxisAlignment = CrossAxisAlignment.end;
    }
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: status == OrderStatus.pending ? 8.r : 0,
              bottom: status == OrderStatus.delivered ? 8.r : 0,
            ),
            child: Text(status.name.tr(), style: AppTextStyle(fontSize: 11.sp)),
          ),
        ),
        Column(
          children: [
            if (status != OrderStatus.pending)
              Container(
                width: 2.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color:
                      currentStatus.value >= status.value
                          ? status.color
                          : AppColors.cC1C1C1,
                ),
              ),
            CircleAvatar(
              radius: 16.r,
              backgroundColor:
                  currentStatus.value >= status.value
                      ? status.color
                      : AppColors.cC1C1C1,
            ),
            if (status != OrderStatus.delivered)
              Container(
                width: 2.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color:
                      currentStatus.value >= status.value
                          ? status.color
                          : AppColors.cC1C1C1,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
