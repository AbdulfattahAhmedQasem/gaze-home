// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountState {
  UserModel get user => throw _privateConstructorUsedError;
  RequestState get updateDataState => throw _privateConstructorUsedError;
  RequestState get changePhoneState => throw _privateConstructorUsedError;
  RequestState get logoutState => throw _privateConstructorUsedError;
  RequestState get deleteAccountState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AutovalidateMode get autovalidateMode => throw _privateConstructorUsedError;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
  @useResult
  $Res call(
      {UserModel user,
      RequestState updateDataState,
      RequestState changePhoneState,
      RequestState logoutState,
      RequestState deleteAccountState,
      String message,
      AutovalidateMode autovalidateMode});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? updateDataState = null,
    Object? changePhoneState = null,
    Object? logoutState = null,
    Object? deleteAccountState = null,
    Object? message = null,
    Object? autovalidateMode = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      updateDataState: null == updateDataState
          ? _value.updateDataState
          : updateDataState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      changePhoneState: null == changePhoneState
          ? _value.changePhoneState
          : changePhoneState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      logoutState: null == logoutState
          ? _value.logoutState
          : logoutState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      deleteAccountState: null == deleteAccountState
          ? _value.deleteAccountState
          : deleteAccountState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountStateImplCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$AccountStateImplCopyWith(
          _$AccountStateImpl value, $Res Function(_$AccountStateImpl) then) =
      __$$AccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel user,
      RequestState updateDataState,
      RequestState changePhoneState,
      RequestState logoutState,
      RequestState deleteAccountState,
      String message,
      AutovalidateMode autovalidateMode});
}

/// @nodoc
class __$$AccountStateImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountStateImpl>
    implements _$$AccountStateImplCopyWith<$Res> {
  __$$AccountStateImplCopyWithImpl(
      _$AccountStateImpl _value, $Res Function(_$AccountStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? updateDataState = null,
    Object? changePhoneState = null,
    Object? logoutState = null,
    Object? deleteAccountState = null,
    Object? message = null,
    Object? autovalidateMode = null,
  }) {
    return _then(_$AccountStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      updateDataState: null == updateDataState
          ? _value.updateDataState
          : updateDataState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      changePhoneState: null == changePhoneState
          ? _value.changePhoneState
          : changePhoneState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      logoutState: null == logoutState
          ? _value.logoutState
          : logoutState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      deleteAccountState: null == deleteAccountState
          ? _value.deleteAccountState
          : deleteAccountState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
    ));
  }
}

/// @nodoc

class _$AccountStateImpl implements _AccountState {
  const _$AccountStateImpl(
      {required this.user,
      this.updateDataState = RequestState.initial,
      this.changePhoneState = RequestState.initial,
      this.logoutState = RequestState.initial,
      this.deleteAccountState = RequestState.initial,
      this.message = '',
      this.autovalidateMode = AutovalidateMode.disabled});

  @override
  final UserModel user;
  @override
  @JsonKey()
  final RequestState updateDataState;
  @override
  @JsonKey()
  final RequestState changePhoneState;
  @override
  @JsonKey()
  final RequestState logoutState;
  @override
  @JsonKey()
  final RequestState deleteAccountState;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;

  @override
  String toString() {
    return 'AccountState(user: $user, updateDataState: $updateDataState, changePhoneState: $changePhoneState, logoutState: $logoutState, deleteAccountState: $deleteAccountState, message: $message, autovalidateMode: $autovalidateMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.updateDataState, updateDataState) ||
                other.updateDataState == updateDataState) &&
            (identical(other.changePhoneState, changePhoneState) ||
                other.changePhoneState == changePhoneState) &&
            (identical(other.logoutState, logoutState) ||
                other.logoutState == logoutState) &&
            (identical(other.deleteAccountState, deleteAccountState) ||
                other.deleteAccountState == deleteAccountState) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      updateDataState,
      changePhoneState,
      logoutState,
      deleteAccountState,
      message,
      autovalidateMode);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      __$$AccountStateImplCopyWithImpl<_$AccountStateImpl>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
      {required final UserModel user,
      final RequestState updateDataState,
      final RequestState changePhoneState,
      final RequestState logoutState,
      final RequestState deleteAccountState,
      final String message,
      final AutovalidateMode autovalidateMode}) = _$AccountStateImpl;

  @override
  UserModel get user;
  @override
  RequestState get updateDataState;
  @override
  RequestState get changePhoneState;
  @override
  RequestState get logoutState;
  @override
  RequestState get deleteAccountState;
  @override
  String get message;
  @override
  AutovalidateMode get autovalidateMode;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
