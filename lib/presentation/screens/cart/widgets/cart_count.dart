import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/presentation/widgets/app_container.dart';

class CartCount extends StatelessWidget {
  const CartCount({required this.numberOfProducts, super.key});

  final int numberOfProducts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppContainer(
          width: 45.r,
          height: 45.r,
          child: Center(
            child: SvgPicture.asset(
              AppSvgs.blueCart,
              width: 16.r,
              height: 16.r,
              colorFilter: AppColors.colorFliter(AppColors.c1f618d),
            ),
          ),
        ),
        8.hSpace,
        Expanded(
          child: AppContainer(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            height: 45.r,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              '$numberOfProducts ${AppStrings.products.tr()}',
              style: AppTextStyle(fontSize: 12.sp, color: AppColors.c272727),
            ),
          ),
        ),
      ],
    );
  }
}
