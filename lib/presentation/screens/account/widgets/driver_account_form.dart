import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/account/account_cubit.dart';
import 'package:gazhome/presentation/widgets/app_cached_image.dart';

class DriverAccountForm extends StatelessWidget {
  const DriverAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _Card(state.user.name),
                      5.vSpace,
                      _Card(state.user.phoneNumber),
                      5.vSpace,
                      _Card(state.user.address),
                    ],
                  ),
                ),
                12.hSpace,
                Expanded(
                  child: AppCachedImage(
                    imageUrl: AppFunctions.getImageUrl(state.user.image),
                    height: 150.h,
                    memCacheHeight: 150.h.cacheSize(context),
                  ),
                ),
              ],
            ),
            5.vSpace,
            _Card(
              '${AppStrings.carLicenseNumber.tr()} : ',
              state.user.licenseNumber,
            ),
            5.vSpace,
            _Card(
              '${AppStrings.drivingLicenseNumber.tr()} : ',
              state.user.vehicleLicense,
            ),
            5.vSpace,
            _Card(
              '${AppStrings.carPlateNumber.tr()} : ',
              state.user.vehicleNumber,
            ),
          ],
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card(this.text1, [this.text2]);

  final String text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: AppTextStyle(fontSize: 12.sp, color: AppColors.c333333),
          ),
          if (text2 != null)
            Text(
              text2!,
              style: AppTextStyle(fontSize: 12.sp, color: AppColors.c333333),
            ),
        ],
      ),
    );
  }
}
