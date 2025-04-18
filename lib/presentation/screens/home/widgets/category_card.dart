import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/data/models/category_model.dart';
import 'package:gazhome/presentation/cubit/home/home_cubit.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    required this.currentCategory,
    super.key,
  });

  final CategoryModel category;
  final CategoryModel? currentCategory;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: category.name,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      backgroundColor:
          category == currentCategory ? context.colorScheme.primary : null,
      textColor: category == currentCategory ? Colors.white : null,
      borderColor:
          category == currentCategory ? context.colorScheme.primary : null,
      borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(16.r)),
      onPressed: () {
        context.read<HomeCubit>().getProducts(category);
      },
    );
  }
}
