import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:patient_portal_app/extensions/scaffold_extension.dart';

import '../core/app_strings.dart' show AppStrings;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;
import '../widgets/app_bar_widget.dart' show AppBarWidget;
import '../widgets/icon_button_widget.dart' show IconButtonWidget;
import '../widgets/last_appoitement_widget.dart' show LastAppoitementWidget;
import '../widgets/patient_welcome_widget.dart' show PatientWelcomeWidget;
import '../widgets/random_recommandation_widget.dart'
    show RandomRecommandationWidget;
import '../widgets/theme_mode_toggle.dart' show ThemeModeToggle;
import 'adapters/home/home_controller.dart' show homeControllerProvider;
import 'patients_screen.dart' show PatientsScreen;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeControllerProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floating: true,
          pinned: true,
          snap: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstantsUtils.scaffoldHPaddingM,
            ),
            child: SafeArea(
              bottom: false,
              child: AppBarWidget(
                title: AppStrings.appName,
                actions: [
                  IconButtonWidget(
                    onIconPressed: () {
                      showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        isScrollControlled: true,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        builder: (_) {
                          return PatientsScreen();
                        },
                      );
                    },
                    icon: const Icon(Icons.person),
                  ),
                  //
                  ThemeModeToggle(),
                ],
              ),
            ),
          ),
        ),

        if (homeState.isLoading) ...[
          const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
        ] else ...[
          if (homeState.errorMessage != null) ...[
            SliverFillRemaining(
              child: Center(
                child: Text(
                  kDebugMode
                      ? homeState.errorMessage ?? ''
                      : 'Une erreur est survenue. Veuillez réessayer.',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ] else ...[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstantsUtils.scaffoldHPaddingM,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppConstantsUtils.columnSpacingLarge * 2,
                  children: [
                    //
                    PatientWelcomeWidget(patient: homeState.currentPatient),
                    //
                    const RandomRecommandationWidget(),
                    //
                    const LastAppoitementWidget(),
                  ],
                ),
              ),
            ),
          ],
        ],
      ],
    ).emptyScaffold;
  }
}
