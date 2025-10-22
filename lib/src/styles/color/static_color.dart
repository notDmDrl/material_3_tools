/// @docImport 'package:flutter/material.dart';
/// @docImport 'harmonization.dart';
library;

import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'harmonization.dart';

/// A set of 4 colors based on the [Material 3 Static colors spec](https://m3.material.io/styles/color/advanced/define-new-colors#f13116d1-3023-44b9-b0b5-2ee07dc1af5f)
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Flwt7wrjx-1.png?alt=media&token=ca9d1728-afc1-4229-8280-ae94ad9f31f8)
///
/// Static colors are similar to [ColorScheme], but they only have primary set
/// of colors.
///
/// Custom colors are used as an addition to existing [ColorScheme] with ability
/// to harmonize [StaticColor] to, usually, [ColorScheme.primary] color.
///
/// See also:
///
/// * [M3 guidelines: color, static colors](https://m3.material.io/styles/color/advanced/define-new-colors#f13116d1-3023-44b9-b0b5-2ee07dc1af5f)
/// * [ColorHarmonization], color harmonization utils.
@immutable
final class StaticColor {
  /// Creates [StaticColor] from all required colors.
  ///
  /// [StaticColor.fromSource] can be used as a simpler way to create a custom
  /// color derived from a single source color.
  const StaticColor({
    required this.primary,
    required this.onPrimary,
    required this.container,
    required this.onContainer,
  });

  /// Creates [StaticColor] by providing source color, brightness, scheme
  /// variant, and optional harmonization color.
  ///
  /// If the colors provided back from your input color appear differently than
  /// expected, set [schemeVariant] to [DynamicSchemeVariant.fidelity].
  factory StaticColor.fromSource({
    required Color sourceColor,
    Color? harmonizationColor,
    Brightness brightness = .light,
    DynamicSchemeVariant schemeVariant = .tonalSpot,
    double contrastLevel = 0,
  }) {
    assert(
      contrastLevel >= -1 && contrastLevel <= 1,
      'Contrast levels should be between -1 and 1',
    );

    final isDark = brightness == .dark;

    final int color = ColorHarmonization.harmonize(
      sourceColor,
      harmonizationColor,
    ).toARGB32();

    final Hct sourceColorHct = Hct.fromInt(color);

    final DynamicScheme scheme = switch (schemeVariant) {
      .tonalSpot => SchemeTonalSpot(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      .fidelity => SchemeFidelity(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      .monochrome => SchemeMonochrome(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      .neutral => SchemeNeutral(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      .vibrant => SchemeVibrant(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      .expressive => SchemeExpressive(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      .content => SchemeContent(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      .rainbow => SchemeRainbow(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      .fruitSalad => SchemeFruitSalad(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
    };

    return StaticColor(
      primary: Color(scheme.primary),
      onPrimary: Color(scheme.onPrimary),
      container: Color(scheme.primaryContainer),
      onContainer: Color(scheme.onPrimaryContainer),
    );
  }

  /// The color used for elements needing high emphasis.
  final Color primary;

  /// A color that's clearly legible when drawn on [primary].
  final Color onPrimary;

  /// A color used for elements needing less emphasis than [primary].
  final Color container;

  /// A color that's clearly legible when drawn on [container].
  final Color onContainer;

  /// Linearly interpolate between two custom colors.
  StaticColor lerp(StaticColor? other, double t) => StaticColor(
    primary: .lerp(primary, other?.primary, t)!,
    onPrimary: .lerp(onPrimary, other?.onPrimary, t)!,
    container: .lerp(container, other?.container, t)!,
    onContainer: .lerp(onContainer, other?.onContainer, t)!,
  );
}
