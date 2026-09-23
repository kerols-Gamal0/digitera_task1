import 'package:shared_preferences/shared_preferences.dart';

abstract final class AppPreferences {
  static const _isLoggedInKey = 'is_logged_in';

  static Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_isLoggedInKey, value);
  }
}
