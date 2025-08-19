import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static SharedPreferences? _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Setters
  static Future<void> setIdToken(String value) async => await _prefs?.setString('google_id_token', value);
  static Future<void> setAccessToken(String value) async => await _prefs?.setString('google_access_token', value);
  static Future<void> setName(String value) async => await _prefs?.setString('google_name', value);
  static Future<void> setEmail(String value) async => await _prefs?.setString('google_email', value);
  static Future<void> setPhoto(String value) async => await _prefs?.setString('google_photo', value);

  // Getters
  static String? get idToken => _prefs?.getString('google_id_token');
  static String? get accessToken => _prefs?.getString('google_access_token');
  static String? get name => _prefs?.getString('google_name');
  static String? get email => _prefs?.getString('google_email');
  static String? get photo => _prefs?.getString('google_photo');

  // Clear all
  static Future<void> clear() async => await _prefs?.clear();
}
