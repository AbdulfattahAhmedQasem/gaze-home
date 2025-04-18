import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/responsive/context_extension.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/presentation/cubit/support/support_cubit.dart';
import 'package:gazhome/presentation/screens/support/widgets/driver_support_body.dart';
import 'package:gazhome/presentation/screens/support/widgets/user_support_body.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/blue_text.dart';
import 'package:gazhome/presentation/widgets/notification_icon.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: AppStrings.support.tr(),
        actions: const [NotificationIcon()],
      ),
      body: SingleChildScrollView(
        padding: AppSizes.screenPadding,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: context.width,
            minHeight: context.height * 0.7,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                BlueText(AppStrings.welcomeToTechnicalSupport.tr()),
                52.vSpace,
                Image.asset(
                  sl<SharedData>().userType.isDriver()
                      ? AppImages.driverSupport
                      : AppImages.userSupport,
                  height: 200.h,
                  width: 300.w,
                  cacheHeight: 200.h.cacheSize(context),
                  cacheWidth: 300.w.cacheSize(context),
                ),
                52.vSpace,
                if (!sl<SharedData>().userType.isDriver()) ...[
                  const UserSupportBody(),
                  const Spacer(),
                  AppDecoratedButton(
                    text: AppStrings.send.tr(),
                    onPressed: context.read<SupportCubit>().sendComplaint,
                  ),
                ] else
                  const DriverSupportBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
