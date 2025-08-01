import '../enums/recommandation_category_enum.dart' show RecommandationCategory;
import '../models/recommandation.dart' show ModelRecommandation;
import 'data_loader.dart' show DataLoader;

class RecommandationService {
  static Future<List<ModelRecommandation>> getAllRecommandations() async => await DataLoader.loadRecommandations();

  static Future<List<ModelRecommandation>> getRecommandationsByCategory(RecommandationCategory category) async {
    final recommandations = await getAllRecommandations();
    return recommandations.where((r) => r.category == category).toList();
  }

  static Future<ModelRecommandation?> getRecommandationById(String id) async {
    final recommandations = await getAllRecommandations();
    return recommandations.where((r) => r.id == id).firstOrNull;
  }
}