import 'package:gazhome/core/networking/api_constants.dart';
import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/models/notification_model.dart';

class NotificationRemoteDataSource {
  NotificationRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<NotificationModel>> getNotifications(int userId) async {
    return returnRemoteResponse<List<NotificationModel>>(() async {
      final response = await _apiService.get(
        '${ApiConstants.notifications}/$userId',
      );
      return List<NotificationModel>.from(
        (response['data'] as List).map<NotificationModel>(
          (notification) => NotificationModel.fromMap(notification as DataMap),
        ),
      );
    });
  }

  Future<String> deleteNotification(int id) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.delete(
        '${ApiConstants.deleteNotification}/$id',
      );
      return response['message'] as String;
    });
  }
}
