// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvoiceState {
  RequestState get requestState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  File? get invoiceFile => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceStateCopyWith<InvoiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceStateCopyWith<$Res> {
  factory $InvoiceStateCopyWith(
          InvoiceState value, $Res Function(InvoiceState) then) =
      _$InvoiceStateCopyWithImpl<$Res, InvoiceState>;
  @useResult
  $Res call({RequestState requestState, String message, File? invoiceFile});
}

/// @nodoc
class _$InvoiceStateCopyWithImpl<$Res, $Val extends InvoiceState>
    implements $InvoiceStateCopyWith<$Res> {
  _$InvoiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? message = null,
    Object? invoiceFile = freezed,
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
      invoiceFile: freezed == invoiceFile
          ? _value.invoiceFile
          : invoiceFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceStateImplCopyWith<$Res>
    implements $InvoiceStateCopyWith<$Res> {
  factory _$$InvoiceStateImplCopyWith(
          _$InvoiceStateImpl value, $Res Function(_$InvoiceStateImpl) then) =
      __$$InvoiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState requestState, String message, File? invoiceFile});
}

/// @nodoc
class __$$InvoiceStateImplCopyWithImpl<$Res>
    extends _$InvoiceStateCopyWithImpl<$Res, _$InvoiceStateImpl>
    implements _$$InvoiceStateImplCopyWith<$Res> {
  __$$InvoiceStateImplCopyWithImpl(
      _$InvoiceStateImpl _value, $Res Function(_$InvoiceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? message = null,
    Object? invoiceFile = freezed,
  }) {
    return _then(_$InvoiceStateImpl(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceFile: freezed == invoiceFile
          ? _value.invoiceFile
          : invoiceFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$InvoiceStateImpl implements _InvoiceState {
  const _$InvoiceStateImpl(
      {this.requestState = RequestState.initial,
      this.message = '',
      this.invoiceFile});

  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final String message;
  @override
  final File? invoiceFile;

  @override
  String toString() {
    return 'InvoiceState(requestState: $requestState, message: $message, invoiceFile: $invoiceFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceStateImpl &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.invoiceFile, invoiceFile) ||
                other.invoiceFile == invoiceFile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, requestState, message, invoiceFile);

  /// Create a copy of InvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceStateImplCopyWith<_$InvoiceStateImpl> get copyWith =>
      __$$InvoiceStateImplCopyWithImpl<_$InvoiceStateImpl>(this, _$identity);
}

abstract class _InvoiceState implements InvoiceState {
  const factory _InvoiceState(
      {final RequestState requestState,
      final String message,
      final File? invoiceFile}) = _$InvoiceStateImpl;

  @override
  RequestState get requestState;
  @override
  String get message;
  @override
  File? get invoiceFile;

  /// Create a copy of InvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceStateImplCopyWith<_$InvoiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
