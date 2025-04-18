import 'package:equatable/equatable.dart';
import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

class ProductModel extends Equatable {
  const ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.nameAr,
    required this.nameEn,
    required this.description,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.price,
    required this.priceAfterTax,
    required this.quantity,
    required this.lastQuantity,
    required this.status,
    required this.image,
    required this.isFavorite,
  });

  factory ProductModel.fromMap(
    DataMap map, {
    bool isFromFavoriteScreen = false,
  }) {
    return ProductModel(
      id: map['id'] as int,
      categoryId: map['category_id'] as int? ?? 0,
      name: map['name'] as String? ?? '',
      nameAr: map['name_ar'] as String? ?? '',
      nameEn: map['name_en'] as String? ?? '',
      description: map['description'] as String? ?? '',
      descriptionAr: map['description_ar'] as String? ?? '',
      descriptionEn: map['description_en'] as String? ?? '',
      price: map['price'] as num? ?? 0,
      priceAfterTax: map['price_after_tax'] as num? ?? 0,
      quantity: map['quantity'] as int? ?? 0,
      lastQuantity: map['last_quantity'] as int? ?? 0,
      status: map['status'] as String? ?? '',
      image: AppFunctions.getImageUrl(
        map['image'] as String?,
        baseUrl: isFromFavoriteScreen ? null : EnvService.imageBaseUrl1,
      ),
      isFavorite: isFromFavoriteScreen,
    );
  }

  final int id;
  final int categoryId;
  final String name;
  final String nameAr;
  final String nameEn;
  final String description;
  final String descriptionAr;
  final String descriptionEn;
  final num price;
  final num priceAfterTax;
  final int quantity;
  final int lastQuantity;
  final String status;
  final String image;
  final bool isFavorite;

  ProductModel copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? nameAr,
    String? nameEn,
    String? description,
    String? descriptionAr,
    String? descriptionEn,
    num? price,
    num? priceAfterTax,
    int? quantity,
    int? lastQuantity,
    String? status,
    String? image,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      description: description ?? this.description,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      price: price ?? this.price,
      priceAfterTax: priceAfterTax ?? this.priceAfterTax,
      quantity: quantity ?? this.quantity,
      lastQuantity: lastQuantity ?? this.lastQuantity,
      status: status ?? this.status,
      image: image ?? this.image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      categoryId,
      name,
      nameAr,
      nameEn,
      description,
      descriptionAr,
      descriptionEn,
      price,
      priceAfterTax,
      quantity,
      lastQuantity,
      status,
      image,
      isFavorite,
    ];
  }
}
