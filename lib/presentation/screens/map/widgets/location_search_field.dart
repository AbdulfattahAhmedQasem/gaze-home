import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gazhome/core/constants/app_media.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/theming/app_colors.dart';
import 'package:gazhome/core/theming/app_styles.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/data/models/prediction_model.dart';
import 'package:gazhome/presentation/cubit/map/map_cubit.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_text_field.dart';
import 'package:gazhome/presentation/widgets/t_f_suffix_icon.dart';

class LocationSearchDialog extends StatefulWidget {
  const LocationSearchDialog({super.key});

  @override
  State<LocationSearchDialog> createState() => _LocationSearchDialogState();
}

class _LocationSearchDialogState extends State<LocationSearchDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<PredictionModel>(
      suggestionsCallback: (query) =>
          context.read<MapCubit>().searchForLocation(query),
      controller: _controller,
      builder: (context, controller, focusNode) {
        return AppTextField(
          controller: controller,
          focusNode: focusNode,
          hintText: AppStrings.searchForYourLocation.tr(),
          suffixIcon: TFSuffixIcon(icon: AppSvgs.search, size: 18.r),
        );
      },
      loadingBuilder: (context) =>
          SizedBox(height: 60.h, child: AppLoading.inline()),
      hideOnEmpty: true,
      itemSeparatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, prediction) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
          child: Row(
            children: [
              Icon(Icons.location_on, size: 24.sp, color: AppColors.red),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  prediction.description,
                  style: AppTextStyle(
                    fontSize: 12.sp,
                    color: AppColors.c333333,
                  ),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
      onSelected: (prediction) {
        AppFunctions.unFocusKeyboard();
        context.read<MapCubit>().onPlaceSelected(prediction);
      },
    );
  }
}
