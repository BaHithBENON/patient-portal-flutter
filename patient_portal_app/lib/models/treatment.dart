import '../utils/attributs_values.dart' show AttributesValues;

class ModelTreatment {
  final String? name;
  final String? dosage;
  final String? frequency;

  ModelTreatment({
    this.name,
    this.dosage,
    this.frequency,
  });

  factory ModelTreatment.fromJson(Map<String, dynamic> json) => ModelTreatment(
    name: json[AttributesValues.name],
    dosage: json[AttributesValues.dosage],
    frequency: json[AttributesValues.frequency],
  );

  Map<String, dynamic> toJson() => {
    AttributesValues.name: name,
    AttributesValues.dosage: dosage,
    AttributesValues.frequency: frequency,
  };
}
