import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/icon_button_widget.dart';
import '../enums/app_theme_mode.dart' show AppThemeMode;
import '../screens/adapters/theme_mode/theme_controller.dart' show themeControllerProvider;

class ThemeModeToggle extends ConsumerWidget {
  const ThemeModeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modeState = ref.watch(themeControllerProvider);
    final controller = ref.read(themeControllerProvider.notifier);

    return IconButtonWidget(
      onIconPressed: () async {
        final nextMode = _toggleMode(modeState);
        await controller.setTheme(nextMode);
      },
      icon: Icon(
        modeState == AppThemeMode.dark
            ? Icons.dark_mode_rounded
            : Icons.light_mode_rounded
      ),
    );
  }

  AppThemeMode _toggleMode(AppThemeMode current) {
    if(current == AppThemeMode.dark) {
      return AppThemeMode.light;
    }
    return AppThemeMode.dark;
  }
}
