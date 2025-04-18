import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/utilities/app_converter.dart';
import 'package:gazhome/data/models/address_model.dart';
import 'package:gazhome/data/models/complete_order_model.dart';
import 'package:gazhome/data/models/order_summary_model.dart';
import 'package:gazhome/data/requests/complete_order_request.dart';
import 'package:gazhome/data/usecases/order_use_cases.dart';
import 'package:gazhome/presentation/cubit/base/base_cubit.dart';
import 'package:gazhome/presentation/cubit/base/base_data.dart';

part 'make_order_data.dart';
part 'make_order_state.dart';
part 'make_order_cubit.freezed.dart';

class MakeOrderCubit extends BaseCubit<MakeOrderState, MakeOrderData> {
  MakeOrderCubit(this._createUserOrderUseCase, this._completeUserOrderUseCase)
      : super(const MakeOrderState(), MakeOrderData._());

  final CreateUserOrderUseCase _createUserOrderUseCase;
  final CompleteUserOrderUseCase _completeUserOrderUseCase;

  Future<void> createOrder() async {
    data.dateController.clear();
    emit(
      MakeOrderState(createState: RequestState.loading, address: state.address),
    );
    final result = await _createUserOrderUseCase();
    result.when(
      right: (orderSummary) {
        emit(
          state.copyWith(
            createState: RequestState.loaded,
            orderSummary: orderSummary,
            message: orderSummary.message,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            createState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<void> completeOrder() async {
    if (state.address == null) {
      emit(
        state.copyWith(
          completeState: RequestState.error,
          createState: RequestState.initial,
          refreshState: !state.refreshState,
          message: AppStrings.pleaseSelectTheAddress.tr(),
        ),
      );
      return;
    }
    if (data.formKey.currentState?.validate() ?? false) {
      if (state.paymentMethod == null) {
        emit(
          state.copyWith(
            completeState: RequestState.error,
            createState: RequestState.initial,
            refreshState: !state.refreshState,
            message: AppStrings.pleaseSelectThePaymentMethod.tr(),
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          completeState: RequestState.loading,
          createState: RequestState.initial,
        ),
      );
      final request = CompleteOrderRequest(
        deliveryDate: AppConverter.formatDateForApiRequest(
          data.dateController.text,
        ),
        paymentMethod: state.paymentMethod!,
        addressId: state.address!.id,
      );
      final result = await _completeUserOrderUseCase(request);
      result.when(
        right: (response) {
          emit(
            state.copyWith(
              completeState: RequestState.loaded,
              message: response.$1,
              paymentUrl:
                  state.paymentMethod!.isCredit() ? response.$2 as String : '',
              orderDetails: state.paymentMethod!.isCredit()
                  ? null
                  : response.$2 as CompleteOrderModel,
            ),
          );
        },
        left: (failure) {
          emit(
            state.copyWith(
              completeState: RequestState.error,
              message: failure.message,
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          autovalidateMode: AutovalidateMode.always,
          completeState: RequestState.initial,
          createState: RequestState.initial,
        ),
      );
    }
  }

  void selectAddress(AddressModel address) {
    emit(
      state.copyWith(
        createState: RequestState.initial,
        completeState: RequestState.initial,
        address: address,
      ),
    );
  }

  void selectPaymentMethod(PaymentMethod paymentMethod) {
    emit(
      state.copyWith(
        createState: RequestState.initial,
        completeState: RequestState.initial,
        paymentMethod: paymentMethod,
      ),
    );
  }

  @override
  Future<void> close() {
    data.dispose();
    return super.close();
  }
}
