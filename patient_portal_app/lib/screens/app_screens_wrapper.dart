import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouter, GoRouterHelper;
import 'package:patient_portal_app/extensions/scaffold_extension.dart';

import '../utils/app_routes_utils.dart' show AppRoutesUtils;

class AppScreensWrapper extends StatelessWidget {
  final Widget child;
  const AppScreensWrapper({super.key, required this.child});

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    if (location == AppRoutesUtils.home) return 0;
    return AppRoutesUtils.all.indexWhere((path) => location.startsWith(path));
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return child.emptyScaffoldWithProps(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index != currentIndex) {
            context.go(AppRoutesUtils.all[index]);
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Rendez-vous'),
          BottomNavigationBarItem(icon: Icon(Icons.folder_open), label: 'Dossier'),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: 'Conseils'),
        ],
      ),
    );
  }
}