// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_order_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookOrderState {
  RequestState get requestState => throw _privateConstructorUsedError;
  RequestState get ordersState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<RegionModel> get regions => throw _privateConstructorUsedError;
  List<DriverOrderModel> get orders => throw _privateConstructorUsedError;
  RegionModel? get currentRegion => throw _privateConstructorUsedError;

  /// Create a copy of BookOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookOrderStateCopyWith<BookOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookOrderStateCopyWith<$Res> {
  factory $BookOrderStateCopyWith(
          BookOrderState value, $Res Function(BookOrderState) then) =
      _$BookOrderStateCopyWithImpl<$Res, BookOrderState>;
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState ordersState,
      String message,
      List<RegionModel> regions,
      List<DriverOrderModel> orders,
      RegionModel? currentRegion});
}

/// @nodoc
class _$BookOrderStateCopyWithImpl<$Res, $Val extends BookOrderState>
    implements $BookOrderStateCopyWith<$Res> {
  _$BookOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? ordersState = null,
    Object? message = null,
    Object? regions = null,
    Object? orders = null,
    Object? currentRegion = freezed,
  }) {
    return _then(_value.copyWith(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      ordersState: null == ordersState
          ? _value.ordersState
          : ordersState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      regions: null == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<RegionModel>,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<DriverOrderModel>,
      currentRegion: freezed == currentRegion
          ? _value.currentRegion
          : currentRegion // ignore: cast_nullable_to_non_nullable
              as RegionModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookOrderStateImplCopyWith<$Res>
    implements $BookOrderStateCopyWith<$Res> {
  factory _$$BookOrderStateImplCopyWith(_$BookOrderStateImpl value,
          $Res Function(_$BookOrderStateImpl) then) =
      __$$BookOrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState ordersState,
      String message,
      List<RegionModel> regions,
      List<DriverOrderModel> orders,
      RegionModel? currentRegion});
}

/// @nodoc
class __$$BookOrderStateImplCopyWithImpl<$Res>
    extends _$BookOrderStateCopyWithImpl<$Res, _$BookOrderStateImpl>
    implements _$$BookOrderStateImplCopyWith<$Res> {
  __$$BookOrderStateImplCopyWithImpl(
      _$BookOrderStateImpl _value, $Res Function(_$BookOrderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? ordersState = null,
    Object? message = null,
    Object? regions = null,
    Object? orders = null,
    Object? currentRegion = freezed,
  }) {
    return _then(_$BookOrderStateImpl(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      ordersState: null == ordersState
          ? _value.ordersState
          : ordersState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      regions: null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<RegionModel>,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<DriverOrderModel>,
      currentRegion: freezed == currentRegion
          ? _value.currentRegion
          : currentRegion // ignore: cast_nullable_to_non_nullable
              as RegionModel?,
    ));
  }
}

/// @nodoc

class _$BookOrderStateImpl implements _BookOrderState {
  const _$BookOrderStateImpl(
      {this.requestState = RequestState.initial,
      this.ordersState = RequestState.initial,
      this.message = '',
      final List<RegionModel> regions = const [],
      final List<DriverOrderModel> orders = const [],
      this.currentRegion})
      : _regions = regions,
        _orders = orders;

  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final RequestState ordersState;
  @override
  @JsonKey()
  final String message;
  final List<RegionModel> _regions;
  @override
  @JsonKey()
  List<RegionModel> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  final List<DriverOrderModel> _orders;
  @override
  @JsonKey()
  List<DriverOrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  final RegionModel? currentRegion;

  @override
  String toString() {
    return 'BookOrderState(requestState: $requestState, ordersState: $ordersState, message: $message, regions: $regions, orders: $orders, currentRegion: $currentRegion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookOrderStateImpl &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.ordersState, ordersState) ||
                other.ordersState == ordersState) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._regions, _regions) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.currentRegion, currentRegion) ||
                other.currentRegion == currentRegion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestState,
      ordersState,
      message,
      const DeepCollectionEquality().hash(_regions),
      const DeepCollectionEquality().hash(_orders),
      currentRegion);

  /// Create a copy of BookOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookOrderStateImplCopyWith<_$BookOrderStateImpl> get copyWith =>
      __$$BookOrderStateImplCopyWithImpl<_$BookOrderStateImpl>(
          this, _$identity);
}

abstract class _BookOrderState implements BookOrderState {
  const factory _BookOrderState(
      {final RequestState requestState,
      final RequestState ordersState,
      final String message,
      final List<RegionModel> regions,
      final List<DriverOrderModel> orders,
      final RegionModel? currentRegion}) = _$BookOrderStateImpl;

  @override
  RequestState get requestState;
  @override
  RequestState get ordersState;
  @override
  String get message;
  @override
  List<RegionModel> get regions;
  @override
  List<DriverOrderModel> get orders;
  @override
  RegionModel? get currentRegion;

  /// Create a copy of BookOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookOrderStateImplCopyWith<_$BookOrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
