// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddToCartState {
  RequestState get requestState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<int> get productIds => throw _privateConstructorUsedError;

  /// Create a copy of AddToCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddToCartStateCopyWith<AddToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartStateCopyWith<$Res> {
  factory $AddToCartStateCopyWith(
          AddToCartState value, $Res Function(AddToCartState) then) =
      _$AddToCartStateCopyWithImpl<$Res, AddToCartState>;
  @useResult
  $Res call({RequestState requestState, String message, List<int> productIds});
}

/// @nodoc
class _$AddToCartStateCopyWithImpl<$Res, $Val extends AddToCartState>
    implements $AddToCartStateCopyWith<$Res> {
  _$AddToCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddToCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? message = null,
    Object? productIds = null,
  }) {
    return _then(_value.copyWith(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      productIds: null == productIds
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddToCartStateImplCopyWith<$Res>
    implements $AddToCartStateCopyWith<$Res> {
  factory _$$AddToCartStateImplCopyWith(_$AddToCartStateImpl value,
          $Res Function(_$AddToCartStateImpl) then) =
      __$$AddToCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState requestState, String message, List<int> productIds});
}

/// @nodoc
class __$$AddToCartStateImplCopyWithImpl<$Res>
    extends _$AddToCartStateCopyWithImpl<$Res, _$AddToCartStateImpl>
    implements _$$AddToCartStateImplCopyWith<$Res> {
  __$$AddToCartStateImplCopyWithImpl(
      _$AddToCartStateImpl _value, $Res Function(_$AddToCartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddToCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? message = null,
    Object? productIds = null,
  }) {
    return _then(_$AddToCartStateImpl(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      productIds: null == productIds
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$AddToCartStateImpl implements _AddToCartState {
  const _$AddToCartStateImpl(
      {this.requestState = RequestState.initial,
      this.message = '',
      final List<int> productIds = const []})
      : _productIds = productIds;

  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final String message;
  final List<int> _productIds;
  @override
  @JsonKey()
  List<int> get productIds {
    if (_productIds is EqualUnmodifiableListView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productIds);
  }

  @override
  String toString() {
    return 'AddToCartState(requestState: $requestState, message: $message, productIds: $productIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartStateImpl &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestState, message,
      const DeepCollectionEquality().hash(_productIds));

  /// Create a copy of AddToCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartStateImplCopyWith<_$AddToCartStateImpl> get copyWith =>
      __$$AddToCartStateImplCopyWithImpl<_$AddToCartStateImpl>(
          this, _$identity);
}

abstract class _AddToCartState implements AddToCartState {
  const factory _AddToCartState(
      {final RequestState requestState,
      final String message,
      final List<int> productIds}) = _$AddToCartStateImpl;

  @override
  RequestState get requestState;
  @override
  String get message;
  @override
  List<int> get productIds;

  /// Create a copy of AddToCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddToCartStateImplCopyWith<_$AddToCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
