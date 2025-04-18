import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/validator_mixin.dart';
import 'package:gazhome/presentation/cubit/support/support_cubit.dart';
import 'package:gazhome/presentation/widgets/app_text_field.dart';

class UserSupportBody extends StatelessWidget with ValidatorMixin {
  const UserSupportBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SupportCubit>();
    return Column(
      children: [
        BlocConsumer<SupportCubit, SupportState>(
          listener: _listener,
          buildWhen: (previous, current) =>
              previous.autovalidateMode != current.autovalidateMode,
          builder: (context, state) {
            return Form(
              key: cubit.data.formKey,
              autovalidateMode: state.autovalidateMode,
              child: AppTextField(
                controller: cubit.data.messageController,
                labelText: AppStrings.writeYourComplaintHere.tr(),
                maxLines: 6,
                textInputAction: TextInputAction.newline,
                validator: validateEmptyText,
              ),
            );
          },
        ),
      ],
    );
  }

  void _listener(BuildContext context, SupportState state) {
    AppFunctions.handleCubitListener(
      context,
      requestState: state.requestState,
      message: state.message,
      onLoaded: () {
        AppFunctions.showToast(state.message, type: MessageType.success);
      },
    );
  }
}
