import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:patient_portal_app/extensions/scaffold_extension.dart';

import '../utils/app_constants_utils.dart' show AppConstantsUtils;
import '../widgets/allergies_history_widget.dart' show AllergiesHistoryWidget;
import '../widgets/app_bar_widget.dart' show AppBarWidget;
import '../widgets/medical_history_widget.dart' show MedicalHistoryWidget;
import '../widgets/simple_message_widget.dart' show SimpleMessageWidget;
import '../widgets/treatments_history_widget.dart' show TreatmentsHistoryWidget;
import 'adapters/dossier/dossier_controller.dart'
    show dossierControllerProvider;
import 'adapters/home/home_controller.dart' show homeControllerProvider;

class DossierScreen extends ConsumerStatefulWidget {
  const DossierScreen({super.key});

  @override
  ConsumerState<DossierScreen> createState() => _DossierScreenState();
}

class _DossierScreenState extends ConsumerState<DossierScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeState = ref.read(homeControllerProvider);
      final dossierController = ref.read(dossierControllerProvider.notifier);

      final patientId = homeState.currentPatient?.id;

      if (patientId != null) {
        dossierController.getDossier(patientId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeControllerProvider);
    final dossierState = ref.watch(dossierControllerProvider);

    final patientId = homeState.currentPatient?.id;

    if (patientId == null) {
      return const SimpleMessageWidget(
        message: 'Aucun dossier retrouvé pour le moment',
      );
    }

    if (dossierState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (dossierState.errorMessage != null) {
      return SimpleMessageWidget(
        message: kDebugMode
            ? dossierState.errorMessage!
            : 'Une erreur est survenue',
      );
    }

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
                title: 'Votre dossier',
              ),
            ),
          ),
          toolbarHeight: kToolbarHeight,
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            // Antécédents médicaux
            MedicalHistoryWidget(
              antecedents: dossierState.dossier?.antecedents ?? [],
            ),
            // Allergies
            AllergiesHistoryWidget(
              allergies: dossierState.dossier?.allergies ?? [],
            ),
            // Traitements en cours
            TreatmentsHistoryWidget(
              treatments: dossierState.dossier?.treatments ?? [],
            ),
          ]),
        ),
      ],
    ).simpleScaffold;
  }
}
