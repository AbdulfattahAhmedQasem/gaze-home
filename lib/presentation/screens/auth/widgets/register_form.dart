import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/utilities/validator_mixin.dart';
import 'package:gazhome/presentation/cubit/register/register_cubit.dart';
import 'package:gazhome/presentation/widgets/app_radio_tile.dart';
import 'package:gazhome/presentation/widgets/app_text_field.dart';
import 'package:gazhome/presentation/widgets/password_field.dart';
import 'package:gazhome/presentation/widgets/phone_field.dart';
import 'package:gazhome/presentation/widgets/t_f_prefix_icon.dart';

class RegisterForm extends StatelessWidget with ValidatorMixin {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.autovalidateMode != current.autovalidateMode ||
          previous.type != current.type,
      builder: (context, state) {
        return Form(
          key: cubit.data.formKey,
          autovalidateMode: state.autovalidateMode,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppRadioTile<UserType>(
                      title: UserType.individual.name.tr(),
                      value: UserType.individual,
                      groupValue: state.type,
                      onChanged: cubit.changeUserType,
                    ),
                  ),
                  AppSizes.inset.hSpace,
                  Expanded(
                    child: AppRadioTile<UserType>(
                      title: UserType.business.name.tr(),
                      value: UserType.business,
                      groupValue: state.type,
                      onChanged: cubit.changeUserType,
                    ),
                  ),
                ],
              ),
              AppSizes.inset.vSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: cubit.data.firstNameController,
                      nextNode: cubit.data.lastNameNode,
                      labelText: AppStrings.firstName.tr(),
                      textInputAction: TextInputAction.next,
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
                      validator: validateEmptyText,
                    ),
                  ),
                ],
              ),
              AppSizes.inset.vSpace,
              PhoneField(
                controller: cubit.data.phoneNumberController,
                focusNode: cubit.data.phoneNumberNode,
                nextNode: state.type.isIndividual()
                    ? cubit.data.passwordNode
                    : cubit.data.taxNumberNode,
                textInputAction: TextInputAction.next,
                validator: validatePhoneNumber,
              ),
              AppSizes.inset.vSpace,
              if (state.type.isBusiness()) ...[
                AppTextField(
                  controller: cubit.data.taxNumberController,
                  focusNode: cubit.data.taxNumberNode,
                  nextNode: cubit.data.commercialRegisterNode,
                  labelText: AppStrings.taxNumber.tr(),
                  textInputAction: TextInputAction.next,
                  validator: validateEmptyText,
                  prefixIcon: const TFPrefixIcon(icon: AppSvgs.list),
                ),
                AppSizes.inset.vSpace,
                AppTextField(
                  controller: cubit.data.commercialRegisterController,
                  focusNode: cubit.data.commercialRegisterNode,
                  nextNode: cubit.data.passwordNode,
                  labelText: AppStrings.commercialRegister.tr(),
                  textInputAction: TextInputAction.next,
                  validator: validateEmptyText,
                  prefixIcon: const TFPrefixIcon(icon: AppSvgs.list),
                ),
                AppSizes.inset.vSpace,
              ],
              PasswordField(
                controller: cubit.data.passwordController,
                focusNode: cubit.data.passwordNode,
                nextNode: cubit.data.confirmPasswordNode,
                textInputAction: TextInputAction.next,
                validator: validatePassword,
              ),
              AppSizes.inset.vSpace,
              PasswordField(
                controller: cubit.data.confirmPasswordController,
                focusNode: cubit.data.confirmPasswordNode,
                labelText: AppStrings.confirmPassword.tr(),
                validator: (confirmPassword) => validateConfirmPassword(
                  confirmPassword,
                  cubit.data.passwordController.text,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
