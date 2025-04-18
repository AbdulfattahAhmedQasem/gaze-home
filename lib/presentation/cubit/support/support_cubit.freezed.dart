// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SupportState {
  RequestState get requestState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AutovalidateMode get autovalidateMode => throw _privateConstructorUsedError;
  bool get goToVerificationCodeScreen => throw _privateConstructorUsedError;

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportStateCopyWith<SupportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportStateCopyWith<$Res> {
  factory $SupportStateCopyWith(
          SupportState value, $Res Function(SupportState) then) =
      _$SupportStateCopyWithImpl<$Res, SupportState>;
  @useResult
  $Res call(
      {RequestState requestState,
      String message,
      AutovalidateMode autovalidateMode,
      bool goToVerificationCodeScreen});
}

/// @nodoc
class _$SupportStateCopyWithImpl<$Res, $Val extends SupportState>
    implements $SupportStateCopyWith<$Res> {
  _$SupportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? message = null,
    Object? autovalidateMode = null,
    Object? goToVerificationCodeScreen = null,
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
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      goToVerificationCodeScreen: null == goToVerificationCodeScreen
          ? _value.goToVerificationCodeScreen
          : goToVerificationCodeScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupportStateImplCopyWith<$Res>
    implements $SupportStateCopyWith<$Res> {
  factory _$$SupportStateImplCopyWith(
          _$SupportStateImpl value, $Res Function(_$SupportStateImpl) then) =
      __$$SupportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState requestState,
      String message,
      AutovalidateMode autovalidateMode,
      bool goToVerificationCodeScreen});
}

/// @nodoc
class __$$SupportStateImplCopyWithImpl<$Res>
    extends _$SupportStateCopyWithImpl<$Res, _$SupportStateImpl>
    implements _$$SupportStateImplCopyWith<$Res> {
  __$$SupportStateImplCopyWithImpl(
      _$SupportStateImpl _value, $Res Function(_$SupportStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestState = null,
    Object? message = null,
    Object? autovalidateMode = null,
    Object? goToVerificationCodeScreen = null,
  }) {
    return _then(_$SupportStateImpl(
      requestState: null == requestState
          ? _value.requestState
          : requestState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      goToVerificationCodeScreen: null == goToVerificationCodeScreen
          ? _value.goToVerificationCodeScreen
          : goToVerificationCodeScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SupportStateImpl implements _SupportState {
  const _$SupportStateImpl(
      {this.requestState = RequestState.initial,
      this.message = '',
      this.autovalidateMode = AutovalidateMode.disabled,
      this.goToVerificationCodeScreen = false});

  @override
  @JsonKey()
  final RequestState requestState;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;
  @override
  @JsonKey()
  final bool goToVerificationCodeScreen;

  @override
  String toString() {
    return 'SupportState(requestState: $requestState, message: $message, autovalidateMode: $autovalidateMode, goToVerificationCodeScreen: $goToVerificationCodeScreen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportStateImpl &&
            (identical(other.requestState, requestState) ||
                other.requestState == requestState) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            (identical(other.goToVerificationCodeScreen,
                    goToVerificationCodeScreen) ||
                other.goToVerificationCodeScreen ==
                    goToVerificationCodeScreen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestState, message,
      autovalidateMode, goToVerificationCodeScreen);

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportStateImplCopyWith<_$SupportStateImpl> get copyWith =>
      __$$SupportStateImplCopyWithImpl<_$SupportStateImpl>(this, _$identity);
}

abstract class _SupportState implements SupportState {
  const factory _SupportState(
      {final RequestState requestState,
      final String message,
      final AutovalidateMode autovalidateMode,
      final bool goToVerificationCodeScreen}) = _$SupportStateImpl;

  @override
  RequestState get requestState;
  @override
  String get message;
  @override
  AutovalidateMode get autovalidateMode;
  @override
  bool get goToVerificationCodeScreen;

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportStateImplCopyWith<_$SupportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
