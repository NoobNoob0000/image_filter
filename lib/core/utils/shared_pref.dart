import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences only once
  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  // Save data
  static Future<void> saveValue(String key, var value) async {
    if (value is int) {
      await _preferences?.setInt(key, value);
    } else if (value is double) {
      await _preferences?.setDouble(key, value);
    } else if (value is String) {
      await _preferences?.setString(key, value);
    } else {
      await _preferences?.setBool(key, value);
    }
  }

  // Get data
  static dynamic getValue(String key, Type type) {
    if (type == int) {
      return _preferences?.getInt(key);
    } else if (type == double) {
      return _preferences?.getDouble(key);
    } else if (type == String) {
      return _preferences?.getString(key);
    } else if (type == bool) {
      return _preferences?.getBool(key);
    }
    return null;
  }

  // Remove specific key
  static Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  // Clear all data
  static Future<void> clear() async {
    await _preferences?.clear();
  }
}
