import 'package:flutter/material.dart';

/// Weight and grade affect a symbol’s thickness. Adjustments to grade are
/// more granular than adjustments to weight and have a smaller impact on the
/// size of the symbol.
///
/// Grade is also available in some text fonts. Grade levels between text
/// and symbols can be matched for a harmonious visual effect. For example,
/// if the text font has a -25 grade value, the symbols can match it
/// with a suitable value of -25.
///
/// Grade can also compensate for visual bleed, which is when images can look
/// bigger or smaller depending on the color contrast.
/// To match the apparent icon size, the default grade for a dark icon on
/// a light background is 0, and -25 for a light icon on a dark background.
abstract final class IconGrade {
  /// Returns the default grade for an icon for current [ThemeData]'s
  /// *brightness*:
  ///
  /// * 0 - for [Brightness.light];
  /// * -25 - for [Brightness.dark];
  ///
  /// See also:
  ///
  /// * Icons grade guidelines:
  /// <https://m3.material.io/styles/icons/applying-icons#3ad55207-1cb0-43af-8092-fad2762f69f7>
  double of(BuildContext context) => switch (Theme.brightnessOf(context)) {
    Brightness.light => kLightGrade,
    Brightness.dark => kDarkGrade,
  };

  /// The default grade for a dark icon on a light background.
  static const double kLightGrade = 0;

  /// The default grade for a light icon on a dark background.
  static const double kDarkGrade = -25;
}
