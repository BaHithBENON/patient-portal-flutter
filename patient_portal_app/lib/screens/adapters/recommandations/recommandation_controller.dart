import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifier, StateNotifierProvider;

import '../../../enums/recommandation_category_enum.dart' show RecommandationCategory;
import '../../../services/recommandation_service.dart' show RecommandationService;
import 'recommandation_state.dart' show RecommandationState;

class RecommandationController extends StateNotifier<RecommandationState>  {

  RecommandationController() : super(const RecommandationState()) {
    getAllRecommandations();
  }
  

  Future<void> getAllRecommandations() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final recommandations = await RecommandationService.getAllRecommandations();
      state = state.copyWith(isLoading: false, recommandations: recommandations, selectedCategory: RecommandationCategory.all);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString(), selectedCategory: RecommandationCategory.all);
    }
  }

  Future<void> filteredRecommandationsByCategory(RecommandationCategory category) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      if (category == RecommandationCategory.all) {
        await getAllRecommandations();
        return;
      }
      final recommandations = await RecommandationService.getRecommandationsByCategory(category);
      state = state.copyWith(isLoading: false, recommandations: recommandations, selectedCategory: category);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final recommandationControllerProvider = StateNotifierProvider<RecommandationController, RecommandationState>(
  (ref) => RecommandationController(),
);