import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/extensions/num_extenison.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({required this.message, super.key, this.onTap});

  final VoidCallback? onTap;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.hScreenPadding.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppSvgs.error, height: 80.r, width: 80.r),
            (3 * AppSizes.inset).vSpace,
            Text(
              message,
              style: AppTextStyle(fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
            40.vSpace,
            AppDecoratedButton(
              onPressed: onTap,
              text: AppStrings.tryAgain.tr(),
              color: AppColors.red,
            ),
          ],
        ),
      ),
    );
  }
}

// class InlineErrorWidget extends StatelessWidget {
//   const InlineErrorWidget({
//     super.key,
//     this.onTap,
//     this.size,
//     this.message,
//     this.isColumn = true,
//   });

//   final void Function()? onTap;
//   final String? message;
//   final double? size;
//   final bool isColumn;

//   @override
//   Widget build(BuildContext context) {
//     final s = getValueForScreenType( medium: 35, large: 70).r;
//     return isColumn
//         ? Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CustomIconButton(
//               onPressed: onTap,
//               icon: AppSvgs.refresh,
//               width: size ?? s,
//               height: size ?? s,
//               iconColor: context.colorScheme.error,
//             ),
//             if (message != null) ...[
//               8.vSpace,
//               Text(
//                 message!,
//                 style: AppTextStyle.font12SemiBold(context.colorScheme.error),
//                 textAlign: TextAlign.center,
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ],
//         )
//         : Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CustomIconButton(
//               onPressed: onTap,
//               icon: AppSvgs.refresh,
//               width: size ?? s,
//               height: size ?? s,
//               iconColor: context.colorScheme.error,
//             ),
//             if (message != null) ...[
//               8.hSpace,
//               Expanded(
//                 child: Text(
//                   message!,
//                   style: AppTextStyle.font12SemiBold(context.colorScheme.error),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ],
//         );
//   }
// }
