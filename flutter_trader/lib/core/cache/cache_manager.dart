import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static String? getString(String key) => _prefs?.getString(key);
  static Future<bool> setString(String key, String value) async =>
      await _prefs!.setString(key, value);
  static int? getInt(String key) => _prefs?.getInt(key);
  static Future<bool> setInt(String key, int value) async =>
      await _prefs!.setInt(key, value);
  static bool? getBool(String key) => _prefs?.getBool(key);
  static Future<bool> setBool(String key, bool value) async =>
      await _prefs!.setBool(key, value);
  static Map<String, dynamic>? getJson(String key) {
    final s = _prefs?.getString(key);
    if (s == null || s.isEmpty) return null;
    return jsonDecode(s) as Map<String, dynamic>;
  }

  static Future<bool> setJson(String key, Map<String, dynamic> value) async =>
      await _prefs!.setString(key, jsonEncode(value));
  static Future<bool> remove(String key) async => await _prefs!.remove(key);
  static Future<bool> clear() async => await _prefs!.clear();

  static String? get token => getString('token');
  static Future<bool> setToken(String value) => setString('token', value);
  static Future<bool> clearToken() => remove('token');
}
