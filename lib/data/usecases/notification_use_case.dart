import 'package:gazhome/core/usecases/usecases.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/notification_model.dart';
import 'package:gazhome/data/repos/notification_repo.dart';

class GetNotificationsUseCase
    extends ResultFutureUseCaseWithoutParams<List<NotificationModel>> {
  GetNotificationsUseCase(this._notificationRepo);

  final NotificationRepo _notificationRepo;

  @override
  ResultFuture<List<NotificationModel>> call() {
    return _notificationRepo.getNotifications();
  }
}

class DeleteNotificationUseCase
    extends ResultFutureUseCaseWithParams<String, int> {
  DeleteNotificationUseCase(this._notificationRepo);

  final NotificationRepo _notificationRepo;

  @override
  ResultFuture<String> call(int id) {
    return _notificationRepo.deleteNotification(id);
  }
}
