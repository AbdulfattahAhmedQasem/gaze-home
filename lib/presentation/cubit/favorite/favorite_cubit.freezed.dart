// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteState {
  RequestState get requestState => throw _privateConstructorUsedError;
  RequestState get addState => throw _privateConstructorUsedError;
  RequestState get removeState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;
  List<int> get addIds => throw _privateConstructorUsedError;
  List<int> get removeIds => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteStateCopyWith<FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState addState,
      RequestState removeState,
      String message,
      List<ProductModel> products,
      List<int> addIds,
      List<int> removeIds});
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? addState = null,
    Object? removeState = null,
    Object? message = null,
    Object? products = null,
    Object? addIds = null,
    Object? removeIds = null,
  }) {
    return _then(_value.copyWith(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      addState: null == addState
          ? _value.addState
          : addState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      removeState: null == removeState
          ? _value.removeState
          : removeState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      addIds: null == addIds
          ? _value.addIds
          : addIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      removeIds: null == removeIds
          ? _value.removeIds
          : removeIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteStateImplCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$$FavoriteStateImplCopyWith(
          _$FavoriteStateImpl value, $Res Function(_$FavoriteStateImpl) then) =
      __$$FavoriteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState addState,
      RequestState removeState,
      String message,
      List<ProductModel> products,
      List<int> addIds,
      List<int> removeIds});
}

/// @nodoc
class __$$FavoriteStateImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStateImpl>
    implements _$$FavoriteStateImplCopyWith<$Res> {
  __$$FavoriteStateImplCopyWithImpl(
      _$FavoriteStateImpl _value, $Res Function(_$FavoriteStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? addState = null,
    Object? removeState = null,
    Object? message = null,
    Object? products = null,
    Object? addIds = null,
    Object? removeIds = null,
  }) {
    return _then(_$FavoriteStateImpl(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      addState: null == addState
          ? _value.addState
          : addState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      removeState: null == removeState
          ? _value.removeState
          : removeState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      addIds: null == addIds
          ? _value._addIds
          : addIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      removeIds: null == removeIds
          ? _value._removeIds
          : removeIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$FavoriteStateImpl implements _FavoriteState {
  const _$FavoriteStateImpl(
      {this.requestState = RequestState.initial,
      this.addState = RequestState.initial,
      this.removeState = RequestState.initial,
      this.message = '',
      final List<ProductModel> products = const [],
      final List<int> addIds = const [],
      final List<int> removeIds = const []})
      : _products = products,
        _addIds = addIds,
        _removeIds = removeIds;

  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final RequestState addState;
  @override
  @JsonKey()
  final RequestState removeState;
  @override
  @JsonKey()
  final String message;
  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<int> _addIds;
  @override
  @JsonKey()
  List<int> get addIds {
    if (_addIds is EqualUnmodifiableListView) return _addIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addIds);
  }

  final List<int> _removeIds;
  @override
  @JsonKey()
  List<int> get removeIds {
    if (_removeIds is EqualUnmodifiableListView) return _removeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removeIds);
  }

  @override
  String toString() {
    return 'FavoriteState(requestState: $requestState, addState: $addState, removeState: $removeState, message: $message, products: $products, addIds: $addIds, removeIds: $removeIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStateImpl &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.addState, addState) ||
                other.addState == addState) &&
            (identical(other.removeState, removeState) ||
                other.removeState == removeState) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other._addIds, _addIds) &&
            const DeepCollectionEquality()
                .equals(other._removeIds, _removeIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestState,
      addState,
      removeState,
      message,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_addIds),
      const DeepCollectionEquality().hash(_removeIds));

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteStateImplCopyWith<_$FavoriteStateImpl> get copyWith =>
      __$$FavoriteStateImplCopyWithImpl<_$FavoriteStateImpl>(this, _$identity);
}

abstract class _FavoriteState implements FavoriteState {
  const factory _FavoriteState(
      {final RequestState requestState,
      final RequestState addState,
      final RequestState removeState,
      final String message,
      final List<ProductModel> products,
      final List<int> addIds,
      final List<int> removeIds}) = _$FavoriteStateImpl;

  @override
  RequestState get requestState;
  @override
  RequestState get addState;
  @override
  RequestState get removeState;
  @override
  String get message;
  @override
  List<ProductModel> get products;
  @override
  List<int> get addIds;
  @override
  List<int> get removeIds;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteStateImplCopyWith<_$FavoriteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
