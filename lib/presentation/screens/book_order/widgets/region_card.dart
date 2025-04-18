import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/data/models/region_model.dart';
import 'package:gazhome/presentation/cubit/book_order/book_order_cubit.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class RegionCard extends StatelessWidget {
  const RegionCard({
    required this.region,
    required this.currentRegion,
    super.key,
  });

  final RegionModel region;
  final RegionModel? currentRegion;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: region.name,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      backgroundColor:
          region == currentRegion ? context.colorScheme.primary : null,
      textColor: region == currentRegion ? Colors.white : null,
      borderColor: region == currentRegion ? context.colorScheme.primary : null,
      borderRadius: AppSizes.borderRadius,
      onPressed: () {
        context.read<BookOrderCubit>().getOrders(region);
      },
    );
  }
}
