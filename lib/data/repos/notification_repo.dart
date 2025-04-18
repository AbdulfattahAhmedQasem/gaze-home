import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/datasources/local/app_local_data_source.dart';
import 'package:gazhome/data/datasources/remote/notification_remote_data_source.dart';
import 'package:gazhome/data/models/notification_model.dart';

class NotificationRepo {
  NotificationRepo(
    this._notificationRemoteDataSource,
    this._appLocalDataSource,
  );

  final NotificationRemoteDataSource _notificationRemoteDataSource;
  final AppLocalDataSource _appLocalDataSource;

  ResultFuture<List<NotificationModel>> getNotifications() async {
    return returnResponse<List<NotificationModel>>(() async {
      return _notificationRemoteDataSource.getNotifications(
        _appLocalDataSource.getUser().id,
      );
    });
  }

  ResultFuture<String> deleteNotification(int id) async {
    return returnResponse<String>(() async {
      return _notificationRemoteDataSource.deleteNotification(id);
    });
  }
}
