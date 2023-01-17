import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// Create just primary [TonalPalette].
///
/// Based on [CorePalette.of].
TonalPalette _tonalPalette(int argb) {
  final cam = Cam16.fromInt(argb);

  return TonalPalette.of(cam.hue, math.max(48, cam.chroma));
}

/// Harmonize custom color with, usually, your theme primary color.
///
/// [harmonizationColor] typically is [ColorScheme.primary] color.
///
/// Copied implementation from <https://pub.dev/packages/dynamic_color>
Color harmonizedColor(Color source, Color? harmonizationColor) {
  if (harmonizationColor == null || source == harmonizationColor) return source;

  return Color(Blend.harmonize(source.value, harmonizationColor.value));
}

/// A set of 4 colors based on the [Material 3 Custom colors spec](https://m3.material.io/styles/color/the-color-system/custom-colors)
///
/// Custom colors are similar to [ColorScheme], but they only have primary set
/// of colors.
///
/// Custom colors are used as an addition to existing [ColorScheme] with ability
/// to harmonize [CustomColor] to, usually, [ColorScheme.primary] color.
///
/// > Harmonization is a feature that can shift tones of a custom color to
/// > ensure that visual balance and accessible contrast is achieved when
/// > combined with user-generated colors.
/// [link](https://m3.material.io/styles/color/the-color-system/custom-colors#ddaf6b05-71b7-4985-949b-9fbf06ff3791)
@immutable
class CustomColor {
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

  /// Creates [CustomColor] by providing source color, brightness and optional
  /// harmonization color.
  factory CustomColor.fromSource({
    required Color sourceColor,
    Brightness brightness = Brightness.light,
    Color? harmonizationColor,
  }) {
    final color = harmonizedColor(sourceColor, harmonizationColor).value;

    final _Scheme scheme;
    switch (brightness) {
      case Brightness.dark:
        scheme = _Scheme._darkFromCorePalette(_tonalPalette(color));
        break;
      case Brightness.light:
        scheme = _Scheme._lightFromCorePalette(_tonalPalette(color));
        break;
    }

    return CustomColor(
      primary: Color(scheme.primary),
      onPrimary: Color(scheme.onPrimary),
      primaryContainer: Color(scheme.primaryContainer),
      onPrimaryContainer: Color(scheme.onPrimaryContainer),
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
        primaryContainer: Color.lerp(
          primaryContainer,
          other?.primaryContainer,
          t,
        )!,
        onPrimaryContainer: Color.lerp(
          onPrimaryContainer,
          other?.onPrimaryContainer,
          t,
        )!,
      );
}

/// Rework of [Scheme] with only color fields required to create [CustomColor].
@immutable
class _Scheme {
  const _Scheme({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
  });

  _Scheme._lightFromCorePalette(TonalPalette palette)
      : primary = palette.get(40),
        onPrimary = palette.get(100),
        primaryContainer = palette.get(90),
        onPrimaryContainer = palette.get(10);

  _Scheme._darkFromCorePalette(TonalPalette palette)
      : primary = palette.get(80),
        onPrimary = palette.get(20),
        primaryContainer = palette.get(30),
        onPrimaryContainer = palette.get(90);

  final int primary;
  final int onPrimary;
  final int primaryContainer;
  final int onPrimaryContainer;
}
