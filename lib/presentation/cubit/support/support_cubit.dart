import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';
import 'package:gazhome/presentation/cubit/base/base_cubit.dart';
import 'package:gazhome/presentation/cubit/base/base_data.dart';

part 'support_data.dart';
part 'support_state.dart';
part 'support_cubit.freezed.dart';

class SupportCubit extends BaseCubit<SupportState, SupportData> {
  SupportCubit(this._sendComplaintUseCase)
    : super(const SupportState(), SupportData._());

  final SendComplaintUseCase _sendComplaintUseCase;

  Future<void> sendComplaint() async {
    AppFunctions.unFocusKeyboard();
    if (data.formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(requestState: RequestState.loading));
      final result = await _sendComplaintUseCase(data.messageController.text);
      result.when(
        right: (message) {
          data.messageController.clear();
          emit(
            state.copyWith(requestState: RequestState.loaded, message: message),
          );
        },
        left: (failure) {
          emit(
            state.copyWith(
              requestState: RequestState.error,
              message: failure.message,
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          autovalidateMode: AutovalidateMode.always,
          requestState: RequestState.initial,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    data.dispose();
    return super.close();
  }
}
