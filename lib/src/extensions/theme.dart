import 'package:flutter/material.dart' show Brightness, ThemeData;

const _kLightGrade = 0.0;
const _kDarkGrade = -25.0;

/// A set of Material 3 related [ThemeData] extensions.
extension ThemeX on ThemeData {
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
  double get iconGrade => switch (brightness) {
    Brightness.light => _kLightGrade,
    Brightness.dark => _kDarkGrade,
  };
}
