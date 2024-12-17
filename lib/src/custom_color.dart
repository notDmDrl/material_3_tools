import 'package:flutter/material.dart'
    show Brightness, Color, ColorScheme, DynamicSchemeVariant, immutable;
import 'package:material_color_utilities/material_color_utilities.dart';

/// Harmonize custom color with, usually, your theme primary color.
///
/// See also:
///
/// * Harmonize colors M3 docs:
/// <https://m3.material.io/styles/color/advanced/adjust-existing-colors#1cc12e43-237b-45b9-8fe0-9a3549c1f61e>
Color harmonizedColor(Color source, Color? harmonizationColor) {
  if (harmonizationColor == null || source == harmonizationColor) return source;

  return Color(
    Blend.harmonize(source.toARGB32(), harmonizationColor.toARGB32()),
  );
}

/// A set of 4 colors based on the [Material 3 Custom colors spec](https://m3.material.io/styles/color/advanced/define-new-colors#f13116d1-3023-44b9-b0b5-2ee07dc1af5f)
///
/// Custom colors are similar to [ColorScheme], but they only have primary set
/// of colors.
///
/// Custom colors are used as an addition to existing [ColorScheme] with ability
/// to harmonize [CustomColor] to, usually, [ColorScheme.primary] color.
///
/// > In dynamic schemes, you can automatically adjust the hue of static colors
/// > so they look better alongside the scheme’s primary color.
/// [link](https://m3.material.io/styles/color/advanced/adjust-existing-colors#1cc12e43-237b-45b9-8fe0-9a3549c1f61e)
@immutable
final class CustomColor {
  /// Creates [CustomColor] from all required colors.
  ///
  /// [CustomColor.fromSource] can be used as a simpler way to create a custom
  /// color derived from a single source color.
  const CustomColor({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
  });

  /// Creates [CustomColor] by providing source color, brightness, scheme
  /// variant, and optional harmonization color.
  factory CustomColor.fromSource({
    required Color sourceColor,
    Brightness brightness = Brightness.light,
    DynamicSchemeVariant schemeVariant = DynamicSchemeVariant.tonalSpot,
    Color? harmonizationColor,
  }) {
    final int color =
        harmonizedColor(sourceColor, harmonizationColor).toARGB32();

    final isDark = brightness == Brightness.dark;
    final Hct sourceColorHct = Hct.fromInt(color);

    final DynamicScheme scheme = switch (schemeVariant) {
      DynamicSchemeVariant.tonalSpot => SchemeTonalSpot(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: 0,
      ),
      DynamicSchemeVariant.fidelity => SchemeFidelity(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: 0,
      ),
      DynamicSchemeVariant.monochrome => SchemeMonochrome(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: 0,
      ),
      DynamicSchemeVariant.neutral => SchemeNeutral(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: 0,
      ),
      DynamicSchemeVariant.vibrant => SchemeVibrant(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: 0,
      ),
      DynamicSchemeVariant.expressive => SchemeExpressive(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: 0,
      ),
      DynamicSchemeVariant.content => SchemeContent(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: 0,
      ),
      DynamicSchemeVariant.rainbow => SchemeRainbow(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: 0,
      ),
      DynamicSchemeVariant.fruitSalad => SchemeFruitSalad(
        sourceColorHct: sourceColorHct,
        isDark: isDark,
        contrastLevel: 0,
      ),
    };

    return CustomColor(
      primary: Color(MaterialDynamicColors.primary.getArgb(scheme)),
      onPrimary: Color(MaterialDynamicColors.onPrimary.getArgb(scheme)),
      primaryContainer: Color(
        MaterialDynamicColors.primaryContainer.getArgb(scheme),
      ),
      onPrimaryContainer: Color(
        MaterialDynamicColors.onPrimaryContainer.getArgb(scheme),
      ),
    );
  }

  /// The color used for elements needing high emphasis.
  final Color primary;

  /// A color that's clearly legible when drawn on [primary].
  final Color onPrimary;

  /// A color used for elements needing less emphasis than [primary].
  final Color primaryContainer;

  /// A color that's clearly legible when drawn on [primaryContainer].
  final Color onPrimaryContainer;

  /// Linearly interpolate between two custom colors.
  CustomColor lerp(CustomColor? other, double t) => CustomColor(
    primary: Color.lerp(primary, other?.primary, t)!,
    onPrimary: Color.lerp(onPrimary, other?.onPrimary, t)!,
    primaryContainer: Color.lerp(primaryContainer, other?.primaryContainer, t)!,
    onPrimaryContainer:
        Color.lerp(onPrimaryContainer, other?.onPrimaryContainer, t)!,
  );
}
