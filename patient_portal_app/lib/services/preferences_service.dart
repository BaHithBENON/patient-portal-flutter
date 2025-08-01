import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyPatientId = 'current_patient_id';
  static const _keyThemeMode = 'theme_mode';

  static Future<void> setCurrentPatientId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPatientId, id);
  }

  static Future<String?> getCurrentPatientId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPatientId);
  }

  static Future<void> setThemeMode(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, theme);
  }

  static Future<String?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyThemeMode);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
