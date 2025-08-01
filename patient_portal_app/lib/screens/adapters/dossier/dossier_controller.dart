
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifier, StateNotifierProvider;

import '../../../services/dossier_service.dart' show DossierService;
import 'dossier_state.dart' show DossierState;

class DossierController extends StateNotifier<DossierState>  {

  DossierController() : super(DossierState());

  Future<void> getDossier(String patientId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final dossier = await DossierService.getDossierByPatientId(patientId: patientId);
      state = state.copyWith(isLoading: false, dossier: dossier);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final dossierControllerProvider = StateNotifierProvider<DossierController, DossierState>(
  (ref) => DossierController(),
);