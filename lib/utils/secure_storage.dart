import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> writeSecureData(String key, dynamic value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) async {
    return await _storage.read(key: key);
  }

  Future<Map> readAllSecureData() async {
    return await _storage.readAll();
  }

  Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> replaceSecureData(String key, dynamic value) async {
    await _storage.delete(key: key);
    await _storage.write(key: key, value: value);
  }

  Future<void> writeSecureDataList(String key, List<String> value) async {
    await _storage.write(key: key, value: value.join(','));
  }

  Future<List<String>> readSecureDataList(String key) async {
    final String? value = await _storage.read(key: key);
    return value!.split(',');
  }
}
