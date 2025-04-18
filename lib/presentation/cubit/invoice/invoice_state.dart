part of 'invoice_cubit.dart';

@freezed
class InvoiceState with _$InvoiceState {
  const factory InvoiceState({
    @Default(RequestState.initial) RequestState requestState,
    @Default('') String message,
    File? invoiceFile,
  }) = _InvoiceState;
}
