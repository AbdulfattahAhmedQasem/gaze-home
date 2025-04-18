import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/address/address_cubit.dart';
import 'package:gazhome/presentation/dialogs/base_dialog.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_no_data.dart';

class AddressesDialog extends StatelessWidget {
  const AddressesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: context.height * 0.5,
        width: double.maxFinite,
        child: BlocConsumer<AddressCubit, AddressState>(
          listener: _listener,
          builder: (context, state) {
            if (state.requestState.isLoading()) {
              return AppLoading.fetch();
            } else if (state.requestState.hasError()) {
              return AppErrorWidget(
                message: state.message,
                onTap: context.read<AddressCubit>().getAddresses,
              );
            } else if (state.requestState.isLoaded()) {
              return Column(
                children: [
                  Expanded(
                    child:
                        state.addresses.isEmpty
                            ? const AppNoData()
                            : ListView.separated(
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final address = state.addresses[index];
                                return Row(
                                  children: [
                                    Expanded(
                                      child: AppButton(
                                        onPressed: () {
                                          context.pop(address);
                                        },
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 10.h,
                                        ),
                                        child: Text(
                                          AppFunctions.formatAddress(address),
                                          style: AppTextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.c333333,
                                          ),
                                        ),
                                      ),
                                    ),
                                    12.hSpace,
                                    if (state.deleteAddressIds.contains(
                                          address.id,
                                        ) &&
                                        state.deleteAddressState.isLoading())
                                      AppLoading.inline()
                                    else
                                      AppButton(
                                        onPressed: () {
                                          context
                                              .read<AddressCubit>()
                                              .deleteAddress(
                                                id: address.id,
                                                index: index,
                                              );
                                        },
                                        width:
                                            getValueForScreenType(
                                              medium: 28,
                                              semiLarge: 32,
                                            ).r,
                                        height:
                                            getValueForScreenType(
                                              medium: 28,
                                              semiLarge: 32,
                                            ).r,
                                        shape: BoxShape.circle,
                                        padding: EdgeInsets.zero,
                                        backgroundColor: AppColors.c1f618d,
                                        borderColor: AppColors.c1f618d,
                                        child: SvgPicture.asset(
                                          AppSvgs.trash,
                                          width:
                                              getValueForScreenType(
                                                medium: 14,
                                                semiLarge: 16,
                                              ).r,
                                          height:
                                              getValueForScreenType(
                                                medium: 14,
                                                semiLarge: 16,
                                              ).r,
                                          colorFilter: AppColors.colorFliter(
                                            Colors.white,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                              separatorBuilder: (_, __) {
                                return AppSizes.inset.vSpace;
                              },
                              itemCount: state.addresses.length,
                            ),
                  ),
                  AppSizes.inset.vSpace,
                  AppDecoratedButton(
                    text: AppStrings.addNewAddress.tr(),
                    onPressed: () {
                      context.pushNamed(Routes.map);
                    },
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _listener(BuildContext context, AddressState state) {
    if (state.deleteAddressState.isLoaded()) {
      AppFunctions.showToast(state.message, type: MessageType.success);
    } else if (state.deleteAddressState.hasError()) {
      AppFunctions.showToast(state.message);
    }
  }
}
