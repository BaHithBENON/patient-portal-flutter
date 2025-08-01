import '../enums/appointment_status_enum.dart' show AppointmentStatus;
import '../utils/attributs_values.dart' show AttributesValues;

class ModelAppointment {
  final String? id;
  final String? patientId;
  final String? doctorName;
  final String? specialty;
  final DateTime? date;
  final String? location;
  final AppointmentStatus? status;

  ModelAppointment({
    this.id,
    this.patientId,
    this.doctorName,
    this.specialty,
    this.date,
    this.location,
    this.status,
  });

  factory ModelAppointment.fromJson(Map<String, dynamic> json) => ModelAppointment(
    id: json[AttributesValues.id],
    patientId: json[AttributesValues.patientId],
    doctorName: json[AttributesValues.doctorName],
    specialty: json[AttributesValues.specialty],
    date: DateTime.parse(json[AttributesValues.date]),
    location: json[AttributesValues.location],
    status: AppointmentStatus.fromString(json[AttributesValues.status]) ?? AppointmentStatus.upcoming,
  );

  Map<String, dynamic> toJson() => {
    AttributesValues.id: id,
    AttributesValues.patientId: patientId,
    AttributesValues.doctorName: doctorName,
    AttributesValues.specialty: specialty,
    AttributesValues.date: date?.toIso8601String(),
    AttributesValues.location: location,
    AttributesValues.status: status?.name,
  };
}
