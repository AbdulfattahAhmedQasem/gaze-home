import 'package:equatable/equatable.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/address_model.dart';

class DriverOrderModel extends Equatable {
  const DriverOrderModel({
    required this.orderId,
    required this.orderStatus,
    required this.orderPaymentStatus,
    required this.orderDriverId,
    required this.orderTotalPrice,
    required this.orderTotalPriceAfterTax,
    required this.orderDeliveryDate,
    required this.orderPaymentMethode,
    required this.productId,
    required this.productName,
    required this.productNamesAr,
    required this.productNamesEn,
    required this.productQuantities,
    required this.productDescription,
    required this.productPrice,
    required this.productPriceAfterTax,
    required this.productImage,
    required this.productQuantityInOrder,
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userEmail,
    required this.userPhoneNumber,
    required this.address,
  });

  factory DriverOrderModel.fromMap(DataMap map) {
    return DriverOrderModel(
      orderId: map['order_id'] as int,
      orderStatus: AppFunctions.getOrderStatus(map['order_status'] as String),
      orderPaymentStatus: map['order_payment_status'] as String? ?? '',
      orderDriverId: map['order_driver_id'] as int? ?? 0,
      orderTotalPrice: map['order_total_price'] as num? ?? 0,
      orderTotalPriceAfterTax: map['order_total_price_after_tax'] as num? ?? 0,
      orderDeliveryDate: map['order_delivery_date'] as String? ?? '',
      orderPaymentMethode: map['order_payment_methode'] as String? ?? '',
      productId: map['product_id'] as int? ?? 0,
      productName: map['product_name'] as String? ?? '',
      productNamesAr: map['product_names_ar'] as String? ?? '',
      productNamesEn: map['product_names_en'] as String? ?? '',
      productQuantities:
          map['product_quantities'] == null
              ? 1
              : (map['product_quantities'] as String)
                  .split(',')
                  .fold(0, (value, qty) => value + int.parse(qty)),
      productDescription: map['product_description'] as String? ?? '',
      productPrice: map['product_price'] as num? ?? 0,
      productPriceAfterTax: map['product_price_after_tax'] as num? ?? 0,
      productImage: AppFunctions.getImageUrl(
        map['product_image'] as String? ?? '',
      ),
      productQuantityInOrder: map['product_quantity_in_order'] as int? ?? 1,
      userId: map['user_id'] as int,
      userFirstName: map['user_first_name'] as String? ?? '',
      userLastName: map['user_last_name'] as String? ?? '',
      userEmail: map['user_email'] as String? ?? '',
      userPhoneNumber: (map['user_phone_number'] as String).substring(4),
      address: AddressModel(
        id: map['address_id'] as int? ?? 0,
        userId: map['user_id'] as int,
        streetName: map['address_street_name'] as String? ?? '',
        buildingNumber: map['address_building_number'] as String? ?? '',
        city: map['address_city'] as String? ?? '',
        state: map['address_state'] as String? ?? '',
        status: 'active',
        latitude: double.parse(map['address_latitude'] as String),
        longitude: double.parse(map['address_longitude'] as String),
      ),
    );
  }

  final int orderId;
  final OrderStatus orderStatus;
  final String orderPaymentStatus;
  final int orderDriverId;
  final num orderTotalPrice;
  final num orderTotalPriceAfterTax;
  final String orderDeliveryDate;
  final String orderPaymentMethode;
  final int productId;
  final String productName;
  final String productNamesAr;
  final String productNamesEn;
  final int productQuantities;
  final String productDescription;
  final num productPrice;
  final num productPriceAfterTax;
  final String productImage;
  final int productQuantityInOrder;
  final int userId;
  final String userFirstName;
  final String userLastName;
  final String userEmail;
  final String userPhoneNumber;
  final AddressModel address;

  @override
  List<Object> get props {
    return [
      orderId,
      orderStatus,
      orderPaymentStatus,
      orderDriverId,
      orderTotalPrice,
      orderTotalPriceAfterTax,
      orderDeliveryDate,
      orderPaymentMethode,
      productId,
      productName,
      productNamesAr,
      productNamesEn,
      productQuantities,
      productDescription,
      productPrice,
      productPriceAfterTax,
      productImage,
      productQuantityInOrder,
      userId,
      userFirstName,
      userLastName,
      userEmail,
      userPhoneNumber,
      address,
    ];
  }
}
