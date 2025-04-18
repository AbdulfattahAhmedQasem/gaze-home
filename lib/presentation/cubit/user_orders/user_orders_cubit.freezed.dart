// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_orders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserOrdersState {
  RequestState get requestState => throw _privateConstructorUsedError;
  RequestState get cancelState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<UserOrderModel> get orders => throw _privateConstructorUsedError;
  List<int> get cancelOrderIds => throw _privateConstructorUsedError;

  /// Create a copy of UserOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserOrdersStateCopyWith<UserOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOrdersStateCopyWith<$Res> {
  factory $UserOrdersStateCopyWith(
          UserOrdersState value, $Res Function(UserOrdersState) then) =
      _$UserOrdersStateCopyWithImpl<$Res, UserOrdersState>;
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState cancelState,
      String message,
      List<UserOrderModel> orders,
      List<int> cancelOrderIds});
}

/// @nodoc
class _$UserOrdersStateCopyWithImpl<$Res, $Val extends UserOrdersState>
    implements $UserOrdersStateCopyWith<$Res> {
  _$UserOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? cancelState = null,
    Object? message = null,
    Object? orders = null,
    Object? cancelOrderIds = null,
  }) {
    return _then(_value.copyWith(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      cancelState: null == cancelState
          ? _value.cancelState
          : cancelState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<UserOrderModel>,
      cancelOrderIds: null == cancelOrderIds
          ? _value.cancelOrderIds
          : cancelOrderIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserOrdersStateImplCopyWith<$Res>
    implements $UserOrdersStateCopyWith<$Res> {
  factory _$$UserOrdersStateImplCopyWith(_$UserOrdersStateImpl value,
          $Res Function(_$UserOrdersStateImpl) then) =
      __$$UserOrdersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState cancelState,
      String message,
      List<UserOrderModel> orders,
      List<int> cancelOrderIds});
}

/// @nodoc
class __$$UserOrdersStateImplCopyWithImpl<$Res>
    extends _$UserOrdersStateCopyWithImpl<$Res, _$UserOrdersStateImpl>
    implements _$$UserOrdersStateImplCopyWith<$Res> {
  __$$UserOrdersStateImplCopyWithImpl(
      _$UserOrdersStateImpl _value, $Res Function(_$UserOrdersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? cancelState = null,
    Object? message = null,
    Object? orders = null,
    Object? cancelOrderIds = null,
  }) {
    return _then(_$UserOrdersStateImpl(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      cancelState: null == cancelState
          ? _value.cancelState
          : cancelState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<UserOrderModel>,
      cancelOrderIds: null == cancelOrderIds
          ? _value._cancelOrderIds
          : cancelOrderIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$UserOrdersStateImpl implements _UserOrdersState {
  const _$UserOrdersStateImpl(
      {this.requestState = RequestState.initial,
      this.cancelState = RequestState.initial,
      this.message = '',
      final List<UserOrderModel> orders = const [],
      final List<int> cancelOrderIds = const []})
      : _orders = orders,
        _cancelOrderIds = cancelOrderIds;

  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final RequestState cancelState;
  @override
  @JsonKey()
  final String message;
  final List<UserOrderModel> _orders;
  @override
  @JsonKey()
  List<UserOrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<int> _cancelOrderIds;
  @override
  @JsonKey()
  List<int> get cancelOrderIds {
    if (_cancelOrderIds is EqualUnmodifiableListView) return _cancelOrderIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cancelOrderIds);
  }

  @override
  String toString() {
    return 'UserOrdersState(requestState: $requestState, cancelState: $cancelState, message: $message, orders: $orders, cancelOrderIds: $cancelOrderIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserOrdersStateImpl &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.cancelState, cancelState) ||
                other.cancelState == cancelState) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality()
                .equals(other._cancelOrderIds, _cancelOrderIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestState,
      cancelState,
      message,
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_cancelOrderIds));

  /// Create a copy of UserOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserOrdersStateImplCopyWith<_$UserOrdersStateImpl> get copyWith =>
      __$$UserOrdersStateImplCopyWithImpl<_$UserOrdersStateImpl>(
          this, _$identity);
}

abstract class _UserOrdersState implements UserOrdersState {
  const factory _UserOrdersState(
      {final RequestState requestState,
      final RequestState cancelState,
      final String message,
      final List<UserOrderModel> orders,
      final List<int> cancelOrderIds}) = _$UserOrdersStateImpl;

  @override
  RequestState get requestState;
  @override
  RequestState get cancelState;
  @override
  String get message;
  @override
  List<UserOrderModel> get orders;
  @override
  List<int> get cancelOrderIds;

  /// Create a copy of UserOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserOrdersStateImplCopyWith<_$UserOrdersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
