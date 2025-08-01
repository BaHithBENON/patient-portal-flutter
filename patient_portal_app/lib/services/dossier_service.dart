import '../models/dossier.dart' show ModelDossier;
import 'data_loader.dart' show DataLoader;

class DossierService {
  static Future<List<ModelDossier>> getAllDossiers() async => await DataLoader.loadDossiers();

  static Future<ModelDossier?> getDossierByPatientId({String? patientId}) async {
    final dossiers = await getAllDossiers();
    return dossiers.where((d) => d.patientId == patientId).firstOrNull;
  }
}