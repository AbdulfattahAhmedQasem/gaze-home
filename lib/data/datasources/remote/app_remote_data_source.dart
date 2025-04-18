import 'package:gazhome/core/networking/api_constants.dart';
import 'package:gazhome/core/networking/api_service.dart';

class AppRemoteDataSource {
  AppRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<String> sendComplaint(String message) async {
    return returnRemoteResponse<String>(() async {
      final response = await _apiService.post(
        ApiConstants.sendComplaint,
        body: {'description': message},
      );
      return response['message'] as String;
    });
  }
}
