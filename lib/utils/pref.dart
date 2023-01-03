import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  Future<bool> setString(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(key, value);
  }

  Future<String> getString(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? '';
  }
}

class PREF_CONST {
  static const String USERNAME = "username";
  static const String USERBIO = "userbio";
}
