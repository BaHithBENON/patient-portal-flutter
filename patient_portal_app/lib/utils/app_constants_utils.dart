import 'package:flutter/material.dart' show EdgeInsets, FontWeight;

/// A utility class for defining application-wide constants.
///
/// This class is meant to hold constant values that are used
/// throughout the application.
class AppConstantsUtils {

  // --- Font Sizes (tailles de polices) ---
  static const double fontSizeXS = 10.0;    // Très petit, légendes
  static const double fontSizeS = 12.0;     // Petit texte secondaire
  static const double fontSizeM = 14.0;     // Texte normal standard
  static const double fontSizeL = 18.0;     // Sous-titres
  static const double fontSizeXL = 22.0;    // Titres secondaires
  static const double fontSizeXXL = 28.0;   // Titres principaux
  static const double fontSizeXXXL = 34.0;  // Titres très importants / headers

  // --- Font Weights (poids de police) ---
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightBold = FontWeight.w700;

  // --- Date & Time Formats ---
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';

  // --- SnackBar Durations ---
  static const Duration shortSnackBar = Duration(seconds: 2);
  static const Duration longSnackBar = Duration(seconds: 5);

  /// Column Spacing
  static const double columnSpacingSmall = 4.0;
  static const double columnSpacingMedium = 8.0;
  static const double columnSpacingLarge = 12.0;

  /// Row Spacing
  static const double rowSpacingSmall = 4.0;
  static const double rowSpacingMedium = 8.0;
  static const double rowSpacingLarge = 12.0;

  // --- Spacings (espacements horizontaux) ---
  static const double itemSpacingXSH = 2.0;
  static const double itemSpacingSH = 8.0;
  static const double itemSpacingMH = 12.0;
  static const double itemSpacingLH = 16.0;
  static const double itemSpacingXLH = 32.0;
  static const double itemSpacingXXLH = 56.0;

  // --- Spacings (espacements verticaux) ---
  static const double itemSpacingXSV = 2.0;
  static const double itemSpacingSV = 8.0;
  static const double itemSpacingMV = 12.0;
  static const double itemSpacingLV = 16.0;
  static const double itemSpacingXLV = 32.0;
  static const double itemSpacingXXLV = 56.0;

  // --- Padding Scaffold (horizontal) ---
  static const double scaffoldHPaddingXS = 8.0;
  static const double scaffoldHPaddingS = 12.0;
  static const double scaffoldHPaddingM = 16.0;
  static const double scaffoldHPaddingL = 24.0;
  static const double scaffoldHPaddingXL = 32.0;
  static const double scaffoldHPaddingXXL = 48.0;

  // --- Padding Scaffold (vertical) ---
  static const double scaffoldVPaddingXS = 8.0;
  static const double scaffoldVPaddingS = 12.0;
  static const double scaffoldVPaddingM = 16.0;
  static const double scaffoldVPaddingL = 24.0;
  static const double scaffoldVPaddingXL = 32.0;
  static const double scaffoldVPaddingXXL = 48.0;

  // --- Button Spacing (horizontal) ---
  static const double buttonHSpacingXS = 4.0;
  static const double buttonHSpacingS = 8.0;
  static const double buttonHSpacingM = 12.0;
  static const double buttonHSpacingL = 16.0;

  // --- Button Spacing (vertical) ---
  static const double buttonVSpacingXS = 4.0;
  static const double buttonVSpacingS = 8.0;
  static const double buttonVSpacingM = 12.0;
  static const double buttonVSpacingL = 16.0;

  // --- Container Padding (horizontal) ---
  static const double containerPaddingHXS = 4.0;
  static const double containerPaddingHS = 8.0;
  static const double containerPaddingHM = 16.0;
  static const double containerPaddingHL = 24.0;
  static const double containerPaddingHXL = 32.0;

  // --- Container Padding (vertical) ---
  static const double containerPaddingVXS = 4.0;
  static const double containerPaddingVS = 8.0;
  static const double containerPaddingVM = 16.0;
  static const double containerPaddingVL = 24.0;
  static const double containerPaddingVXL = 32.0;

  // --- Icon Sizes ---
  static const double iconSizeXXS = 12.0;
  static const double iconSizeXS = 16.0;
  static const double iconSizeS = 20.0;
  static const double iconSizeM = 24.0;
  static const double iconSizeL = 32.0;
  static const double iconSizeXL = 48.0;
  static const double iconSizeXXL = 64.0;

  // --- Radius 0 ---
  static const double radius0 = 0.0;

  // --- Card Radius ---
  static const double cardRadiusXS = 6.0;
  static const double cardRadiusS = 10.0;
  static const double cardRadiusM = 16.0;
  static const double cardRadiusL = 24.0;
  static const double cardRadiusXL = 32.0;

  // --- Border Radius ---
  static const double borderRadiusXS = 6.0;
  static const double borderRadiusS = 10.0;
  static const double borderRadiusM = 16.0;
  static const double borderRadiusL = 24.0;
  static const double borderRadiusXL = 32.0;

  // --- Default Durations ---
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 600);

  // --- Elevation ---
  static const double elevationLow = 2.0;
  static const double elevationMedium = 6.0;
  static const double elevationHigh = 12.0;

  // --- Book items ---
  static const double bookCardWidthInRow = 150;
  static const double bookCardHeightInRow = 150;
  static const double bookCardWidthInColumn = 80;
  static const double bookCardHeightInColumn = 00;
  static const double bookCardWidthInGrid = 150;
  static const double bookCardHeightInGrid = 150;
  static const double bookEpisodeCardWidth = 60;
  static const double bookEpisodeCardHeight = 60;


  // --- Utilitaires EdgeInsets ---

  /// Padding horizontal symétrique pour Scaffold (taille moyenne par défaut)
  static const EdgeInsets scaffoldHPadding =
      EdgeInsets.symmetric(horizontal: scaffoldHPaddingM);

  /// Padding vertical symétrique pour Scaffold (taille moyenne par défaut)
  static const EdgeInsets scaffoldVPadding =
      EdgeInsets.symmetric(vertical: scaffoldVPaddingM);

  /// Padding symétrique horizontal et vertical pour Scaffold (taille moyenne)
  static const EdgeInsets scaffoldPadding = EdgeInsets.symmetric(
    horizontal: scaffoldHPaddingM,
    vertical: scaffoldVPaddingM,
  );

  /// Padding uniforme pour containers (taille moyenne par défaut)
  static const EdgeInsets containerPadding =
      EdgeInsets.symmetric(horizontal: containerPaddingHM, vertical: containerPaddingVM);

  /// Padding horizontal symétrique pour boutons (taille moyenne)
  static const EdgeInsets buttonHPadding =
      EdgeInsets.symmetric(horizontal: buttonHSpacingM);

  /// Padding vertical symétrique pour boutons (taille moyenne)
  static const EdgeInsets buttonVPadding =
      EdgeInsets.symmetric(vertical: buttonVSpacingM);

}
