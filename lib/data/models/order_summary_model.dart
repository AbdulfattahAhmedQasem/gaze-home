import 'package:gazhome/core/utilities/typedefs.dart';

class OrderSummaryModel {
  OrderSummaryModel({
    required this.message,
    required this.totalCost,
    required this.tax,
    required this.totalCostAfterTax,
    required this.shippingCost,
    required this.finalTotalCostAfterTax,
  });

  factory OrderSummaryModel.fromMap(DataMap map) {
    return OrderSummaryModel(
      message: map['message'] as String,
      totalCost: map['totalCost'] as num,
      tax: map['tax'] as num,
      totalCostAfterTax: map['totalCostAfterTax'] as num,
      shippingCost: num.parse('${map['shippingCost']}'),
      finalTotalCostAfterTax: map['finalTotalCostAfterTax'] as num,
    );
  }

  final String message;
  final num totalCost;
  final num tax;
  final num totalCostAfterTax;
  final num shippingCost;
  final num finalTotalCostAfterTax;
}
