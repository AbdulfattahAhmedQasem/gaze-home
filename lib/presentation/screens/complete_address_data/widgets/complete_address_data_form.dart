import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/validator_mixin.dart';
import 'package:gazhome/presentation/cubit/address/address_cubit.dart';
import 'package:gazhome/presentation/cubit/map/map_cubit.dart';
import 'package:gazhome/presentation/widgets/app_text_field.dart';

class CompleteAddressDataForm extends StatefulWidget {
  const CompleteAddressDataForm({super.key});

  @override
  State<CompleteAddressDataForm> createState() =>
      _CompleteAddressDataFormState();
}

class _CompleteAddressDataFormState extends State<CompleteAddressDataForm>
    with ValidatorMixin {
  @override
  void initState() {
    super.initState();
    final mapState = context.read<MapCubit>().state;
    if (mapState.addressDetails.isNotEmpty) {
      final addressCubit = context.read<AddressCubit>();
      addressCubit.data.cityController.text =
          mapState.addressDetails['city'] ?? '';
      addressCubit.data.stateController.text =
          mapState.addressDetails['state'] ?? '';
      addressCubit.data.streetController.text =
          mapState.addressDetails['street'] ?? '';
      addressCubit.data.buildingNumberController.text =
          mapState.addressDetails['buildingNumber'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      buildWhen: (previous, current) =>
          previous.autovalidateMode != current.autovalidateMode,
      builder: (context, state) {
        final addressCubit = context.read<AddressCubit>();

        return Form(
          key: addressCubit.data.formKey,
          autovalidateMode: state.autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                controller: addressCubit.data.cityController,
                labelText: AppStrings.city.tr(),
                textInputAction: TextInputAction.next,
                validator: validateEmptyText,
                onSubmitted: (_) => addressCubit.data.stateNode.requestFocus(),
              ),
              24.vSpace,
              AppTextField(
                controller: addressCubit.data.stateController,
                focusNode: addressCubit.data.stateNode,
                labelText: AppStrings.neighborhoodOrArea.tr(),
                textInputAction: TextInputAction.next,
                validator: validateEmptyText,
                onSubmitted: (_) => addressCubit.data.streetNode.requestFocus(),
              ),
              24.vSpace,
              AppTextField(
                controller: addressCubit.data.streetController,
                focusNode: addressCubit.data.streetNode,
                labelText: AppStrings.street.tr(),
                textInputAction: TextInputAction.next,
                validator: validateEmptyText,
                onSubmitted: (_) =>
                    addressCubit.data.buildingNumberNode.requestFocus(),
              ),
              24.vSpace,
              AppTextField(
                controller: addressCubit.data.buildingNumberController,
                focusNode: addressCubit.data.buildingNumberNode,
                labelText: AppStrings.buildingNumber.tr(),
                keyboardType: TextInputType.number,
                validator: validateEmptyText,
                onSubmitted: (_) => addressCubit.addAddress(),
              ),
            ],
          ),
        );
      },
    );
  }
}
