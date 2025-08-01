import '../utils/attributs_values.dart' show AttributesValues;

class ModelPatient {
  final String? id;
  final String? firstName;
  final String? lastName;
  final DateTime? birthDate;

  ModelPatient({
    this.id,
    this.firstName,
    this.lastName,
    this.birthDate,
  });

  factory ModelPatient.fromJson(Map<String, dynamic> json) => ModelPatient(
    id: json[AttributesValues.id],
    firstName: json[AttributesValues.firstName],
    lastName: json[AttributesValues.lastName],
    birthDate: DateTime.tryParse(json[AttributesValues.birthDate]),
  );

  Map<String, dynamic> toJson() => {
    AttributesValues.id: id,
    AttributesValues.firstName: firstName,
    AttributesValues.lastName: lastName,
    AttributesValues.birthDate: birthDate?.toIso8601String(),
  };

  get fullName => "$firstName $lastName";
}
