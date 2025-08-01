import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifier, StateNotifierProvider;
import '../../../enums/appointment_status_enum.dart' show AppointmentStatus;
import '../../../services/appointment_service.dart' show AppointmentService;
import 'appointment_state.dart' show AppointmentState;

class AppointmentController extends StateNotifier<AppointmentState>  {

  AppointmentController() : super(AppointmentState());

  Future<void> getAllAppointments(String patientId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final allAppointments = await AppointmentService.getAllAppointmentsByPatientId(patientId);
      state = state.copyWith(isLoading: false, allAppointments: allAppointments, selectedStatus: AppointmentStatus.all);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString(), selectedStatus: AppointmentStatus.all);
    }
  }

  Future<void> getLastAppoitment(String patientId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final lastAppointment = await AppointmentService.getLastAppointmentByPatientId(patientId);
      state = state.copyWith(isLoading: false, lastAppointment: lastAppointment, selectedStatus: AppointmentStatus.all);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString(), selectedStatus: AppointmentStatus.all);
    }
  }

    Future<void> filteredAppointmentsByStatus(AppointmentStatus status, String patientId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      if (status == AppointmentStatus.all) {
        await getAllAppointments(patientId);
        return;
      }
      final rdvs = await AppointmentService.getAllAppointmentsByPatientIdAndStatus(patientId, status);
      state = state.copyWith(isLoading: false, allAppointments: rdvs, selectedStatus: status);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString(), selectedStatus: status);
    }
  }
}

final appointmentControllerProvider = StateNotifierProvider<AppointmentController, AppointmentState>(
  (ref) => AppointmentController(),
);