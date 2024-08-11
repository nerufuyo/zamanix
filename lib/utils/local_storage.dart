import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final _storage = SharedPreferences.getInstance();

  Future<void> writeData(String key, dynamic value) async {
    final prefs = await _storage;
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    }
  }

  Future<String?> readData(String key) async {
    final prefs = await _storage;
    return prefs.getString(key);
  }

  Future<int?> readIntData(String key) async {
    final prefs = await _storage;
    return prefs.getInt(key);
  }

  Future<double?> readDoubleData(String key) async {
    final prefs = await _storage;
    return prefs.getDouble(key);
  }

  Future<bool?> readBoolData(String key) async {
    final prefs = await _storage;
    return prefs.getBool(key);
  }

  Future<List<String>?> readStringListData(String key) async {
    final prefs = await _storage;
    return prefs.getStringList(key);
  }

  Future<void> deleteData(String key) async {
    final prefs = await _storage;
    await prefs.remove(key);
  }

  Future<void> deleteAllData() async {
    final prefs = await _storage;
    await prefs.clear();
  }

  Future<void> replaceData(String key, dynamic value) async {
    final prefs = await _storage;
    await prefs.remove(key);
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    }
  }

  Future<bool> containsKey(String key) async {
    final prefs = await _storage;
    return prefs.containsKey(key);
  }
}
