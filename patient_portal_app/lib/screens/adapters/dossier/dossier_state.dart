import 'package:equatable/equatable.dart';
import 'package:patient_portal_app/models/dossier.dart';

class DossierState extends Equatable {
  final ModelDossier? dossier;
  final bool isLoading;
  final String? errorMessage;

  const DossierState({
    this.dossier,
    this.isLoading = false,
    this.errorMessage,
  });

  DossierState copyWith({
    ModelDossier? dossier,
    bool? isLoading,
    String? errorMessage,
  }) {
    return DossierState(
      dossier: dossier ?? this.dossier,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [dossier, isLoading, errorMessage];
}
