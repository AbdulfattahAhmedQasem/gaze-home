import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/utilities/validator_mixin.dart';
import 'package:gazhome/presentation/cubit/account/account_cubit.dart';
import 'package:gazhome/presentation/widgets/app_text_field.dart';
import 'package:gazhome/presentation/widgets/phone_field.dart';

class UserAccountForm extends StatelessWidget with ValidatorMixin {
  const UserAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      buildWhen: (previous, current) =>
          previous.autovalidateMode != current.autovalidateMode ||
          previous.updateDataState != current.updateDataState ||
          previous.changePhoneState != current.changePhoneState,
      builder: (context, state) {
        return Form(
          key: cubit.data.formKey,
          autovalidateMode: state.autovalidateMode,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: cubit.data.firstNameController,
                      nextNode: cubit.data.lastNameNode,
                      labelText: AppStrings.firstName.tr(),
                      textInputAction: TextInputAction.next,
                      enabled: !state.updateDataState.isLoading(),
                      validator: validateEmptyText,
                    ),
                  ),
                  AppSizes.inset.hSpace,
                  Expanded(
                    child: AppTextField(
                      controller: cubit.data.lastNameController,
                      focusNode: cubit.data.lastNameNode,
                      nextNode: cubit.data.phoneNumberNode,
                      labelText: AppStrings.lastName.tr(),
                      textInputAction: TextInputAction.next,
                      enabled: !state.updateDataState.isLoading(),
                      validator: validateEmptyText,
                    ),
                  ),
                ],
              ),
              AppSizes.inset.vSpace,
              PhoneField(
                controller: cubit.data.phoneNumberController!,
                focusNode: cubit.data.phoneNumberNode,
                textInputAction: TextInputAction.next,
                enabled: !state.changePhoneState.isLoading(),
                validator: validatePhoneNumber,
              ),
            ],
          ),
        );
      },
    );
  }
}
