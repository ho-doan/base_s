import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper(this.pref);

  final SharedPreferences pref;

  String getFcmTokenKey() {
    try {
      return pref.getString(Keys.fcmToken) ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFcmTokenKey(String fcmToken) async {
    await pref.setString(Keys.fcmToken, fcmToken);
  }

  String? getString(String key) {
    return pref.getString(key);
  }

  Future<void> setInt({
    required SharedPreferencesRequest<int> sharedPreferencesRequest,
  }) async {
    await pref.setInt(
        sharedPreferencesRequest.key, sharedPreferencesRequest.value);
  }

  int? getInt({required String key}) {
    return pref.getInt(key);
  }

  Future<void> setStringList({
    required SharedPreferencesRequest<List<String>> sharedPreferencesRequest,
  }) async {
    await pref.setStringList(
        sharedPreferencesRequest.key, sharedPreferencesRequest.value);
  }

  List<String>? getStringList({
    required String key,
  }) {
    return pref.getStringList(key);
  }

  Future<void> setBool({
    required SharedPreferencesRequest<bool> sharedPreferencesRequest,
  }) async {
    await pref.setBool(
        sharedPreferencesRequest.key, sharedPreferencesRequest.value);
  }

  bool? getBool({required String key}) {
    return pref.getBool(key);
  }

  Future<bool> setObject({
    required SharedPreferencesRequest<Map<String, dynamic>> request,
  }) async {
    final data = await pref.setString(request.key, jsonEncode(request.value));
    return data;
  }

  Map<String, dynamic> getObject({
    required String key,
  }) {
    final object = pref.getString(key);
    if (object.isNullOrEmpty) return {};
    return jsonDecode(object!) as Map<String, dynamic>;
  }

  Future<void> cleanAllData() async {
    await pref.clear();
  }

  Future<void> setListObject<T>({
    required SharedPreferencesRequest<List<T>> sharedPreferencesRequest,
  }) async {
    if (sharedPreferencesRequest.value.isEmpty) return;
    final json = jsonEncode(sharedPreferencesRequest.value.toList()).toString();

    pref.setString(sharedPreferencesRequest.key, json);
  }

  Future<List<T>> getListObject<T>({
    required String key,
  }) async {
    if (pref.getString(key) == null) {
      return <T>[];
    }
    return jsonDecode(pref.getString(key) ?? '');
  }
}

class SharedPreferencesRequest<T> {
  SharedPreferencesRequest({required this.key, required this.value});
  final String key;
  final T value;
}
