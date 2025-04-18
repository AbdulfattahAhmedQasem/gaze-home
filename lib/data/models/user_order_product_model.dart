import 'package:equatable/equatable.dart';
import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

class UserOrderProductModel extends Equatable {
  const UserOrderProductModel({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productPriceAfterTax,
    required this.productImage,
    required this.productQuantityInOrder,
  });

  factory UserOrderProductModel.fromMap(DataMap map) {
    return UserOrderProductModel(
      productId: map['product_id'] as int? ?? 0,
      productName: map['product_name'] as String? ?? '',
      productDescription: map['product_description'] as String? ?? '',
      productPrice: map['product_price'] as num? ?? 0,
      productPriceAfterTax: map['product_price_after_tax'] as num? ?? 0,
      productImage: AppFunctions.getImageUrl(
        map['product_image'] as String,
      ),
      productQuantityInOrder: map['product_quantity_in_order'] as int? ?? 0,
    );
  }

  final int productId;
  final String productName;
  final String productDescription;
  final num productPrice;
  final num productPriceAfterTax;
  final String productImage;
  final int productQuantityInOrder;

  @override
  List<Object> get props {
    return [
      productId,
      productName,
      productDescription,
      productPrice,
      productPriceAfterTax,
      productImage,
      productQuantityInOrder,
    ];
  }
}
