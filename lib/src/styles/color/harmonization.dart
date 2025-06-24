/// @docImport 'static_color.dart';
library;

import 'dart:ui' show Color;

import 'package:material_color_utilities/material_color_utilities.dart'
    show Blend;

/// In dynamic schemes, you can automatically adjust the hue of static colors
/// so they look better alongside the scheme’s primary color.
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Flwt814il-4.png?alt=media&token=c451da1d-f5cb-43ef-ad1c-d1e8e23c68bd)
///
/// **Why**
///
/// [StaticColor] may visually clash with a scheme’s dynamically changing
/// colors. To improve visual harmony, Material provides an optional ‘harmonize’
/// function that slightly adjusts static colors to look better in
/// dynamic schemes.
///
/// Colors that are closer in hue appear more pleasing together than colors
/// with hues farther apart. Based on this principle, harmonization adjusts
/// the hue of static colors, making them closer to the hue of the scheme’s
/// primary color.
///
/// To preserve the semantic meaning of static colors (such as a red to
/// communicate errors), harmonization limits the amount that a color’s hue
/// can change. Harmonized colors will become warmer or cooler in hue
/// without appearing like another type of color.
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Flwt81svm-5.png?alt=media&token=75856d62-6223-4263-9919-8996940fa1c6)
///
/// See also:
///
/// * [M3 guidelines: color, harmonize colors](https://m3.material.io/styles/color/advanced/adjust-existing-colors#1cc12e43-237b-45b9-8fe0-9a3549c1f61e)
abstract final class ColorHarmonization {
  /// Harmonize custom color with, usually, your theme primary color.
  static Color harmonize(Color source, Color? harmonizationColor) {
    if (harmonizationColor == null || source == harmonizationColor) {
      return source;
    }

    return Color(
      Blend.harmonize(source.toARGB32(), harmonizationColor.toARGB32()),
    );
  }
}
