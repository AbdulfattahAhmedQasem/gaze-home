import 'package:equatable/equatable.dart';

import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

class CartResponse extends Equatable {
  const CartResponse({
    required this.totalCost,
    required this.totalCostWithShipping,
    required this.shippingCost,
    required this.taxRate,
    required this.taxAmount,
    required this.finalTotalWithTaxAndShipping,
    required this.cartProducts,
  });

  factory CartResponse.fromMap(DataMap map) {
    return CartResponse(
      totalCost: map['totalCost'] as num? ?? 0,
      totalCostWithShipping: map['totalCostWithShipping'] as num? ?? 0,
      shippingCost: map['shippingCost'] as num? ?? 0,
      taxRate: map['taxRate'] as num? ?? 0,
      taxAmount: map['taxAmount'] as num? ?? 0,
      finalTotalWithTaxAndShipping:
          map['finalTotalWithTaxAndShipping'] as num? ?? 0,
      cartProducts: List<CartModel>.from(
        (map['data'] as List).map<CartModel>(
          (cartProduct) => CartModel.fromMap(cartProduct as DataMap),
        ),
      ),
    );
  }

  final num totalCost;
  final num totalCostWithShipping;
  final num shippingCost;
  final num taxRate;
  final num taxAmount;
  final num finalTotalWithTaxAndShipping;
  final List<CartModel> cartProducts;

  @override
  List<Object> get props {
    return [
      cartProducts,
      totalCost,
      totalCostWithShipping,
      shippingCost,
      taxRate,
      taxAmount,
      finalTotalWithTaxAndShipping,
    ];
  }
}

class CartModel extends Equatable {
  const CartModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.priceAfterTax,
    required this.quantity,
    required this.lastQuantity,
    required this.status,
    required this.image,
    required this.quantityInCart,
    required this.totalPrice,
    required this.totalPriceAfterTax,
  });

  factory CartModel.fromMap(DataMap map) {
    return CartModel(
      id: map['id'] as int,
      name: map['name'] as String? ?? '',
      description: map['description'] as String? ?? '',
      price: map['price'] as num? ?? 0,
      priceAfterTax: map['price_after_tax'] as num? ?? 0,
      quantity: map['quantity'] as int? ?? 0,
      lastQuantity: map['last_quantity'] as int? ?? 0,
      status: map['status'] as String? ?? '',
      image: AppFunctions.getImageUrl(
        map['image'] as String?,
      ),
      quantityInCart: map['quantity_in_cart'] as int? ?? 0,
      totalPrice: map['total_price'] as num? ?? 0,
      totalPriceAfterTax: map['total_price_after_tax'] as num? ?? 0,
    );
  }

  final int id;
  final String name;
  final String description;
  final num price;
  final num priceAfterTax;
  final int quantity;
  final int lastQuantity;
  final String status;
  final String image;
  final int quantityInCart;
  final num totalPrice;
  final num totalPriceAfterTax;

  CartModel copyWith({
    int? id,
    String? name,
    String? description,
    num? price,
    num? priceAfterTax,
    int? quantity,
    int? lastQuantity,
    String? status,
    String? image,
    int? quantityInCart,
    num? totalPrice,
    num? totalPriceAfterTax,
  }) {
    return CartModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      priceAfterTax: priceAfterTax ?? this.priceAfterTax,
      quantity: quantity ?? this.quantity,
      lastQuantity: lastQuantity ?? this.lastQuantity,
      status: status ?? this.status,
      image: image ?? this.image,
      quantityInCart: quantityInCart ?? this.quantityInCart,
      totalPrice: totalPrice ?? this.totalPrice,
      totalPriceAfterTax: totalPriceAfterTax ?? this.totalPriceAfterTax,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      price,
      priceAfterTax,
      quantity,
      lastQuantity,
      status,
      image,
      quantityInCart,
      totalPrice,
      totalPriceAfterTax,
    ];
  }
}
