part of 'notifications_cubit.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(RequestState.initial) RequestState requestState,
    @Default(RequestState.initial) RequestState deleteState,
    @Default('') String message,
    @Default([]) List<NotificationModel> notifications,
    @Default([]) List<int> deleteIds,
  }) = _NotificationsState;
}
