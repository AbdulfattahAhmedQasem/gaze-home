import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/responsive/responsive_helper.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/presentation/cubit/account/account_cubit.dart';
import 'package:gazhome/presentation/dialogs/action_dialog.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';

class AccountBottomPart extends StatelessWidget {
  const AccountBottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onPressed: context.read<AccountCubit>().logout,
            height: 42.r,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.logout.tr(),
                  style: AppTextStyle(
                    fontSize: 12.sp,
                    color: AppColors.c272727,
                  ),
                ),
                RotatedBox(
                  quarterTurns: context.isRTL() ? 2 : 0,
                  child: SvgPicture.asset(
                    AppSvgs.logout,
                    width: getValueForScreenType(medium: 14, semiLarge: 16).r,
                    height: getValueForScreenType(medium: 14, semiLarge: 16).r,
                    colorFilter: AppColors.colorFliter(AppColors.c272727),
                  ),
                ),
              ],
            ),
          ),
        ),
        13.hSpace,
        if (!sl<SharedData>().userType.isDriver()) ...[
          AppButton(
            onPressed: () {
              context.read<AccountCubit>().updateAccount().then((
                isAnyDataChanged,
              ) {
                if (isAnyDataChanged == false) {
                  AppFunctions.showToast(
                    AppStrings.pleaseEnterYourNewData.tr(),
                  );
                }
              });
            },
            padding: EdgeInsets.zero,
            backgroundColor: AppColors.c1f618d,
            borderColor: AppColors.c1f618d,
            height: 42.r,
            width: 42.r,
            child: BlocBuilder<AccountCubit, AccountState>(
              buildWhen:
                  (previous, current) =>
                      previous.updateDataState != current.updateDataState ||
                      previous.changePhoneState != current.changePhoneState,
              builder: (context, state) {
                return state.updateDataState.isLoading() ||
                        state.changePhoneState.isLoading()
                    ? AppLoading.inline(color: Colors.white)
                    : SvgPicture.asset(
                      AppSvgs.edit,
                      width: 16.r,
                      height: 16.r,
                      colorFilter: AppColors.colorFliter(Colors.white),
                    );
              },
            ),
          ),
          13.hSpace,
        ],
        AppButton(
          onPressed: () {
            sl<SharedData>().isChangePassword = true;
            context
                .pushNamed(
                  Routes.forgotPassword,
                  arguments: ForgotPasswordStep.send,
                )
                .then((_) {
                  sl<SharedData>().isChangePassword = false;
                });
          },
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.c373B55,
          borderColor: AppColors.c373B55,
          height: 42.r,
          width: 42.r,
          child: SvgPicture.asset(
            AppSvgs.lock,
            width: 16.r,
            height: 16.r,
            colorFilter: AppColors.colorFliter(Colors.white),
          ),
        ),
        13.hSpace,
        AppButton(
          onPressed: () {
            AppFunctions.showAppDialog<void>(
              context,
              child: ActionDialog(
                title: AppStrings.areYouSureDeleteYourAccount.tr(),
                type: MessageType.question,
                onPressed: () {
                  context.pop();
                  context.read<AccountCubit>().deleteAccount();
                },
              ),
            );
          },
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.red,
          borderColor: AppColors.red,
          height: 42.r,
          width: 42.r,
          child: BlocBuilder<AccountCubit, AccountState>(
            buildWhen:
                (previous, current) =>
                    previous.deleteAccountState != current.deleteAccountState,
            builder: (context, state) {
              return state.deleteAccountState.isLoading()
                  ? AppLoading.inline(color: Colors.white)
                  : SvgPicture.asset(
                    AppSvgs.trash,
                    width: 16.r,
                    height: 16.r,
                    colorFilter: AppColors.colorFliter(Colors.white),
                  );
            },
          ),
        ),
      ],
    );
  }
}
