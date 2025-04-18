import 'package:gazhome/core/networking/api_service.dart';
import 'package:gazhome/core/utilities/typedefs.dart';
import 'package:gazhome/data/datasources/local/app_local_data_source.dart';
import 'package:gazhome/data/datasources/remote/app_remote_data_source.dart';
import 'package:gazhome/data/models/user_model.dart';

class AppRepo {
  AppRepo(this._appLocalDataSource, this._appRemoteDataSource);

  final AppRemoteDataSource _appRemoteDataSource;
  final AppLocalDataSource _appLocalDataSource;

  ResultFuture<String> sendComplaint(String message) async {
    return returnResponse<String>(() async {
      return _appRemoteDataSource.sendComplaint(message);
    });
  }

  Future<void> cacheFirstTime() async {
    await _appLocalDataSource.cacheFirstTime();
  }

  bool isFirstTime() {
    return _appLocalDataSource.isFirstTime();
  }

  Future<void> cacheLanguageCode(String code) async {
    await _appLocalDataSource.cacheLanguageCode(code);
  }

  String getLanguageCode() {
    return _appLocalDataSource.getLanguageCode();
  }

  Future<void> cacheUser(UserModel user) async {
    await _appLocalDataSource.cacheUser(user);
  }

  UserModel getUser() {
    return _appLocalDataSource.getUser();
  }

  Future<void> removeUser() async {
    await _appLocalDataSource.removeUser();
  }

  Future<void> cacheToken(String token) async {
    await _appLocalDataSource.cacheToken(token);
  }

  String getToken() {
    return _appLocalDataSource.getToken();
  }

  Future<void> removeToken() async {
    await _appLocalDataSource.removeToken();
  }

  bool isUserAuthenticated() {
    return _appLocalDataSource.isUserAuthenticated();
  }

  Future<void> incrementNotificationsCount() async {
    await _appLocalDataSource.incrementNotificationsCount();
  }

  Future<void> resetNotificationsCount() async {
    await _appLocalDataSource.resetNotificationsCount();
  }

  Future<int> getNotificationsCount() async {
    return _appLocalDataSource.getNotificationsCount();
  }
}
