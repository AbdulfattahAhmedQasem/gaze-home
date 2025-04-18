import 'dart:math' show pi;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/data/models/user_order_model.dart';
import 'package:gazhome/presentation/cubit/user_orders/user_orders_cubit.dart';
import 'package:gazhome/presentation/screens/account/widgets/order_status_bar.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_cached_image.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';
import 'package:gazhome/presentation/widgets/price_widget.dart';
import 'package:confetti/confetti.dart';

class UserOrderCard extends StatefulWidget {
  const UserOrderCard({required this.order, required this.index, super.key});

  final UserOrderModel order;
  final int index;

  @override
  State<UserOrderCard> createState() => _UserOrderCardState();
}

class _UserOrderCardState extends State<UserOrderCard> {
  final _controller = PageController();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
    if (widget.order.orderStatus == OrderStatus.delivered) {
      _confettiController.play();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppContainer(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant Info Row
              Row(
                children: [
                  AppCachedImage(
                    imageUrl: widget.order.products.first.productImage,
                    height: 40.h,
                    width: 40.w,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.order.products.first.productName,
                          style: AppTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Text(
                        //   '#${widget.order.orderId}',
                        //   style: AppTextStyle(
                        //     fontSize: 14.sp,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  AppButton(
                    onPressed: () {
                      context.pushNamed(Routes.invoice,
                          arguments: widget.order);
                    },
                    child: Icon(Icons.arrow_forward_ios, size: 18.r),
                  ),
                ],
              ),
              if (widget.order.orderTotalPrice > 0) ...[
                SizedBox(height: 12.h),
                PriceWidget(price: widget.order.orderTotalPrice),
              ],
              Divider(height: 24.h),
              // Order Status
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: _getStatusColor(widget.order.orderStatus)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  widget.order.orderStatus.name.tr(),
                  style: AppTextStyle(
                    fontSize: 14.sp,
                    color: _getStatusColor(widget.order.orderStatus),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              // Delivery Date
              Row(
                children: [
                  Icon(Icons.access_time, size: 20.r, color: Colors.grey),
                  SizedBox(width: 8.w),
                  Text(
                    widget.order.orderDeliveryDate,
                    style: AppTextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
              // Products Summary
              if (widget.order.products.length > 1) ...[
                SizedBox(height: 12.h),
                Text(
                  '${AppStrings.quantity.tr()}: ${widget.order.products.fold(0, (prev, product) => prev + product.productQuantityInOrder)}',
                  style: AppTextStyle(fontSize: 14.sp),
                ),
              ],
            ],
          ),
        ),
        if (widget.order.orderStatus == OrderStatus.delivered)
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -pi / 2,
              maxBlastForce: 5,
              minBlastForce: 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
            ),
          ),
      ],
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.shipped:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _listener(BuildContext context, UserOrdersState state) {
    if (state.cancelState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
    } else if (state.cancelState.hasError()) {
      AppFunctions.showToast(state.message);
    }
  }
}
