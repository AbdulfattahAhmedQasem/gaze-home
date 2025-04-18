import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/validator_mixin.dart';
import 'package:gazhome/presentation/cubit/make_order/make_order_cubit.dart';
import 'package:gazhome/presentation/dialogs/action_dialog.dart';
import 'package:gazhome/presentation/screens/complete_order/widgets/complete_order_summary.dart';
import 'package:gazhome/presentation/widgets/address_button.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_radio_tile.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/back_icon.dart';
import 'package:gazhome/presentation/widgets/blue_text.dart';
import 'package:gazhome/presentation/widgets/date_field.dart';

class CompleteOrderScreen extends StatelessWidget with ValidatorMixin {
  const CompleteOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MakeOrderCubit>();

    return BlocConsumer<MakeOrderCubit, MakeOrderState>(
      listener: _listener,
      builder: (context, state) {
        return AppScaffold(
          appBar: AppBarWidget(
            leading: const BackIcon(),
            customTitle: Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 12.w),
                child: AddressButton(address: state.address),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: AppSizes.screenPadding,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: context.width,
                minHeight: context.height * 0.8,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    BlueText(AppStrings.selectYourOrderDeliveryDate.tr()),
                    21.vSpace,
                    Form(
                      key: cubit.data.formKey,
                      autovalidateMode: state.autovalidateMode,
                      child: DateField(
                        controller: cubit.data.dateController,
                        validator: validateEmptyText,
                      ),
                    ),
                    32.vSpace,
                    BlueText(AppStrings.selectPaymentMethod.tr()),
                    21.vSpace,
                    AppRadioTile<PaymentMethod>(
                      title: PaymentMethod.credit.title.tr(),
                      value: PaymentMethod.credit,
                      groupValue: state.paymentMethod,
                      icon: PaymentMethod.credit.icon,
                      onChanged: cubit.selectPaymentMethod,
                    ),
                    12.vSpace,
                    AppRadioTile<PaymentMethod>(
                      title: PaymentMethod.cash.title.tr(),
                      value: PaymentMethod.cash,
                      groupValue: state.paymentMethod,
                      icon: PaymentMethod.cash.icon,
                      onChanged: cubit.selectPaymentMethod,
                    ),
                    12.vSpace,
                    CompleteOrderSummary(orderSummary: state.orderSummary!),
                    const Spacer(),
                    if (state.completeState.isLoading())
                      AppLoading.inline()
                    else
                      AppDecoratedButton(
                        text: AppStrings.completePay.tr(),
                        onPressed: cubit.completeOrder,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _listener(BuildContext context, MakeOrderState state) {
    if (state.completeState.hasError()) {
      AppFunctions.showToast(state.message);
    } else if (state.completeState.isLoaded()) {
      if (state.paymentMethod!.isCredit()) {
        context.pushNamed(Routes.payment, arguments: state.paymentUrl);
      } else {
        AppFunctions.showAppDialog<void>(
          context,
          barrierDismissible: false,
          child: ActionDialog(
            title: state.message,
            type: MessageType.success,
            actions: Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () async {
                      AppFunctions.showToast(
                        state.message,
                        type: MessageType.success,
                      );
                      context
                        ..pop()
                        ..pop();
                      context.mainCubit.updateIndex(2);
                    },
                    text: AppStrings.myOrders.tr(),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    backgroundColor: context.colorScheme.primary,
                    textColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                ),
                12.w.hSpace,
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      context.pushReplacementNamed(
                        Routes.invoice,
                        arguments: state.orderDetails,
                      );
                    },
                    text: AppStrings.openInvoice.tr(),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    backgroundColor: AppColors.cEDEDED,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }
}
