import '../utils/attributs_values.dart' show AttributesValues;
import 'treatment.dart' show ModelTreatment;

class ModelDossier {
  final String? patientId;
  final List<String>? antecedents;
  final List<String>? allergies;
  final List<ModelTreatment>? treatments;

  ModelDossier({
    this.patientId,
    this.antecedents,
    this.allergies,
    this.treatments,
  });

  factory ModelDossier.fromJson(Map<String, dynamic> json) => ModelDossier(
    patientId: json[AttributesValues.patientId],
    antecedents: json[AttributesValues.antecedents] == null ? [] : List<String>.from(json[AttributesValues.antecedents]),
    allergies: json[AttributesValues.allergies] == null ? [] : List<String>.from(json[AttributesValues.allergies]),
    treatments: json[AttributesValues.treatments] == null ? [] : (json[AttributesValues.treatments] as List)
        .map((e) => ModelTreatment.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    AttributesValues.patientId: patientId,
    AttributesValues.antecedents: antecedents,
    AttributesValues.allergies: allergies,
    AttributesValues.treatments: treatments?.map((e) => e.toJson()).toList(),
  };
}
