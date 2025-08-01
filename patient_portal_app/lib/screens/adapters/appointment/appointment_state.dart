import 'package:equatable/equatable.dart';

import '../../../enums/appointment_status_enum.dart' show AppointmentStatus;
import '../../../models/appointment.dart' show ModelAppointment;

class AppointmentState extends Equatable {
  final List<ModelAppointment> allAppointments;
  final ModelAppointment? lastAppointment;
  final AppointmentStatus? selectedStatus;
  final bool isLoading;
  final String? errorMessage;

  const AppointmentState({
    this.allAppointments = const [],
    this.lastAppointment,
    this.selectedStatus,
    this.isLoading = false,
    this.errorMessage,
  });

  AppointmentState copyWith({
    List<ModelAppointment>? allAppointments,
    ModelAppointment? lastAppointment,
    AppointmentStatus? selectedStatus,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AppointmentState(
      allAppointments: allAppointments ?? this.allAppointments,
      lastAppointment: lastAppointment ?? this.lastAppointment,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [allAppointments, lastAppointment, selectedStatus, isLoading, errorMessage];
}
