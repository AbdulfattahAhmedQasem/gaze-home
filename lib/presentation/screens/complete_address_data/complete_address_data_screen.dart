import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/theming/font_weight_helper.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/address/address_cubit.dart';
import 'package:gazhome/presentation/cubit/map/map_cubit.dart';
import 'package:gazhome/presentation/screens/complete_address_data/widgets/complete_address_data_form.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/back_icon.dart';

class CompleteAddressDataScreen extends StatelessWidget {
  const CompleteAddressDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listenWhen: (previous, current) =>
          previous.addAddressState != current.addAddressState,
      listener: (context, state) {
        if (state.addAddressState == RequestState.loaded) {
          AppFunctions.showToast(
            state.message,
            type: MessageType.success,
          );
          Navigator.of(context).popUntil(
            (route) => route.settings.name == Routes.main,
          );
        } else if (state.addAddressState == RequestState.error) {
          AppFunctions.showToast(
            state.message,
            type: MessageType.error,
          );
        }
      },
      child: AppScaffold(
        appBar: const AppBarWidget(leading: BackIcon()),
        body: BlocBuilder<AddressCubit, AddressState>(
          buildWhen: (previous, current) =>
              previous.addAddressState != current.addAddressState,
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: AppSizes.screenPadding,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: context.width,
                      minHeight: context.height * 0.8,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Text(
                            AppStrings.completeYourLocationData.tr(),
                            style: AppTextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeightHelper.bold,
                              color: AppColors.c1f618d,
                            ),
                          ),
                          57.vSpace,
                          const CompleteAddressDataForm(),
                          const Spacer(),
                          BlocBuilder<MapCubit, MapState>(
                            builder: (context, mapState) {
                              final bool isLocationSelected =
                                  mapState.currentLocation != null &&
                                      mapState.addressDetails.isNotEmpty;
                              return AppDecoratedButton(
                                text: AppStrings.confirm.tr(),
                                onPressed: state.addAddressState ==
                                        RequestState.loading
                                    ? null
                                    : isLocationSelected
                                        ? context
                                            .read<AddressCubit>()
                                            .addAddress
                                        : () {
                                            AppFunctions.showToast(
                                              AppStrings.pleaseSelectLocation
                                                  .tr(),
                                              type: MessageType.error,
                                            );
                                          },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.addAddressState == RequestState.loading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: AppLoading.submit(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
