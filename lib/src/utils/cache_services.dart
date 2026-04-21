import 'package:shared_preferences/shared_preferences.dart';

import 'cache_keys.dart';

class CacheService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('CacheService.init() chaqirilmagan');
    }
    return _prefs!;
  }

  static String getToken() {
    return prefs.getString(CacheKeys.token) ?? '';
  }

  static Future<void> removeToken() async {
    await prefs.remove(CacheKeys.token);
  }

  static Future<void> saveToken(String token) async {
    await prefs.setString(CacheKeys.token, token);
  }

  static bool getLogin(){
    return prefs.getBool(CacheKeys.isLogin)??false;
  }
  static Future<void> removeLogin() async {
    await prefs.remove(CacheKeys.isLogin);
  }

  static Future<void> saveLogin(bool isLogin) async {
    await prefs.setBool(CacheKeys.token, isLogin);
  }

}