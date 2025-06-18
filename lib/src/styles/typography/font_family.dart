/// @docImport 'type_scale.dart';
library;

import 'package:flutter/material.dart';

/// Set of utils used to apply different font families for default tokens' text
/// styles.
///
/// See also:
///
/// * [M3TypeScale.baselineTokens]
/// * [M3TypeScale.emphasizedTokens]
abstract final class TypographyFontFamilyUtils {
  /// Applies [fontFamily] for all [textTheme]'s text styles.
  ///
  /// If [displayFontFamily] is not `null`, applies it to all display, headline,
  /// and title large styles.
  ///
  /// If [fontFeatures] is not `null`, applies it to all of [textTheme]'s styles.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: typography, applying type](https://m3.material.io/styles/typography/applying-type)
  static TextTheme applyFontFamily({
    required TextTheme textTheme,
    String? fontFamily,
    String? displayFontFamily,
    List<FontFeature>? fontFeatures,
  }) {
    final String? resolvedDisplayFontFamily = displayFontFamily ?? fontFamily;

    return applyFontFamilyToStyles(
      textTheme: textTheme,
      displayLargeFontFamily: resolvedDisplayFontFamily,
      displayMediumFontFamily: resolvedDisplayFontFamily,
      displaySmallFontFamily: resolvedDisplayFontFamily,
      headlineLargeFontFamily: resolvedDisplayFontFamily,
      headlineMediumFontFamily: resolvedDisplayFontFamily,
      headlineSmallFontFamily: resolvedDisplayFontFamily,
      titleLargeFontFamily: resolvedDisplayFontFamily,
      titleMediumFontFamily: fontFamily,
      titleSmallFontFamily: fontFamily,
      bodyLargeFontFamily: fontFamily,
      bodyMediumFontFamily: fontFamily,
      bodySmallFontFamily: fontFamily,
      labelLargeFontFamily: fontFamily,
      labelMediumFontFamily: fontFamily,
      labelSmallFontFamily: fontFamily,
      fontFeatures: fontFeatures,
    );
  }

  /// Applies font family for specific text style of the provided [textTheme].
  ///
  /// Additionally, if not `null` applies [fontFeatures] to all of the [textTheme]'s styles.
  static TextTheme applyFontFamilyToStyles({
    required TextTheme textTheme,
    String? displayLargeFontFamily,
    String? displayMediumFontFamily,
    String? displaySmallFontFamily,
    String? headlineLargeFontFamily,
    String? headlineMediumFontFamily,
    String? headlineSmallFontFamily,
    String? titleLargeFontFamily,
    String? titleMediumFontFamily,
    String? titleSmallFontFamily,
    String? bodyLargeFontFamily,
    String? bodyMediumFontFamily,
    String? bodySmallFontFamily,
    String? labelLargeFontFamily,
    String? labelMediumFontFamily,
    String? labelSmallFontFamily,
    List<FontFeature>? fontFeatures,
  }) => TextTheme(
    displayLarge: textTheme.displayLarge?.copyWith(
      fontFamily: displayLargeFontFamily,
      fontFeatures: fontFeatures,
    ),
    displayMedium: textTheme.displayMedium?.copyWith(
      fontFamily: displayMediumFontFamily,
      fontFeatures: fontFeatures,
    ),
    displaySmall: textTheme.displaySmall?.copyWith(
      fontFamily: displaySmallFontFamily,
      fontFeatures: fontFeatures,
    ),
    headlineLarge: textTheme.headlineLarge?.copyWith(
      fontFamily: headlineLargeFontFamily,
      fontFeatures: fontFeatures,
    ),
    headlineMedium: textTheme.headlineMedium?.copyWith(
      fontFamily: headlineMediumFontFamily,
      fontFeatures: fontFeatures,
    ),
    headlineSmall: textTheme.headlineSmall?.copyWith(
      fontFamily: headlineSmallFontFamily,
      fontFeatures: fontFeatures,
    ),
    titleLarge: textTheme.titleLarge?.copyWith(
      fontFamily: titleLargeFontFamily,
      fontFeatures: fontFeatures,
    ),
    titleMedium: textTheme.titleMedium?.copyWith(
      fontFamily: titleMediumFontFamily,
      fontFeatures: fontFeatures,
    ),
    titleSmall: textTheme.titleSmall?.copyWith(
      fontFamily: titleSmallFontFamily,
      fontFeatures: fontFeatures,
    ),
    bodyLarge: textTheme.bodyLarge?.copyWith(
      fontFamily: bodyLargeFontFamily,
      fontFeatures: fontFeatures,
    ),
    bodyMedium: textTheme.bodyMedium?.copyWith(
      fontFamily: bodyMediumFontFamily,
      fontFeatures: fontFeatures,
    ),
    bodySmall: textTheme.bodySmall?.copyWith(
      fontFamily: bodySmallFontFamily,
      fontFeatures: fontFeatures,
    ),
    labelLarge: textTheme.labelLarge?.copyWith(
      fontFamily: labelLargeFontFamily,
      fontFeatures: fontFeatures,
    ),
    labelMedium: textTheme.labelMedium?.copyWith(
      fontFamily: labelMediumFontFamily,
      fontFeatures: fontFeatures,
    ),
    labelSmall: textTheme.labelSmall?.copyWith(
      fontFamily: labelSmallFontFamily,
      fontFeatures: fontFeatures,
    ),
  );
}
