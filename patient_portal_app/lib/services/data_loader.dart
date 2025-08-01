import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../models/patient.dart' show ModelPatient;
import '../models/appointment.dart' show ModelAppointment;
import '../models/dossier.dart' show ModelDossier;
import '../models/recommandation.dart' show ModelRecommandation;
import '../utils/mock_data_paths.dart' show MockDataPaths;

class DataLoader {

  // Charge les infos des patients (patients.json)
  static Future<List<ModelPatient>> loadPatients() async {
    final String jsonString = await rootBundle.loadString(MockDataPaths.patient);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => ModelPatient.fromJson(e)).toList();
  }

  // Charge tous les rendez-vous (rendezvous.json)
  static Future<List<ModelAppointment>> loadAppointments() async {
    final String jsonString = await rootBundle.loadString(MockDataPaths.appointments);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => ModelAppointment.fromJson(e)).toList();
  }

  // Charge les infos des dossiers médicaux complet (dossier.json)
  static Future<List<ModelDossier>> loadDossiers() async {
    final String jsonString = await rootBundle.loadString(MockDataPaths.dossier);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => ModelDossier.fromJson(e)).toList();
  }
  
  // Charge les recommandations santé (recommandations.json)
  static Future<List<ModelRecommandation>> loadRecommandations() async {
    final String jsonString = await rootBundle.loadString(MockDataPaths.recommandations);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => ModelRecommandation.fromJson(e)).toList();
  }
}
