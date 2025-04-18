import 'package:gazhome/core/constants/app_keys.dart';
import 'package:gazhome/core/services/languagge_service.dart';
import 'package:gazhome/core/services/shared_preferences_log.dart';
import 'package:gazhome/data/models/user_model.dart';

class AppLocalDataSource {
  AppLocalDataSource(this._prefs);

  final SharedPreferencesLogger _prefs;

  Future<void> cacheFirstTime() async {
    await _prefs.setBool(AppKeys.kFirstTime, false);
  }

  bool isFirstTime() {
    return _prefs.getBool(AppKeys.kFirstTime) ?? true;
  }

  Future<void> cacheLanguageCode(String code) async {
    await _prefs.setString(AppKeys.kLanguageCode, code);
  }

  String getLanguageCode() {
    return _prefs.getString(AppKeys.kLanguageCode) ?? defaultLanguage.langCode;
  }

  Future<void> cacheUser(UserModel user) async {
    await _prefs.setString(AppKeys.kUser, user.toJson());
  }

  UserModel getUser() {
    final userJson = _prefs.getString(AppKeys.kUser);
    return UserModel.fromJson(userJson!);
  }

  Future<void> removeUser() async {
    await _prefs.remove(AppKeys.kUser);
  }

  Future<void> cacheToken(String token) async {
    await _prefs.setString(AppKeys.kToken, token);
  }

  String getToken() {
    return (_prefs.getString(AppKeys.kToken)) ?? '';
  }

  Future<void> removeToken() async {
    await _prefs.remove(AppKeys.kToken);
  }

  bool isUserAuthenticated() {
    return getToken().isNotEmpty;
  }

  Future<void> incrementNotificationsCount() async {
    final count = await getNotificationsCount();
    await _prefs.setInt(AppKeys.kNotificationsCount, count + 1);
  }

  Future<void> resetNotificationsCount() async {
    await _prefs.setInt(AppKeys.kNotificationsCount, 0);
  }

  Future<int> getNotificationsCount() async {
    await _prefs.reload();
    return _prefs.getInt(AppKeys.kNotificationsCount) ?? 0;
  }
}
