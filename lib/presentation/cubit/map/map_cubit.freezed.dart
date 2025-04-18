// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapState {
  LatLng? get currentLocation => throw _privateConstructorUsedError;
  MapType get mapType => throw _privateConstructorUsedError;
  RequestState get setInitialLocationState =>
      throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, String> get addressDetails => throw _privateConstructorUsedError;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call(
      {LatLng? currentLocation,
      MapType mapType,
      RequestState setInitialLocationState,
      String message,
      Map<String, String> addressDetails});
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = freezed,
    Object? mapType = null,
    Object? setInitialLocationState = null,
    Object? message = null,
    Object? addressDetails = null,
  }) {
    return _then(_value.copyWith(
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      mapType: null == mapType
          ? _value.mapType
          : mapType // ignore: cast_nullable_to_non_nullable
              as MapType,
      setInitialLocationState: null == setInitialLocationState
          ? _value.setInitialLocationState
          : setInitialLocationState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      addressDetails: null == addressDetails
          ? _value.addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapStateImplCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$$MapStateImplCopyWith(
          _$MapStateImpl value, $Res Function(_$MapStateImpl) then) =
      __$$MapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LatLng? currentLocation,
      MapType mapType,
      RequestState setInitialLocationState,
      String message,
      Map<String, String> addressDetails});
}

/// @nodoc
class __$$MapStateImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateImpl>
    implements _$$MapStateImplCopyWith<$Res> {
  __$$MapStateImplCopyWithImpl(
      _$MapStateImpl _value, $Res Function(_$MapStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = freezed,
    Object? mapType = null,
    Object? setInitialLocationState = null,
    Object? message = null,
    Object? addressDetails = null,
  }) {
    return _then(_$MapStateImpl(
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      mapType: null == mapType
          ? _value.mapType
          : mapType // ignore: cast_nullable_to_non_nullable
              as MapType,
      setInitialLocationState: null == setInitialLocationState
          ? _value.setInitialLocationState
          : setInitialLocationState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      addressDetails: null == addressDetails
          ? _value._addressDetails
          : addressDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$MapStateImpl implements _MapState {
  const _$MapStateImpl(
      {this.currentLocation,
      this.mapType = MapType.normal,
      this.setInitialLocationState = RequestState.initial,
      this.message = '',
      final Map<String, String> addressDetails = const {}})
      : _addressDetails = addressDetails;

  @override
  final LatLng? currentLocation;
  @override
  @JsonKey()
  final MapType mapType;
  @override
  @JsonKey()
  final RequestState setInitialLocationState;
  @override
  @JsonKey()
  final String message;
  final Map<String, String> _addressDetails;
  @override
  @JsonKey()
  Map<String, String> get addressDetails {
    if (_addressDetails is EqualUnmodifiableMapView) return _addressDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_addressDetails);
  }

  @override
  String toString() {
    return 'MapState(currentLocation: $currentLocation, mapType: $mapType, setInitialLocationState: $setInitialLocationState, message: $message, addressDetails: $addressDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateImpl &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.mapType, mapType) || other.mapType == mapType) &&
            (identical(
                    other.setInitialLocationState, setInitialLocationState) ||
                other.setInitialLocationState == setInitialLocationState) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._addressDetails, _addressDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentLocation,
      mapType,
      setInitialLocationState,
      message,
      const DeepCollectionEquality().hash(_addressDetails));

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      __$$MapStateImplCopyWithImpl<_$MapStateImpl>(this, _$identity);
}

abstract class _MapState implements MapState {
  const factory _MapState(
      {final LatLng? currentLocation,
      final MapType mapType,
      final RequestState setInitialLocationState,
      final String message,
      final Map<String, String> addressDetails}) = _$MapStateImpl;

  @override
  LatLng? get currentLocation;
  @override
  MapType get mapType;
  @override
  RequestState get setInitialLocationState;
  @override
  String get message;
  @override
  Map<String, String> get addressDetails;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
