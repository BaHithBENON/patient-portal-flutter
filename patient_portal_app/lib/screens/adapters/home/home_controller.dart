import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifier, StateNotifierProvider;

import '../../../services/patient_service.dart' show PatientService;
import '../../../services/preferences_service.dart' show PreferencesService;
import 'home_state.dart' show HomeState;

class HomeController extends StateNotifier<HomeState> {
  
  HomeController() : super(const HomeState()) {
    getAllPatients();
    loadOnePatient();
  }

  Future<void> getAllPatients() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final allPatients = await PatientService.getAll();
      state = state.copyWith(isLoading: false, allPatients: allPatients);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> loadOnePatient() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final currentPatientId = await PreferencesService.getCurrentPatientId();
      if (currentPatientId != null) {
        final currentPatient = await PatientService.getPatientById(currentPatientId);
        state = state.copyWith(isLoading: false, currentPatient: currentPatient);
        return;
      }
      final currentPatient = await PatientService.getFirstPatient();
      state = state.copyWith(isLoading: false, currentPatient: currentPatient);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> setCurrentPatient(String id) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await PreferencesService.setCurrentPatientId(id);
      await loadOnePatient();
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(),
);