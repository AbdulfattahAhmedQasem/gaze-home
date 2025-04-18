import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/shared_data.dart';
import 'package:gazhome/presentation/cubit/book_order/book_order_cubit.dart';
import 'package:gazhome/presentation/cubit/home/home_cubit.dart';
import 'package:gazhome/presentation/widgets/app_bar_icon.dart';

class LanguageIcon extends StatelessWidget {
  const LanguageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarIcon(
      onPressed: () {
        context.updateLanguage().then((_) {
          if (sl<SharedData>().isUserAuthenticated) {
            if (sl<SharedData>().userType.isDriver()) {
              context.read<BookOrderCubit>().getInitialData();
            } else {
              context.read<HomeCubit>().getInitialData();
            }
          }
        });
      },
      child: Text(
        context.isRTL() ? 'En' : 'ع',
        style: AppTextStyle(fontSize: 12.sp, color: AppColors.c272727),
      ),
    );
  }
}
