import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/data/models/address_model.dart';
import 'package:gazhome/presentation/cubit/address/address_cubit.dart';
import 'package:gazhome/presentation/cubit/make_order/make_order_cubit.dart';
import 'package:gazhome/presentation/dialogs/addresses_dialog.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class AddressButton extends StatelessWidget {
  const AddressButton({required this.address, super.key});

  final AddressModel? address;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {
        AppFunctions.showAppDialog<AddressModel?>(
          context,
          child: BlocProvider<AddressCubit>(
            create: (context) => sl<AddressCubit>()..getAddresses(),
            child: const AddressesDialog(),
          ),
        ).then((address) {
          if (address != null) {
            context.read<MakeOrderCubit>().selectAddress(address);
          }
        });
      },
      height: 45.r,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        children: [
          SvgPicture.asset(AppSvgs.marker, width: 16.r, height: 16.r),
          12.hSpace,
          Expanded(
            child: Text(
              AppFunctions.formatAddress(address),
              style: AppTextStyle(
                fontSize: 12.sp,
                color: address == null ? AppColors.cC1C1C1 : AppColors.c272727,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          12.hSpace,
          RotatedBox(
            quarterTurns: 1,
            child: SvgPicture.asset(AppSvgs.arrow, width: 14.r, height: 14.r),
          ),
        ],
      ),
    );
  }
}
