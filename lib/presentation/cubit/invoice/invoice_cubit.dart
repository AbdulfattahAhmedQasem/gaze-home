import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/data/models/user_model.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';

part 'invoice_state.dart';
part 'invoice_cubit.freezed.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit(this._getUserUseCase) : super(const InvoiceState());

  final GetUserUseCase _getUserUseCase;

  Future<void> generatePdfFile(
    Future<File> Function(UserModel user) builder,
  ) async {
    emit(state.copyWith(requestState: RequestState.loading));
    try {
      final invoiceFile = await builder(_getUserUseCase());
      emit(
        state.copyWith(
          requestState: RequestState.loaded,
          invoiceFile: invoiceFile,
        ),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(
          requestState: RequestState.loaded,
          message: error.toString(),
        ),
      );
    }
  }
}
