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
  /// See also:
  ///
  /// * [M3 guidelines: typography, applying type](https://m3.material.io/styles/typography/applying-type)
  static TextTheme applyFontFamily({
    required TextTheme textTheme,
    String? fontFamily,
    String? displayFontFamily,
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
    );
  }

  /// Applies font family for specific text style of the provided [textTheme].
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
  }) => TextTheme(
    displayLarge: textTheme.displayLarge?.apply(
      fontFamily: displayLargeFontFamily,
    ),
    displayMedium: textTheme.displayMedium?.apply(
      fontFamily: displayMediumFontFamily,
    ),
    displaySmall: textTheme.displaySmall?.apply(
      fontFamily: displaySmallFontFamily,
    ),
    headlineLarge: textTheme.headlineLarge?.apply(
      fontFamily: headlineLargeFontFamily,
    ),
    headlineMedium: textTheme.headlineMedium?.apply(
      fontFamily: headlineMediumFontFamily,
    ),
    headlineSmall: textTheme.headlineSmall?.apply(
      fontFamily: headlineSmallFontFamily,
    ),
    titleLarge: textTheme.titleLarge?.apply(
      fontFamily: titleLargeFontFamily,
    ),
    titleMedium: textTheme.titleMedium?.apply(
      fontFamily: titleMediumFontFamily,
    ),
    titleSmall: textTheme.titleSmall?.apply(
      fontFamily: titleSmallFontFamily,
    ),
    bodyLarge: textTheme.bodyLarge?.apply(
      fontFamily: bodyLargeFontFamily,
    ),
    bodyMedium: textTheme.bodyMedium?.apply(
      fontFamily: bodyMediumFontFamily,
    ),
    bodySmall: textTheme.bodySmall?.apply(
      fontFamily: bodySmallFontFamily,
    ),
    labelLarge: textTheme.labelLarge?.apply(
      fontFamily: labelLargeFontFamily,
    ),
    labelMedium: textTheme.labelMedium?.apply(
      fontFamily: labelMediumFontFamily,
    ),
    labelSmall: textTheme.labelSmall?.apply(
      fontFamily: labelSmallFontFamily,
    ),
  );
}
