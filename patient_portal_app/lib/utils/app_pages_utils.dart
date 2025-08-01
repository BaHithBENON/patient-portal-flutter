import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/app_screens_wrapper.dart' show AppScreensWrapper;
import '../screens/home_screen.dart';
import '../screens/appointments_screen.dart';
import '../screens/dossier_screen.dart';
import '../screens/recommandations_screen.dart';
import 'app_routes_utils.dart';

/// Encapsulation d'une navigation simplifiée comme avec GetX,
/// mais en utilisant GoRouter.
class AppPagesUtils {
  final String route;
  final Map<String, String>? pathParams;
  final Map<String, dynamic>? queryParams;
  final Object? extra;
  final bool replace;

  const AppPagesUtils({
    required this.route,
    this.pathParams,
    this.queryParams,
    this.extra,
    this.replace = false,
  });

  static Future<void> buildPath({
    required BuildContext context,
    required List<AppPagesUtils> pages,
  }) async {
    for (final page in pages) {
      await Future.delayed(const Duration(milliseconds: 300));
      if (context.mounted) {
        page.navigate(context);
      }
    }
  }

  void navigate(BuildContext context) {
    final uri = Uri(path: route, queryParameters: queryParams);
    final resolvedPath = uri.toString();
    if (replace) {
      context.go(resolvedPath, extra: extra);
    } else {
      context.push(resolvedPath, extra: extra);
    }
  }
}

/// GoRouter configuré avec toutes les pages de l'application.
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutesUtils.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppScreensWrapper(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutesUtils.home,
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutesUtils.appointments,
          name: 'appointments',
          builder: (context, state) => const AppointmentsScreen(),
        ),
        GoRoute(
          path: AppRoutesUtils.dossier,
          name: 'dossier',
          builder: (context, state) => const DossierScreen(),
        ),
        GoRoute(
          path: AppRoutesUtils.recommandations,
          name: 'recommandations',
          builder: (context, state) => const RecommandationsScreen(),
        ),
      ],
    ),
  ],
);
