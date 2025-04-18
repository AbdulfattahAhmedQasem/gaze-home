import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/data/models/address_model.dart';
import 'package:gazhome/data/usecases/address_use_cases.dart';
import 'package:gazhome/presentation/cubit/base/base_cubit.dart';
import 'package:gazhome/presentation/cubit/base/base_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'address_data.dart';
part 'address_state.dart';
part 'address_cubit.freezed.dart';

class AddressCubit extends BaseCubit<AddressState, AddressData> {
  AddressCubit(
    this._getAddressesUseCase,
    this._addAddressUseCase,
    this._deleteAddressUseCase, [
    this._latLng,
  ]) : super(const AddressState(), AddressData._());

  final GetAddressesUseCase _getAddressesUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;
  final LatLng? _latLng;

  Future<void> getAddresses() async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await _getAddressesUseCase();
    result.when(
      right: (addresses) {
        emit(
          state.copyWith(
            requestState: RequestState.loaded,
            addresses: addresses,
          ),
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
  }

  Future<void> addAddress() async {
    if (data.formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(addAddressState: RequestState.loading));

      if (_latLng == null) {
        emit(state.copyWith(
          addAddressState: RequestState.error,
          message: 'Location not selected',
        ));
        return;
      }

      // Get existing addresses to determine if this is the first address
      final addressesResult = await _getAddressesUseCase();
      String status = 'other';

      addressesResult.when(
        right: (addresses) {
          if (addresses.isEmpty) {
            status = 'home';
          }
        },
        left: (_) {
          // If we can't get addresses, default to 'other'
          status = 'other';
        },
      );

      final request = AddressModel.create(
        city: data.cityController.text.trim(),
        state: data.stateController.text.trim(),
        streetName: data.streetController.text.trim(),
        buildingNumber: data.buildingNumberController.text.trim(),
        latitude: _latLng?.latitude ?? 0,
        longitude: _latLng?.longitude ?? 0,
        status: status,
      );

      final result = await _addAddressUseCase(request);
      result.when(
        right: (response) {
          emit(
            state.copyWith(
              addAddressState: RequestState.loaded,
              address: response.$2,
              message: response.$1,
            ),
          );
        },
        left: (failure) {
          emit(
            state.copyWith(
              addAddressState: RequestState.error,
              message: failure.message,
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          autovalidateMode: AutovalidateMode.always,
          addAddressState: RequestState.initial,
        ),
      );
    }
  }

  Future<void> deleteAddress({required int id, required int index}) async {
    emit(
      state.copyWith(
        deleteAddressState: RequestState.loading,
        deleteAddressIds: [...state.deleteAddressIds, id],
      ),
    );
    final result = await _deleteAddressUseCase(id);
    result.when(
      right: (message) {
        emit(
          state.copyWith(
            deleteAddressState: RequestState.loaded,
            message: message,
            addresses: [...state.addresses]..removeAt(index),
            deleteAddressIds: [...state.deleteAddressIds]..remove(id),
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            deleteAddressState: RequestState.error,
            message: failure.message,
            deleteAddressIds: [...state.deleteAddressIds]..remove(id),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    data.dispose();
    return super.close();
  }
}
