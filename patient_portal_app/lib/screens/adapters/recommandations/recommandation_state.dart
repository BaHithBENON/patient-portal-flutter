import 'package:equatable/equatable.dart';

import '../../../enums/recommandation_category_enum.dart' show RecommandationCategory;
import '../../../models/recommandation.dart' show ModelRecommandation;

class RecommandationState extends Equatable {
  final List<ModelRecommandation> recommandations;
  final List<ModelRecommandation> filteredRecommandations;
  final RecommandationCategory? selectedCategory;
  final bool isLoading;
  final String? errorMessage;

  const RecommandationState({
    this.recommandations = const [],
    this.filteredRecommandations = const [],
    this.isLoading = false,
    this.errorMessage,
    this.selectedCategory,
  });

  RecommandationState copyWith({
    List<ModelRecommandation>? recommandations,
    bool? isLoading,
    String? errorMessage,
    List<ModelRecommandation>? filteredRecommandations,
    RecommandationCategory? selectedCategory,
  }) {
    return RecommandationState(
      recommandations: recommandations ?? this.recommandations,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      filteredRecommandations: filteredRecommandations ?? this.filteredRecommandations,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [recommandations, filteredRecommandations, selectedCategory, isLoading, errorMessage];
}