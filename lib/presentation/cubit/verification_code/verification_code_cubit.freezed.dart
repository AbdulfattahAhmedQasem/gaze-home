// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_code_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerificationCodeState {
  RequestState get submitState => throw _privateConstructorUsedError;
  RequestState get resendState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationCodeStateCopyWith<VerificationCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationCodeStateCopyWith<$Res> {
  factory $VerificationCodeStateCopyWith(VerificationCodeState value,
          $Res Function(VerificationCodeState) then) =
      _$VerificationCodeStateCopyWithImpl<$Res, VerificationCodeState>;
  @useResult
  $Res call(
      {RequestState submitState, RequestState resendState, String message});
}

/// @nodoc
class _$VerificationCodeStateCopyWithImpl<$Res,
        $Val extends VerificationCodeState>
    implements $VerificationCodeStateCopyWith<$Res> {
  _$VerificationCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitState = null,
    Object? resendState = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      submitState: null == submitState
          ? _value.submitState
          : submitState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      resendState: null == resendState
          ? _value.resendState
          : resendState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneNumberVerificationStateImplCopyWith<$Res>
    implements $VerificationCodeStateCopyWith<$Res> {
  factory _$$PhoneNumberVerificationStateImplCopyWith(
          _$PhoneNumberVerificationStateImpl value,
          $Res Function(_$PhoneNumberVerificationStateImpl) then) =
      __$$PhoneNumberVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState submitState, RequestState resendState, String message});
}

/// @nodoc
class __$$PhoneNumberVerificationStateImplCopyWithImpl<$Res>
    extends _$VerificationCodeStateCopyWithImpl<$Res,
        _$PhoneNumberVerificationStateImpl>
    implements _$$PhoneNumberVerificationStateImplCopyWith<$Res> {
  __$$PhoneNumberVerificationStateImplCopyWithImpl(
      _$PhoneNumberVerificationStateImpl _value,
      $Res Function(_$PhoneNumberVerificationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitState = null,
    Object? resendState = null,
    Object? message = null,
  }) {
    return _then(_$PhoneNumberVerificationStateImpl(
      submitState: null == submitState
          ? _value.submitState
          : submitState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      resendState: null == resendState
          ? _value.resendState
          : resendState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberVerificationStateImpl
    implements _PhoneNumberVerificationState {
  const _$PhoneNumberVerificationStateImpl(
      {this.submitState = RequestState.initial,
      this.resendState = RequestState.initial,
      this.message = ''});

  @override
  @JsonKey()
  final RequestState submitState;
  @override
  @JsonKey()
  final RequestState resendState;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'VerificationCodeState(submitState: $submitState, resendState: $resendState, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberVerificationStateImpl &&
            (identical(other.submitState, submitState) ||
                other.submitState == submitState) &&
            (identical(other.resendState, resendState) ||
                other.resendState == resendState) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, submitState, resendState, message);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberVerificationStateImplCopyWith<
          _$PhoneNumberVerificationStateImpl>
      get copyWith => __$$PhoneNumberVerificationStateImplCopyWithImpl<
          _$PhoneNumberVerificationStateImpl>(this, _$identity);
}

abstract class _PhoneNumberVerificationState implements VerificationCodeState {
  const factory _PhoneNumberVerificationState(
      {final RequestState submitState,
      final RequestState resendState,
      final String message}) = _$PhoneNumberVerificationStateImpl;

  @override
  RequestState get submitState;
  @override
  RequestState get resendState;
  @override
  String get message;

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneNumberVerificationStateImplCopyWith<
          _$PhoneNumberVerificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
