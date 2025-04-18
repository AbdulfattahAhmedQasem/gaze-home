import 'package:equatable/equatable.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/product_model.dart';

class OrderItemModel extends Equatable {
  const OrderItemModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.totalPriceAfterTax,
    required this.taxRate,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory OrderItemModel.fromMap(DataMap map) {
    return OrderItemModel(
      id: map['id'] as int,
      orderId: map['order_id'] as int,
      productId: map['product_id'] as int,
      quantity: map['quantity'] as int,
      price: num.parse('${map['price']}'),
      totalPrice: num.parse('${map['total_price']}'),
      totalPriceAfterTax: num.parse('${map['total_price_after_tax']}'),
      taxRate: map['tax_rate'] as num,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      product: ProductModel.fromMap(map['product'] as DataMap),
    );
  }

  final int id;
  final int orderId;
  final int productId;
  final int quantity;
  final num price;
  final num totalPrice;
  final num totalPriceAfterTax;
  final num taxRate;
  final String createdAt;
  final String updatedAt;
  final ProductModel product;

  @override
  List<Object> get props {
    return [
      id,
      orderId,
      productId,
      quantity,
      price,
      totalPrice,
      totalPriceAfterTax,
      taxRate,
      createdAt,
      updatedAt,
      product,
    ];
  }
}
