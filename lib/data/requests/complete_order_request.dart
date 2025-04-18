import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

class CompleteOrderRequest {
  const CompleteOrderRequest({
    required this.deliveryDate,
    required this.paymentMethod,
    required this.addressId,
  });

  final String deliveryDate;
  final PaymentMethod paymentMethod;
  final int addressId;

  DataMap toMap() {
    return {
      'delivery_date': deliveryDate,
      'payment_method': paymentMethod.key,
      'address_id': addressId,
    };
  }
}
