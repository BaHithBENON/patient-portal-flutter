import '../enums/appointment_status_enum.dart' show AppointmentStatus;
import '../models/appointment.dart' show ModelAppointment;
import 'data_loader.dart' show DataLoader;

class AppointmentService {

  static Future<List<ModelAppointment>> getAllAppointments() async => DataLoader.loadAppointments();

  static Future<ModelAppointment?> getLastAppointmentByPatientId(String patientId) async {
    final appointments = await getAllAppointments();
    return appointments.where((a) => a.patientId == patientId).lastOrNull;
  }

  static Future<List<ModelAppointment>> getAllAppointmentsByPatientId(String patientId) async {
    final appointments = await getAllAppointments();
    return appointments.where((a) => a.patientId == patientId).toList();
  }

  static Future<List<ModelAppointment>> getAllAppointmentsByPatientIdAndStatus(String patientId, AppointmentStatus status) async {
    final appointments = await getAllAppointments();
    return appointments.where((a) => a.patientId == patientId && a.status == status).toList();
  }

  static Future<List<ModelAppointment>> getByStatus(AppointmentStatus status) async {
    final appointments = await getAllAppointments();
    return appointments.where((a) => a.status == status).toList();
  }
  
}