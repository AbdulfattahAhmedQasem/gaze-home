part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    @Default(RequestState.initial) RequestState setInitialLocationState,
    @Default('') String message,
    @Default(MapType.normal) MapType mapType,
    LatLng? currentLocation,
    @Default({}) Map<String, String> addressDetails,
  }) = _MapState;
}
