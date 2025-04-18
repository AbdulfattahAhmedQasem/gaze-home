// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressState {
  RequestState get requestState => throw _privateConstructorUsedError;
  RequestState get addAddressState => throw _privateConstructorUsedError;
  RequestState get deleteAddressState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AutovalidateMode get autovalidateMode => throw _privateConstructorUsedError;
  List<AddressModel> get addresses => throw _privateConstructorUsedError;
  List<int> get deleteAddressIds => throw _privateConstructorUsedError;
  AddressModel? get address => throw _privateConstructorUsedError;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressStateCopyWith<AddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
          AddressState value, $Res Function(AddressState) then) =
      _$AddressStateCopyWithImpl<$Res, AddressState>;
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState addAddressState,
      RequestState deleteAddressState,
      String message,
      AutovalidateMode autovalidateMode,
      List<AddressModel> addresses,
      List<int> deleteAddressIds,
      AddressModel? address});
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? addAddressState = null,
    Object? deleteAddressState = null,
    Object? message = null,
    Object? autovalidateMode = null,
    Object? addresses = null,
    Object? deleteAddressIds = null,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      addAddressState: null == addAddressState
          ? _value.addAddressState
          : addAddressState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      deleteAddressState: null == deleteAddressState
          ? _value.deleteAddressState
          : deleteAddressState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>,
      deleteAddressIds: null == deleteAddressIds
          ? _value.deleteAddressIds
          : deleteAddressIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressStateImplCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory _$$AddressStateImplCopyWith(
          _$AddressStateImpl value, $Res Function(_$AddressStateImpl) then) =
      __$$AddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState requestState,
      RequestState addAddressState,
      RequestState deleteAddressState,
      String message,
      AutovalidateMode autovalidateMode,
      List<AddressModel> addresses,
      List<int> deleteAddressIds,
      AddressModel? address});
}

/// @nodoc
class __$$AddressStateImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStateImpl>
    implements _$$AddressStateImplCopyWith<$Res> {
  __$$AddressStateImplCopyWithImpl(
      _$AddressStateImpl _value, $Res Function(_$AddressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? addAddressState = null,
    Object? deleteAddressState = null,
    Object? message = null,
    Object? autovalidateMode = null,
    Object? addresses = null,
    Object? deleteAddressIds = null,
    Object? address = freezed,
  }) {
    return _then(_$AddressStateImpl(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      addAddressState: null == addAddressState
          ? _value.addAddressState
          : addAddressState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      deleteAddressState: null == deleteAddressState
          ? _value.deleteAddressState
          : deleteAddressState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>,
      deleteAddressIds: null == deleteAddressIds
          ? _value._deleteAddressIds
          : deleteAddressIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
    ));
  }
}

/// @nodoc

class _$AddressStateImpl implements _AddressState {
  const _$AddressStateImpl(
      {this.requestState = RequestState.initial,
      this.addAddressState = RequestState.initial,
      this.deleteAddressState = RequestState.initial,
      this.message = '',
      this.autovalidateMode = AutovalidateMode.disabled,
      final List<AddressModel> addresses = const [],
      final List<int> deleteAddressIds = const [],
      this.address})
      : _addresses = addresses,
        _deleteAddressIds = deleteAddressIds;

  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final RequestState addAddressState;
  @override
  @JsonKey()
  final RequestState deleteAddressState;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;
  final List<AddressModel> _addresses;
  @override
  @JsonKey()
  List<AddressModel> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  final List<int> _deleteAddressIds;
  @override
  @JsonKey()
  List<int> get deleteAddressIds {
    if (_deleteAddressIds is EqualUnmodifiableListView)
      return _deleteAddressIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deleteAddressIds);
  }

  @override
  final AddressModel? address;

  @override
  String toString() {
    return 'AddressState(requestState: $requestState, addAddressState: $addAddressState, deleteAddressState: $deleteAddressState, message: $message, autovalidateMode: $autovalidateMode, addresses: $addresses, deleteAddressIds: $deleteAddressIds, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressStateImpl &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.addAddressState, addAddressState) ||
                other.addAddressState == addAddressState) &&
            (identical(other.deleteAddressState, deleteAddressState) ||
                other.deleteAddressState == deleteAddressState) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality()
                .equals(other._deleteAddressIds, _deleteAddressIds) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestState,
      addAddressState,
      deleteAddressState,
      message,
      autovalidateMode,
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(_deleteAddressIds),
      address);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      __$$AddressStateImplCopyWithImpl<_$AddressStateImpl>(this, _$identity);
}

abstract class _AddressState implements AddressState {
  const factory _AddressState(
      {final RequestState requestState,
      final RequestState addAddressState,
      final RequestState deleteAddressState,
      final String message,
      final AutovalidateMode autovalidateMode,
      final List<AddressModel> addresses,
      final List<int> deleteAddressIds,
      final AddressModel? address}) = _$AddressStateImpl;

  @override
  RequestState get requestState;
  @override
  RequestState get addAddressState;
  @override
  RequestState get deleteAddressState;
  @override
  String get message;
  @override
  AutovalidateMode get autovalidateMode;
  @override
  List<AddressModel> get addresses;
  @override
  List<int> get deleteAddressIds;
  @override
  AddressModel? get address;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
