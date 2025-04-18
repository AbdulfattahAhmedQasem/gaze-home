// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/utilities/app_converter.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/user_order_product_model.dart';

class UserOrderModel extends Equatable {
  const UserOrderModel({
    required this.orderId,
    required this.orderStatus,
    required this.orderTotalPrice,
    required this.orderTotalPriceAfterTax,
    required this.orderShippingCost,
    required this.finalOrderTotal,
    required this.orderDeliveryDate,
    required this.products,
  });

  factory UserOrderModel.fromMap(DataMap map) {
    return UserOrderModel(
      orderId: map['order_id'] as int? ?? 0,
      orderStatus: AppFunctions.getOrderStatus(map['order_status'] as String),
      orderTotalPrice: map['order_total_price'] as num? ?? 0,
      orderTotalPriceAfterTax: map['order_total_price_after_tax'] as num? ?? 0,
      orderShippingCost: map['order_shipping_cost'] as num? ?? 0,
      finalOrderTotal: map['final_order_total'] as num? ?? 0,
      orderDeliveryDate: AppConverter.parseApiDate(
        map['order_delivery_date'] as String? ?? '',
      ),
      products: [UserOrderProductModel.fromMap(map)],
    );
  }

  final int orderId;
  final OrderStatus orderStatus;
  final num orderTotalPrice;
  final num orderTotalPriceAfterTax;
  final num orderShippingCost;
  final num finalOrderTotal;
  final String orderDeliveryDate;
  final List<UserOrderProductModel> products;

  UserOrderModel copyWith({
    int? orderId,
    OrderStatus? orderStatus,
    num? orderTotalPrice,
    num? orderTotalPriceAfterTax,
    num? orderShippingCost,
    num? finalOrderTotal,
    String? orderDeliveryDate,
    List<UserOrderProductModel>? products,
  }) {
    return UserOrderModel(
      orderId: orderId ?? this.orderId,
      orderStatus: orderStatus ?? this.orderStatus,
      orderTotalPrice: orderTotalPrice ?? this.orderTotalPrice,
      orderTotalPriceAfterTax:
          orderTotalPriceAfterTax ?? this.orderTotalPriceAfterTax,
      orderShippingCost: orderShippingCost ?? this.orderShippingCost,
      finalOrderTotal: finalOrderTotal ?? this.finalOrderTotal,
      orderDeliveryDate: orderDeliveryDate ?? this.orderDeliveryDate,
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props {
    return [
      orderId,
      orderStatus,
      orderTotalPrice,
      orderTotalPriceAfterTax,
      orderShippingCost,
      finalOrderTotal,
      orderDeliveryDate,
      products,
    ];
  }
}
