import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/app_theme_mode.dart' show AppThemeMode;
import '../../../services/preferences_service.dart' show PreferencesService;

final themeControllerProvider = StateNotifierProvider<ThemeController, AppThemeMode>(
  (ref) => ThemeController(),
);

class ThemeController extends StateNotifier<AppThemeMode> {

  ThemeController() : super(AppThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await PreferencesService.getThemeMode();
    if (prefs != null) {
      state = AppThemeMode.fromString(prefs);
    }
  }

  Future<void> setTheme(AppThemeMode mode) async {
    state = mode;
    await PreferencesService.setThemeMode(mode.name);
  }

  bool get isDark => state == AppThemeMode.dark;
}
