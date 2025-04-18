import 'package:gazhome/core/utilities/app_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLogger {
  SharedPreferencesLogger(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<bool> setString(String key, String value) async {
    showLog('SharedPreferences: Saving key="$key" with value="$value"');
    return _sharedPreferences.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    showLog('SharedPreferences: Saving key="$key" with value="$value"');
    return _sharedPreferences.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    showLog('SharedPreferences: Saving key="$key" with value="$value"');
    return _sharedPreferences.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    showLog('SharedPreferences: Saving key="$key" with value="$value"');
    return _sharedPreferences.setDouble(key, value);
  }

  String? getString(String key) {
    final value = _sharedPreferences.getString(key);
    showLog('SharedPreferences: Retrieved key="$key" with value="$value"');
    return value;
  }

  int? getInt(String key) {
    final value = _sharedPreferences.getInt(key);
    showLog('SharedPreferences: Retrieved key="$key" with value="$value"');
    return value;
  }

  bool? getBool(String key) {
    final value = _sharedPreferences.getBool(key);
    showLog('SharedPreferences: Retrieved key="$key" with value="$value"');
    return value;
  }

  double? getDouble(String key) {
    final value = _sharedPreferences.getDouble(key);
    showLog('SharedPreferences: Retrieved key="$key" with value="$value"');
    return value;
  }

  Future<bool> remove(String key) async {
    showLog('SharedPreferences: Removing key="$key"');
    return _sharedPreferences.remove(key);
  }

  Future<bool> clear() async {
    showLog('SharedPreferences: Clearing all data');
    return _sharedPreferences.clear();
  }

  Future<void> reload() async {
    showLog('SharedPreferences: Clearing all data');
    return _sharedPreferences.reload();
  }
}
