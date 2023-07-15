import 'dart:convert';

import 'package:advanced3_task/model/secure_user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureService {
  static storeApiKey(String apiKey) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'apiKey', value: apiKey);
  }

  static Future<String?> loadApiKey() async {
    const storage = FlutterSecureStorage();
    String? apiKey = await storage.read(key: 'apiKey');
    return apiKey;
  }

  static Future<void> removeApiKey() async {
    const storage = FlutterSecureStorage();
    return storage.delete(key: 'apiKey');
  }

  static storeUser(SecureUser user) async {
    const storage = FlutterSecureStorage();
    String stringUser = jsonEncode(user);
    await storage.write(key: 'user', value: stringUser);
  }

  static Future<SecureUser?> loadUser() async {
    const storage = FlutterSecureStorage();
    String? stringUser = await storage.read(key: 'user');
    if (stringUser == null || stringUser.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(stringUser);
    return SecureUser.fromJson(map);
  }

  static Future<void> removeUser() async {
    const storage = FlutterSecureStorage();
    return storage.delete(key: 'user');
  }
}
