import 'package:equatable/equatable.dart';
import 'package:gazhome/core/utilities/app_converter.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

import 'package:gazhome/data/models/order_item_model.dart';

class CompleteOrderModel extends Equatable {
  const CompleteOrderModel({
    required this.id,
    required this.userId,
    required this.addressId,
    required this.totalPrice,
    required this.totalPriceAfterTax,
    required this.deliveryDate,
    required this.shippingCost,
    required this.paymentMethode,
    required this.paymentStatus,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
    this.driverId,
    this.paymentId,
    this.invoiceId,
  });

  factory CompleteOrderModel.fromMap(DataMap map) {
    return CompleteOrderModel(
      id: map['id'] as int? ?? 0,
      userId: map['user_id'] as int? ?? 0,
      addressId: map['address_id'] as int? ?? 0,
      driverId: map['driver_id'] as int?,
      totalPrice: map['total_price'] as num? ?? 0,
      totalPriceAfterTax: map['total_price_after_tax'] as num? ?? 0,
      deliveryDate:
          AppConverter.parseApiDate(map['delivery_date'] as String? ?? ''),
      shippingCost: map['shipping_cost'] as num? ?? 0,
      paymentMethode: map['payment_methode'] as String? ?? '',
      paymentStatus: map['payment_status'] as String? ?? '',
      orderStatus: map['order_status'] as String? ?? '',
      paymentId: map['payment_id'] as int?,
      invoiceId: map['invoice_id'] as int?,
      createdAt: AppConverter.parseApiDate(map['created_at'] as String? ?? ''),
      updatedAt: AppConverter.parseApiDate(map['updated_at'] as String? ?? ''),
      items: List<OrderItemModel>.from(
        (map['items'] as List).map<OrderItemModel>(
          (item) => OrderItemModel.fromMap(item as DataMap),
        ),
      ),
    );
  }

  final int id;
  final int userId;
  final int addressId;
  final int? driverId;
  final num totalPrice;
  final num totalPriceAfterTax;
  final String deliveryDate;
  final num shippingCost;
  final String paymentMethode;
  final String paymentStatus;
  final String orderStatus;
  final int? paymentId;
  final int? invoiceId;
  final String createdAt;
  final String updatedAt;
  final List<OrderItemModel> items;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      addressId,
      driverId,
      totalPrice,
      totalPriceAfterTax,
      deliveryDate,
      shippingCost,
      paymentMethode,
      paymentStatus,
      orderStatus,
      paymentId,
      invoiceId,
      createdAt,
      updatedAt,
      items,
    ];
  }
}
