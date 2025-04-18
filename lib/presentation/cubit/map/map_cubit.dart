import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/constants/app_strings.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:gazhome/data/models/prediction_model.dart';
import 'package:gazhome/data/usecases/address_use_cases.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

part 'map_cubit.freezed.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this._searchForLocationUseCase) : super(const MapState()) {
    // Automatically get initial location when MapCubit is created
    getInitialLocation();
  }

  final SearchForLocationUseCase _searchForLocationUseCase;
  GoogleMapController? _mapController;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> getInitialLocation() async {
    try {
      emit(state.copyWith(setInitialLocationState: RequestState.loading));
      if (await _hasPermission()) {
        final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        final latLng = LatLng(location.latitude, location.longitude);
        emit(state.copyWith(
          setInitialLocationState: RequestState.loaded,
          currentLocation: latLng,
        ));

        // Get address details for the current location
        getAddressFromLatLng(latLng);

        // Animate camera to current location if map controller is available
        if (_mapController != null) {
          await _mapController!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: latLng,
                zoom: 15.0,
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            setInitialLocationState: RequestState.error,
            message: AppStrings.pleaseAcceptLocationPermission.tr(),
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          setInitialLocationState: RequestState.error,
          message: e.toString(),
        ),
      );
    }
  }

  Future<List<PredictionModel>> searchForLocation(String query) {
    return _searchForLocationUseCase(query);
  }

  Future<void> onPlaceSelected(PredictionModel prediction) async {
    try {
      final locations = await locationFromAddress(prediction.description);
      if (locations.isNotEmpty) {
        final latLng =
            LatLng(locations.first.latitude, locations.first.longitude);
        emit(state.copyWith(currentLocation: latLng));

        // Animate camera to selected location
        if (_mapController != null) {
          await _mapController!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: latLng,
                zoom: 15.0,
              ),
            ),
          );
        }

        // Get address details for the selected location
        await getAddressFromLatLng(latLng);
      }
    } on Exception catch (error) {
      showLog(error.toString());
    }
  }

  Future<void> getAddressFromLatLng(LatLng latLng) async {
    try {
      emit(state.copyWith(setInitialLocationState: RequestState.loading));
      final placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        emit(state.copyWith(
          setInitialLocationState: RequestState.loaded,
          currentLocation: latLng,
          addressDetails: {
            'city': place.locality ?? '',
            'state': place.administrativeArea ?? '',
            'street': place.street ?? '',
            'buildingNumber': place.subThoroughfare ?? '',
          },
        ));
      }
    } on Exception catch (e) {
      emit(state.copyWith(
        setInitialLocationState: RequestState.error,
        message: e.toString(),
      ));
    }
  }

  void onMapTapped(LatLng latLng) {
    getAddressFromLatLng(latLng);
  }

  Future<bool> _hasPermission() async {
    try {
      var isEnabled = true;
      if (!await Geolocator.isLocationServiceEnabled()) {
        final status = await Permission.location.request();
        if (status != PermissionStatus.granted) {
          isEnabled = false;
        }
      } else {
        if (!await Permission.location.isGranted) {
          final status = await Permission.location.request();
          if (status != PermissionStatus.granted) {
            isEnabled = false;
          }
        }
      }
      return isEnabled;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<void> close() {
    _mapController?.dispose();
    return super.close();
  }
}
