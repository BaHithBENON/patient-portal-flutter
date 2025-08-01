import '../models/patient.dart' show ModelPatient;
import 'data_loader.dart' show DataLoader;

class PatientService {
  static Future<List<ModelPatient>> getAll() async =>
      await DataLoader.loadPatients();

  static Future<ModelPatient?> getPatientById(String id) async {
    final patients = await getAll();
    return patients.where((p) => p.id == id).firstOrNull;
  }

  static Future<ModelPatient?> getFirstPatient() async {
    final patients = await getAll();
    return patients.firstOrNull;
  }
}
