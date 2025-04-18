import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/app_launcher.dart';
import 'package:gazhome/data/models/driver_order_model.dart';
import 'package:gazhome/presentation/widgets/app_cached_image.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';
import 'package:gazhome/presentation/widgets/driver_order_card/driver_order_buttons.dart';
import 'package:gazhome/presentation/widgets/driver_order_card/driver_order_contact.dart';

class DriverOrderCard extends StatelessWidget {
  const DriverOrderCard({
    required this.order,
    required this.driverScreenName,
    super.key,
  });

  final DriverOrderModel order;
  final DriverScreenName driverScreenName;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${order.userFirstName} ${order.userLastName}',
            style: AppTextStyle(
              fontSize: 13.sp,
              color: AppColors.c333333,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DriverOrderContact(
                      icon: AppSvgs.phoneBox,
                      value: order.userPhoneNumber,
                      onPressed: () {
                        AppLauncher.launchDialer(
                          context,
                          order.userPhoneNumber,
                        );
                      },
                    ),
                    DriverOrderContact(
                      icon: AppSvgs.locationBox,
                      value: AppFunctions.formatAddress(order.address),
                      onPressed: () {
                        AppLauncher.launchGoogleMap(
                          context,
                          latitude: order.address.latitude,
                          longitude: order.address.longitude,
                        );
                      },
                    ),
                    DriverOrderContact(
                      icon: AppSvgs.minus,
                      value: order.orderDeliveryDate,
                      onPressed: () {
                      },
                    ),
                    8.vSpace,
                    AppContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 8.h,
                      ),
                      child: Text(
                        order.orderPaymentMethode == PaymentMethod.cash.key
                            ? AppStrings.theInvoiceHasNotBeenPaidYet.tr()
                            : AppStrings.theInvoiceHasBeenPaid.tr(),
                        style: AppTextStyle(fontSize: 10.sp),
                      ),
                    ),
                  ],
                ),
              ),
              12.hSpace,
              Expanded(
                child: Image.asset(
                  AppImages.logo,
                  height: 150.h,
                  cacheHeight: 150.h.cacheSize(context),
                ),
              ),
            ],
          ),
          8.vSpace,
          Wrap(
            runSpacing: 8.h,
            children: [
              AppContainer(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                child: RichText(
                  text: TextSpan(
                    text:
                        driverScreenName.isMyOrders()
                            ? context.isRTL()
                                ? order.productNamesAr
                                : order.productNamesEn
                            : order.productName,
                    style: AppTextStyle(fontSize: 10.sp),
                  ),
                ),
              ),
              6.hSpace,
              AppContainer(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${AppStrings.quantity.tr()} : ',
                        style: AppTextStyle(fontSize: 10.sp),
                      ),
                      TextSpan(
                        text:
                            '${driverScreenName.isMyOrders() ? order.productQuantities : order.productQuantityInOrder}',
                        style: AppTextStyle(
                          fontSize: 10.sp,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              6.hSpace,
              AppContainer(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${order.orderTotalPriceAfterTax} ',
                        style: AppTextStyle(fontSize: 10.sp),
                      ),
                      TextSpan(
                        text: AppStrings.sar1.tr(),
                        style: AppTextStyle(
                          fontSize: 10.sp,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (!driverScreenName.isAccount()) ...[
            12.vSpace,
            DriverOrderButtons(
              driverScreenName: driverScreenName,
              orderId: order.orderId,
            ),
          ],
        ],
      ),
    );
  }
}
