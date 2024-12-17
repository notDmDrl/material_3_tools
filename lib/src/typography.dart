/// @docImport 'package:flutter/material.dart' show ScriptCategory;
library;

import 'package:flutter/material.dart'
    show
        ColorScheme,
        FontWeight,
        TargetPlatform,
        TextBaseline,
        TextLeadingDistribution,
        TextStyle,
        TextTheme,
        Typography;

/// A set of helpers used to create an expressive Material Design 3 typography.
///
/// See also:
///
/// * [Typography].
/// * Unreleased "Expressive Theme" Material Design 3 specification:
///   <https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:compose/material3/material3/src/commonMain/kotlin/androidx/compose/material3/Typography.kt?q=@ExperimentalMaterial3ExpressiveApi&start=11>
abstract final class ExpressiveTypography {
  /// Creates a expressive typography instance using Material Design 3 2021
  /// defaults.
  ///
  /// See also:
  ///
  ///  * [Typography.material2021], which is a base for this typography style.
  ///  * <https://m3.material.io/styles/typography>
  static Typography expressiveEnglishLike({
    TargetPlatform platform = TargetPlatform.android,
    ColorScheme colorScheme = const ColorScheme.light(),
  }) => Typography.material2021(
    platform: platform,
    colorScheme: colorScheme,
    englishLike: ExpressiveTypography.englishLike,
    dense: ExpressiveTypography.englishLike,
    tall: ExpressiveTypography.englishLike,
  );

  /// Defines text geometry for [ScriptCategory.englishLike] scripts, such as
  /// English, French, Russian, etc.
  ///
  /// The font sizes, weights, and letter spacings match the unreleased
  /// "Expressive Theme" Material Design 3 specification:
  /// <https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:compose/material3/material3/src/commonMain/kotlin/androidx/compose/material3/tokens/TypeScaleTokens.kt>
  static const TextTheme englishLike = TextTheme(
    displayLarge: TextStyle(
      debugLabel: 'englishLike expressive displayLarge',
      inherit: false,
      fontSize: 57,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 64 / 57,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    displayMedium: TextStyle(
      debugLabel: 'englishLike expressive displayMedium',
      inherit: false,
      fontSize: 45,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 52 / 45,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    displaySmall: TextStyle(
      debugLabel: 'englishLike expressive displaySmall',
      inherit: false,
      fontSize: 36,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 44 / 36,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineLarge: TextStyle(
      debugLabel: 'englishLike expressive headlineLarge',
      inherit: false,
      fontSize: 32,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 40 / 32,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineMedium: TextStyle(
      debugLabel: 'englishLike expressive headlineMedium',
      inherit: false,
      fontSize: 28,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 36 / 28,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineSmall: TextStyle(
      debugLabel: 'englishLike expressive headlineSmall',
      inherit: false,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 32 / 24,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleLarge: TextStyle(
      debugLabel: 'englishLike expressive titleLarge',
      inherit: false,
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 28 / 22,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleMedium: TextStyle(
      debugLabel: 'englishLike expressive titleMedium',
      inherit: false,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
      height: 24 / 16,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleSmall: TextStyle(
      debugLabel: 'englishLike expressive titleSmall',
      inherit: false,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.1,
      height: 20 / 14,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelLarge: TextStyle(
      debugLabel: 'englishLike expressive labelLarge',
      inherit: false,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.1,
      height: 20 / 14,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelMedium: TextStyle(
      debugLabel: 'englishLike expressive labelMedium',
      inherit: false,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
      height: 16 / 12,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    labelSmall: TextStyle(
      debugLabel: 'englishLike expressive labelSmall',
      inherit: false,
      fontSize: 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
      height: 16 / 11,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyLarge: TextStyle(
      debugLabel: 'englishLike expressive bodyLarge',
      inherit: false,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 24 / 16,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyMedium: TextStyle(
      debugLabel: 'englishLike expressive bodyMedium',
      inherit: false,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      height: 20 / 14,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodySmall: TextStyle(
      debugLabel: 'englishLike expressive bodyMedium',
      inherit: false,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.4,
      height: 16 / 12,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  );
}
