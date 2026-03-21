import 'package:carzo/core/di/dependency_injection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  // GetIt instance
  static SharedPreferences get _prefs => getIt<SharedPreferences>();
  static const _secureStorage = FlutterSecureStorage();

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    }
  }

  /// Get methods
  static String getString(String key) => _prefs.getString(key) ?? "";
  static int getInt(String key) => _prefs.getInt(key) ?? 0;
  static double getDouble(String key) => _prefs.getDouble(key) ?? 0.0;
  static bool getBool(String key) => _prefs.getBool(key) ?? false;

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    await _prefs.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    await _prefs.clear();
  }

  // SECURE STORAGE METHODS

  static Future<void> setSecuredString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    return await _secureStorage.read(key: key) ?? "";
  }

  static Future<void> clearAllSecuredData() async {
    await _secureStorage.deleteAll();
  }
}
