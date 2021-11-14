import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static AuthPreferences? _instance;
  static SharedPreferences? _prefs;

  final String _tokenKey = 'token';

  static Future<AuthPreferences> instance() async {
    _instance ??= AuthPreferences();

    _prefs ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  void setToken(String token) {
    _prefs!.setString(_tokenKey, token);
  }

  String? getToken() {
    return _prefs!.getString(_tokenKey);
  }

  void removeToken() {
    _prefs!.remove(_tokenKey);
  }
}
