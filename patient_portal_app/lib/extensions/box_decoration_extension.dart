import 'package:flutter/material.dart';

extension BoxDecorationExtensions on BoxDecoration {
  /// Ajoute un fond coloré avec coins arrondis, bordures, ombres...
  static BoxDecoration circular({
    Color? color,
    double radius = 16,
    Border? border,
    bool shadow = false,
    Gradient? gradient,
    List<BoxShadow>? customShadows,
    DecorationImage? image,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: border,
      gradient: gradient,
      image: image,
      boxShadow: customShadows ??
          (shadow
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ]
              : null),
    );
  }

  /// Cercle parfait
  static BoxDecoration circle({
    Color? color,
    Border? border,
    Gradient? gradient,
    bool shadow = false,
    DecorationImage? image,
  }) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      border: border,
      gradient: gradient,
      image: image,
      boxShadow: shadow
          ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: .1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ]
          : null,
    );
  }
}
