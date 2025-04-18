import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/data/models/notification_model.dart';
import 'package:gazhome/data/usecases/notification_use_case.dart';

part 'notifications_state.dart';
part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(
    this._getNotificationsUseCase,
    this._deleteNotificationUseCase,
  ) : super(const NotificationsState());

  final GetNotificationsUseCase _getNotificationsUseCase;
  final DeleteNotificationUseCase _deleteNotificationUseCase;

  Future<void> getNotifications() async {
    emit(
      state.copyWith(
        requestState: RequestState.loading,
        deleteState: RequestState.initial,
      ),
    );
    final result = await _getNotificationsUseCase();
    result.when(
      right: (notifications) {
        emit(
          state.copyWith(
            requestState: RequestState.loaded,
            notifications: notifications,
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            message: failure.message,
          ),
        );
      },
    );
  }

  Future<void> deleteNotification({required int id, required int index}) async {
    emit(
      state.copyWith(
        deleteState: RequestState.loading,
        deleteIds: [...state.deleteIds, id],
      ),
    );
    final result = await _deleteNotificationUseCase(id);
    result.when(
      right: (message) {
        final notifications = [...state.notifications];
        emit(
          state.copyWith(
            deleteState: RequestState.loaded,
            message: message,
            notifications: (notifications..removeAt(index)),
            deleteIds: [...state.deleteIds]..remove(id),
          ),
        );
      },
      left: (failure) {
        emit(
          state.copyWith(
            deleteState: RequestState.error,
            message: failure.message,
            deleteIds: [...state.deleteIds]..remove(id),
          ),
        );
      },
    );
  }
}
