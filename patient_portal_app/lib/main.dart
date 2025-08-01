import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_strings.dart' show AppStrings;
import 'core/theme.dart' show MaterialTheme;
import 'core/util.dart' show createTextTheme;
import 'screens/adapters/theme_mode/theme_controller.dart'
    show themeControllerProvider;
import 'utils/app_pages_utils.dart' show appRouter;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Fragment Mono");
    MaterialTheme theme = MaterialTheme(textTheme);
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, _) {
          final themeMode = ref.watch(themeControllerProvider).toThemeMode;

          return MaterialApp.router(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
            themeMode: themeMode,
            theme: theme.light(),
            darkTheme: theme.dark(),
          );
        },
      ),
    );
  }
}
