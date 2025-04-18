import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/presentation/cubit/main/main_item.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({
    required this.items,
    required this.currentIndex,
    super.key,
  });

  final List<MainItem> items;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sl<SharedData>().userType.isDriver() ? 30.w : 12.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: context.colorScheme.shadow, blurRadius: 10.r),
        ],
      ),
      child: Row(
        children: items
            .map(
              (item) => _MainIcon(item: item, currentIndex: currentIndex),
            )
            .toList(),
      ),
    );
  }
}

class _MainIcon extends StatelessWidget {
  const _MainIcon({required this.item, required this.currentIndex});

  final MainItem item;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (item.index == 1 || item.index == 2 || item.index == 3) {
            AppFunctions.checkAuthenticated(context, () {
              context.mainCubit.updateIndex(item.index);
            });
          } else {
            context.mainCubit.updateIndex(item.index);
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                item.icon,
                width: 24.r,
                height: 24.r,
                colorFilter: AppColors.colorFliter(
                  currentIndex == item.index
                      ? context.colorScheme.primary
                      : Colors.black,
                ),
              ),
              2.vSpace,
              Text(
                item.title.tr(),
                style: AppTextStyle(
                  fontSize: 11.sp,
                  color: currentIndex == item.index
                      ? context.colorScheme.primary
                      : Colors.black,
                ),
              ),
              6.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
