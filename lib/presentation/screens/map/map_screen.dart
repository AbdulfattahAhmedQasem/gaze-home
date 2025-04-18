import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gazhome/core/constants/app_sizes.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/extensions/context_extension.dart';
import 'package:gazhome/core/routing/routes.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/presentation/cubit/map/map_cubit.dart';
import 'package:gazhome/presentation/widgets/app_bar_widget.dart';
import 'package:gazhome/presentation/widgets/app_button.dart';
import 'package:gazhome/presentation/widgets/app_error_widget.dart';
import 'package:gazhome/presentation/widgets/app_loading.dart';
import 'package:gazhome/presentation/widgets/app_scaffold.dart';
import 'package:gazhome/presentation/widgets/back_icon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Dammam coordinates
  static const LatLng _defaultLocation = LatLng(26.4207, 50.0888);

  // Eastern Region bounds
  static final LatLngBounds _easternRegionBounds = LatLngBounds(
    southwest:
        const LatLng(24.0000, 48.0000), // Southwest corner of Eastern Region
    northeast:
        const LatLng(28.5000, 51.0000), // Northeast corner of Eastern Region
  );

  final _markers = <Marker>{};
  GoogleMapController? _mapController;

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        leading: const BackIcon(),
        title: AppStrings.addNewAddress.tr(),
      ),
      body: BlocConsumer<MapCubit, MapState>(
        listener: (context, state) {
          if (state.setInitialLocationState == RequestState.loaded &&
              state.currentLocation != null) {
            _buildMarker(state.currentLocation!);

            // Check if the location is within bounds
            if (!_isLocationWithinBounds(state.currentLocation!)) {
              AppFunctions.showToast(
                'عذراً، الموقع خارج نطاق الخدمة (المنطقة الشرقية)',
                type: MessageType.error,
              );
              // Reset to default location
              _animateToLocation(_defaultLocation);
            }
          }
        },
        builder: (context, state) {
          if (state.setInitialLocationState == RequestState.initial) {
            return AppLoading.fetch();
          } else if (state.setInitialLocationState == RequestState.error) {
            return AppErrorWidget(
              message: state.message,
              onTap: context.read<MapCubit>().getInitialLocation,
            );
          }

          return Stack(
            children: [
              GoogleMap(
                mapType: state.mapType,
                initialCameraPosition: CameraPosition(
                  target: state.currentLocation ?? _defaultLocation,
                  zoom: 15,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                padding: EdgeInsets.only(
                  left: 6.w,
                  right: 6.w,
                  top: (AppSizes.vScreenPadding * 4).h,
                ),
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                  context.read<MapCubit>().setMapController(controller);
                  if (state.currentLocation != null) {
                    _buildMarker(state.currentLocation!);
                  }

                  // Set map bounds
                  controller.setMapStyle('''
                    [
                      {
                        "featureType": "all",
                        "stylers": [
                          { "visibility": "off" }
                        ]
                      },
                      {
                        "featureType": "all",
                        "elementType": "geometry",
                        "stylers": [
                          { "visibility": "on" }
                        ]
                      }
                    ]
                  ''');
                },
                onCameraMove: (CameraPosition position) {
                  // Check if new position is within bounds
                  if (!_isLocationWithinBounds(position.target)) {
                    _animateToLocation(_defaultLocation);
                  }
                },
                onTap: (latLng) {
                  if (_isLocationWithinBounds(latLng)) {
                    AppFunctions.unFocusKeyboard();
                    _buildMarker(latLng);
                    context.read<MapCubit>().onMapTapped(latLng);
                  } else {
                    AppFunctions.showToast(
                      'عذراً، الموقع خارج نطاق الخدمة (المنطقة الشرقية)',
                      type: MessageType.error,
                    );
                  }
                },
                cameraTargetBounds: CameraTargetBounds(_easternRegionBounds),
                minMaxZoomPreference: const MinMaxZoomPreference(9.0, 20.0),
              ),
              if (state.setInitialLocationState == RequestState.loading)
                AppLoading.fetch(),
              // Region Support Message
              Positioned(
                top: AppSizes.vScreenPadding.h,
                left: AppSizes.hScreenPadding.w,
                right: AppSizes.hScreenPadding.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: context.colorScheme.primary,
                        size: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          'التطبيق يدعم المنطقة الشرقية فقط',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: context.colorScheme.primary,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state.currentLocation != null)
                Positioned(
                  bottom: 2 * AppSizes.vScreenPadding.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (state.addressDetails.isNotEmpty)
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              '${state.addressDetails['street']}, ${state.addressDetails['city']}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: context.colorScheme.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        AppDecoratedButton(
                          onPressed: () {
                            if (state.addressDetails.isEmpty) {
                              AppFunctions.showToast(
                                AppStrings.pleaseSelectLocation.tr(),
                                type: MessageType.error,
                              );
                              return;
                            }

                            // Check if the selected location is in the Eastern Region
                            final city =
                                state.addressDetails['city']?.toLowerCase() ??
                                    '';
                            if (!_isEasternRegionCity(city)) {
                              AppFunctions.showToast(
                                'عذراً، التطبيق يدعم المنطقة الشرقية فقط',
                                type: MessageType.error,
                              );
                              return;
                            }

                            context.pushNamed(
                              Routes.completeAddressData,
                              arguments: (
                                state.currentLocation!,
                                context.read<MapCubit>(),
                                state.addressDetails,
                              ),
                            );
                          },
                          text: AppStrings.ok.tr(),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void _buildMarker(LatLng latLng) {
    setState(() {
      _markers
        ..clear()
        ..add(
          Marker(
            markerId: MarkerId(latLng.latitude.toString()),
            position: latLng,
          ),
        );
    });
  }

  bool _isEasternRegionCity(String city) {
    final easternCities = [
      'الدمام',
      'dammam',
      'الخبر',
      'khobar',
      'الظهران',
      'dhahran',
      'القطيف',
      'qatif',
      'الجبيل',
      'jubail',
      'الأحساء',
      'al-ahsa',
      'حفر الباطن',
      'hafar al-batin',
    ];
    return easternCities.any((c) => city.contains(c));
  }

  bool _isLocationWithinBounds(LatLng location) {
    return _easternRegionBounds.contains(location);
  }

  Future<void> _animateToLocation(LatLng location) async {
    if (_mapController != null) {
      await _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: location,
            zoom: 15,
          ),
        ),
      );
    }
  }
}
