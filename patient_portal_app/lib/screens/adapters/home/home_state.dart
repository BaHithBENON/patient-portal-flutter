import 'package:equatable/equatable.dart';
import 'package:patient_portal_app/models/patient.dart';

class HomeState extends Equatable {
  final List<ModelPatient> allPatients;
  final ModelPatient? currentPatient;
  final bool isLoading;
  final String? errorMessage;

  const HomeState({
    this.allPatients = const [],
    this.currentPatient,
    this.isLoading = false,
    this.errorMessage,
  });

  HomeState copyWith({
    List<ModelPatient>? allPatients,
    ModelPatient? currentPatient,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      allPatients: allPatients ?? this.allPatients,
      currentPatient: currentPatient ?? this.currentPatient,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [allPatients, currentPatient, isLoading, errorMessage];
}
