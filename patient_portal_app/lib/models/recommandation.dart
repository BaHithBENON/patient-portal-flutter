import '../enums/recommandation_category_enum.dart' show RecommandationCategory;
import '../utils/attributs_values.dart' show AttributesValues;

class ModelRecommandation {
  final String? id;
  final String? title;
  final String? content;
  final RecommandationCategory? category;

  ModelRecommandation({
    this.id,
    this.title,
    this.content,
    this.category,
  });

  factory ModelRecommandation.fromJson(Map<String, dynamic> json) => ModelRecommandation(
    id: json[AttributesValues.id],
    title: json[AttributesValues.title],
    content: json[AttributesValues.description],
    category: RecommandationCategory.fromString(json[AttributesValues.category]) ?? RecommandationCategory.sommeil,
  );

  Map<String, dynamic> toJson() => {
    AttributesValues.id: id,
    AttributesValues.title: title,
    AttributesValues.description: content,
    AttributesValues.category: category?.name,
  };
}
