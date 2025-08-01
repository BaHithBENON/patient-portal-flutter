import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:patient_portal_app/core/theme.dart';
import 'package:patient_portal_app/extensions/scaffold_extension.dart';

import '../extensions/box_decoration_extension.dart'
    show BoxDecorationExtensions;
import '../utils/app_constants_utils.dart' show AppConstantsUtils;
import '../widgets/app_bar_widget.dart' show AppBarWidget;
import '../widgets/icon_button_widget.dart' show IconButtonWidget;
import '../widgets/simple_message_widget.dart' show SimpleMessageWidget;
import 'adapters/home/home_controller.dart' show homeControllerProvider;

class PatientsScreen extends ConsumerWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeControllerProvider);
    final homeController = ref.read(homeControllerProvider.notifier);
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(top: 10),
          sliver: SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
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
                  title: "Patients",
                  actions: [
                    IconButtonWidget(
                      onIconPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
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
              child: SimpleMessageWidget(
                message: kDebugMode
                    ? homeState.errorMessage!
                    : 'Une erreur est survenue',
              ),
            ),
          ] else ...[
            if (homeState.allPatients.isEmpty) ...[
              const SliverFillRemaining(
                child: SimpleMessageWidget(
                  message: 'Aucun patient retrouvé pour le moment',
                ),
              ),
            ] else ...[
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstantsUtils.scaffoldHPaddingM,
                  vertical: AppConstantsUtils.scaffoldVPaddingM,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => GestureDetector(
                      onTap: () {
                        if ((homeState.allPatients[index].id == homeState.currentPatient?.id)
                          || (homeState.allPatients[index].id == null)) {
                          Navigator.pop(context);
                          return;
                        }
                        homeController.setCurrentPatient(homeState.allPatients[index].id!);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstantsUtils.scaffoldHPaddingM,
                          vertical: AppConstantsUtils.containerPaddingVM,
                        ),
                        margin: const EdgeInsets.only(
                          bottom: AppConstantsUtils.containerPaddingVM / 2,
                        ),
                        decoration: BoxDecorationExtensions.circular(
                          color: context.adaptiveBackgroundColor,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          spacing: AppConstantsUtils.rowSpacingMedium,
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.tertiary,
                              child: Text(
                                homeState.allPatients[index].fullName?.split(' ')[1].substring(0, 1).toUpperCase() ?? '',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                              ),
                            ),
                            Text(
                              homeState.allPatients[index].fullName ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstantsUtils.fontSizeL,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    childCount: homeState.allPatients.length,
                  ),
                ),
              ),
            ],
          ],
        ],
      ],
    ).emptyScaffold;
  }
}
