// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  RequestState get requestState => throw _privateConstructorUsedError;
  RequestState get deleteState => throw _privateConstructorUsedError;
  RequestState get increaseState => throw _privateConstructorUsedError;
  RequestState get decreaseState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<CartModel> get cartProducts => throw _privateConstructorUsedError;
  List<int> get deleteIds => throw _privateConstructorUsedError;
  List<int> get increaseIds => throw _privateConstructorUsedError;
  List<int> get decreaseIds => throw _privateConstructorUsedError;
  int? get currentCartId => throw _privateConstructorUsedError;
  num get totalCost => throw _privateConstructorUsedError;
  num get totalPriceAfterTax => throw _privateConstructorUsedError;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState deleteState,
      RequestState increaseState,
      RequestState decreaseState,
      String message,
      List<CartModel> cartProducts,
      List<int> deleteIds,
      List<int> increaseIds,
      List<int> decreaseIds,
      int? currentCartId,
      num totalCost,
      num totalPriceAfterTax});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? deleteState = null,
    Object? increaseState = null,
    Object? decreaseState = null,
    Object? message = null,
    Object? cartProducts = null,
    Object? deleteIds = null,
    Object? increaseIds = null,
    Object? decreaseIds = null,
    Object? currentCartId = freezed,
    Object? totalCost = null,
    Object? totalPriceAfterTax = null,
  }) {
    return _then(_value.copyWith(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      deleteState: null == deleteState
          ? _value.deleteState
          : deleteState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      increaseState: null == increaseState
          ? _value.increaseState
          : increaseState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      decreaseState: null == decreaseState
          ? _value.decreaseState
          : decreaseState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      cartProducts: null == cartProducts
          ? _value.cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
      deleteIds: null == deleteIds
          ? _value.deleteIds
          : deleteIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      increaseIds: null == increaseIds
          ? _value.increaseIds
          : increaseIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      decreaseIds: null == decreaseIds
          ? _value.decreaseIds
          : decreaseIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentCartId: freezed == currentCartId
          ? _value.currentCartId
          : currentCartId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num,
      totalPriceAfterTax: null == totalPriceAfterTax
          ? _value.totalPriceAfterTax
          : totalPriceAfterTax // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState deleteState,
      RequestState increaseState,
      RequestState decreaseState,
      String message,
      List<CartModel> cartProducts,
      List<int> deleteIds,
      List<int> increaseIds,
      List<int> decreaseIds,
      int? currentCartId,
      num totalCost,
      num totalPriceAfterTax});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? deleteState = null,
    Object? increaseState = null,
    Object? decreaseState = null,
    Object? message = null,
    Object? cartProducts = null,
    Object? deleteIds = null,
    Object? increaseIds = null,
    Object? decreaseIds = null,
    Object? currentCartId = freezed,
    Object? totalCost = null,
    Object? totalPriceAfterTax = null,
  }) {
    return _then(_$CartStateImpl(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      deleteState: null == deleteState
          ? _value.deleteState
          : deleteState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      increaseState: null == increaseState
          ? _value.increaseState
          : increaseState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      decreaseState: null == decreaseState
          ? _value.decreaseState
          : decreaseState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      cartProducts: null == cartProducts
          ? _value._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
      deleteIds: null == deleteIds
          ? _value._deleteIds
          : deleteIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      increaseIds: null == increaseIds
          ? _value._increaseIds
          : increaseIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      decreaseIds: null == decreaseIds
          ? _value._decreaseIds
          : decreaseIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentCartId: freezed == currentCartId
          ? _value.currentCartId
          : currentCartId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num,
      totalPriceAfterTax: null == totalPriceAfterTax
          ? _value.totalPriceAfterTax
          : totalPriceAfterTax // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl(
      {this.requestState = RequestState.initial,
      this.deleteState = RequestState.initial,
      this.increaseState = RequestState.initial,
      this.decreaseState = RequestState.initial,
      this.message = '',
      final List<CartModel> cartProducts = const [],
      final List<int> deleteIds = const [],
      final List<int> increaseIds = const [],
      final List<int> decreaseIds = const [],
      this.currentCartId,
      this.totalCost = 0,
      this.totalPriceAfterTax = 0})
      : _cartProducts = cartProducts,
        _deleteIds = deleteIds,
        _increaseIds = increaseIds,
        _decreaseIds = decreaseIds;

  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final RequestState deleteState;
  @override
  @JsonKey()
  final RequestState increaseState;
  @override
  @JsonKey()
  final RequestState decreaseState;
  @override
  @JsonKey()
  final String message;
  final List<CartModel> _cartProducts;
  @override
  @JsonKey()
  List<CartModel> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  final List<int> _deleteIds;
  @override
  @JsonKey()
  List<int> get deleteIds {
    if (_deleteIds is EqualUnmodifiableListView) return _deleteIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deleteIds);
  }

  final List<int> _increaseIds;
  @override
  @JsonKey()
  List<int> get increaseIds {
    if (_increaseIds is EqualUnmodifiableListView) return _increaseIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_increaseIds);
  }

  final List<int> _decreaseIds;
  @override
  @JsonKey()
  List<int> get decreaseIds {
    if (_decreaseIds is EqualUnmodifiableListView) return _decreaseIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_decreaseIds);
  }

  @override
  final int? currentCartId;
  @override
  @JsonKey()
  final num totalCost;
  @override
  @JsonKey()
  final num totalPriceAfterTax;

  @override
  String toString() {
    return 'CartState(requestState: $requestState, deleteState: $deleteState, increaseState: $increaseState, decreaseState: $decreaseState, message: $message, cartProducts: $cartProducts, deleteIds: $deleteIds, increaseIds: $increaseIds, decreaseIds: $decreaseIds, currentCartId: $currentCartId, totalCost: $totalCost, totalPriceAfterTax: $totalPriceAfterTax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.deleteState, deleteState) ||
                other.deleteState == deleteState) &&
            (identical(other.increaseState, increaseState) ||
                other.increaseState == increaseState) &&
            (identical(other.decreaseState, decreaseState) ||
                other.decreaseState == decreaseState) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts) &&
            const DeepCollectionEquality()
                .equals(other._deleteIds, _deleteIds) &&
            const DeepCollectionEquality()
                .equals(other._increaseIds, _increaseIds) &&
            const DeepCollectionEquality()
                .equals(other._decreaseIds, _decreaseIds) &&
            (identical(other.currentCartId, currentCartId) ||
                other.currentCartId == currentCartId) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalPriceAfterTax, totalPriceAfterTax) ||
                other.totalPriceAfterTax == totalPriceAfterTax));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestState,
      deleteState,
      increaseState,
      decreaseState,
      message,
      const DeepCollectionEquality().hash(_cartProducts),
      const DeepCollectionEquality().hash(_deleteIds),
      const DeepCollectionEquality().hash(_increaseIds),
      const DeepCollectionEquality().hash(_decreaseIds),
      currentCartId,
      totalCost,
      totalPriceAfterTax);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {final RequestState requestState,
      final RequestState deleteState,
      final RequestState increaseState,
      final RequestState decreaseState,
      final String message,
      final List<CartModel> cartProducts,
      final List<int> deleteIds,
      final List<int> increaseIds,
      final List<int> decreaseIds,
      final int? currentCartId,
      final num totalCost,
      final num totalPriceAfterTax}) = _$CartStateImpl;

  @override
  RequestState get requestState;
  @override
  RequestState get deleteState;
  @override
  RequestState get increaseState;
  @override
  RequestState get decreaseState;
  @override
  String get message;
  @override
  List<CartModel> get cartProducts;
  @override
  List<int> get deleteIds;
  @override
  List<int> get increaseIds;
  @override
  List<int> get decreaseIds;
  @override
  int? get currentCartId;
  @override
  num get totalCost;
  @override
  num get totalPriceAfterTax;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
