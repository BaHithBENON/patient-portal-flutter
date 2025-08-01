import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../models/patient.dart' show ModelPatient;
import '../models/appointment.dart' show ModelAppointment;
import '../models/dossier.dart' show ModelDossier;
import '../models/recommandation.dart' show ModelRecommandation;
import '../utils/mock_data_paths.dart' show MockDataPaths;

class DataLoader {

  static Future<List<ModelPatient>> loadPatients() async {
    final String jsonString = await rootBundle.loadString(MockDataPaths.patient);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => ModelPatient.fromJson(e)).toList();
  }

  static Future<List<ModelAppointment>> loadAppointments() async {
    final String jsonString = await rootBundle.loadString(MockDataPaths.appointments);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => ModelAppointment.fromJson(e)).toList();
  }

  static Future<List<ModelDossier>> loadDossiers() async {
    final String jsonString = await rootBundle.loadString(MockDataPaths.dossier);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => ModelDossier.fromJson(e)).toList();
  }
  
  static Future<List<ModelRecommandation>> loadRecommandations() async {
    final String jsonString = await rootBundle.loadString(MockDataPaths.recommandations);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => ModelRecommandation.fromJson(e)).toList();
  }
}
