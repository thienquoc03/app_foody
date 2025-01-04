import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static SharedPreferences? preferences;

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future saveToken(String token) async {
    return preferences!.setString('access_token', token);
  }

  static String? getToken() {
    return preferences!.getString('access_token');
  }
}