import 'package:ema/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalNetwork {
  static late SharedPreferences prefs;
  static Future shared_prefrence_initlzation() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> insertUserIdToCash(
      {required String key, required int id}) async {
    userId = id;
    return await prefs.setInt(key, id);
  }

  static Future<bool> insertUserTokenToCash(
      {required String key, required String token}) async {
    accessToken = token;

    return await prefs.setString(key, token);
  }

  static int? getUserIdFromCash() {
    return prefs.getInt('id');
  }

  static Future<bool> clearCash() {
    return prefs.clear();
  }
}
