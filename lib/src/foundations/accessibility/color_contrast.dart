import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

/// Set of utils used to calculate color contrast.
///
/// See also:
///
/// * [M3 guidelines: accessibility, color contrast](https://m3.material.io/foundations/designing/color-contrast)
abstract final class ColorContrast {
  /// Returns the contrast ratio between [foreground] and [background].
  ///
  /// The [background] must be opaque.
  ///
  /// See also:
  ///
  /// * [W3C contrast ratio formula](http://www.w3.org/TR/2008/REC-WCAG20-20081211/#contrast-ratiodef)
  /// * [M3 guidelines: accessibility, contrast ratios](https://m3.material.io/foundations/designing/color-contrast#b248ecd2-9abd-4877-8f5e-ebfbb87e2048)
  static double calculateContrast(Color foreground, Color background) {
    if (background.a != 1.0) {
      throw ArgumentError('Background can not be translucent');
    }

    var resolvedForeground = foreground;
    if (resolvedForeground.a < 1.0) {
      resolvedForeground = .alphaBlend(resolvedForeground, background);
    }

    final double foregroundLuminance =
        resolvedForeground.computeLuminance() + 0.05;
    final double backgroundLuminance = background.computeLuminance() + 0.05;

    return math.max(foregroundLuminance, backgroundLuminance) /
        math.min(foregroundLuminance, backgroundLuminance);
  }

  /// Asserts that the given [textStyle] has enough contrast to the [background].
  ///
  /// To call this function, use the following pattern, typically in the
  /// relevant Widget's build method:
  ///
  /// ```dart
  /// assert(debugCheckTextStyleHasValidContrast(textStyle, background));
  /// ```
  ///
  /// Does nothing if asserts are disabled. Always returns true.
  ///
  /// See also:
  ///
  /// * [M3 guidelines: accessibility, contrast ratios](https://m3.material.io/foundations/designing/color-contrast#b248ecd2-9abd-4877-8f5e-ebfbb87e2048)
  static bool debugCheckTextStyleHasValidContrast(
    TextStyle textStyle,
    Color background,
  ) {
    assert(() {
      final TextStyle(:Color? color, :double? fontSize) = textStyle;

      if (color == null || fontSize == null) {
        throw FlutterError(
          'Provided textStyle should have non-null color and fontSize.',
        );
      }

      final double contrast = calculateContrast(color, background);

      return switch (fontSize) {
        >= 18 when textStyle.weightIsAtLeast(400) => contrast >= 3,
        >= 14 when textStyle.weightIsAtLeast(700) => contrast >= 3,
        _ => contrast >= 4.5,
      };
    }(), '');

    return true;
  }
}

extension on TextStyle {
  bool weightIsAtLeast(double expectedWeight) {
    assert(
      expectedWeight >= 100 && expectedWeight <= 900,
      'Font weight should be in range of 100 to 900',
    );

    final double? fontVariationWeight = fontVariations
        ?.singleWhereOrNull((e) => e.axis == 'wght')
        ?.value;

    assert(
      fontVariationWeight != null || fontWeight != null,
      "Text style's should have either font weight or font variation font weight",
    );

    return (fontVariationWeight ?? fontWeight!.value) >= expectedWeight;
  }
}
