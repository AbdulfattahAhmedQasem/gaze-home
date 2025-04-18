part of 'make_order_cubit.dart';

@freezed
class MakeOrderState with _$MakeOrderState {
  const factory MakeOrderState({
    @Default(RequestState.initial) RequestState createState,
    @Default(RequestState.initial) RequestState completeState,
    @Default('') String message,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    PaymentMethod? paymentMethod,
    AddressModel? address,
    OrderSummaryModel? orderSummary,
    @Default('') String paymentUrl,
    @Default(false) bool refreshState,
    CompleteOrderModel? orderDetails,
  }) = _MakeOrderState;
}
