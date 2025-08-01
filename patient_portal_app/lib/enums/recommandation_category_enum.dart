enum RecommandationCategory { 
  
  all('Toutes'),
  sommeil('Sommeil'),
  nutrition('Nutrition'),
  activite('Activité physique');

  final String value;
  const RecommandationCategory(this.value);

  bool get isAll => RecommandationCategory.all == this;
  bool get isSommeil => RecommandationCategory.sommeil == this;
  bool get isNutrition => RecommandationCategory.nutrition == this;
  bool get isActivite => RecommandationCategory.activite == this;

  static RecommandationCategory? fromString(String? value) {
    if (value == null) return null;

    for (var category in RecommandationCategory.values) {
      if (category.value == value) return category;
    }

    if (value == RecommandationCategory.all.name) return RecommandationCategory.all;
    if (value == RecommandationCategory.sommeil.name) return RecommandationCategory.sommeil;
    if (value == RecommandationCategory.nutrition.name) return RecommandationCategory.nutrition;
    if (value == RecommandationCategory.activite.name) return RecommandationCategory.activite;
    
    return null;
  }

}