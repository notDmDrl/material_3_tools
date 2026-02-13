import 'package:flutter/material.dart';

import 'static_color.dart';

/// Defines a set of [StaticColor] to be defined inside [ThemeData.extensions].
///
/// Custom colors are mapped based on [Object] key.
///
/// All examples assume [Object] is an [Enum] with values:
///
/// ```dart
/// enum AppStaticColors { red, green, blue }
/// ```
///
/// Example:
/// ```dart
/// ThemeData(
///   extensions: [
///     StaticColors({
///       AppStaticColors.red:
///           StaticColor.fromSource(sourceColor: Colors.red),
///       AppStaticColors.green:
///           StaticColor.fromSource(sourceColor: Colors.green),
///       AppStaticColors.blue:
///           StaticColor.fromSource(sourceColor: Colors.blue),
///     }),
///   ],
/// );
/// ```
///
/// Brightness:
///
/// While defining your custom colors consider giving all custom colors same
/// [Brightness] so that colors doesn't look strange.
///
/// Default [StaticColor] brightness in [StaticColor.fromSource] is
/// [Brightness.light].
///
/// Accessing values:
///
/// To directly get required color use [StaticColors.of]:
///
/// ```dart
/// final color = StaticColors.of(context, AppStaticColors.red);
/// ```
@immutable
final class StaticColors extends ThemeExtension<StaticColors> {
  /// Creates a map of [StaticColor].
  const StaticColors(this.colors);

  /// A map of custom colors.
  final Map<Object, StaticColor> colors;

  /// Get [StaticColor] by its key from [ThemeData.extensions].
  ///
  /// If [StaticColors] is not defined or no [StaticColor] was
  /// found by provided key, this function will throw.
  static StaticColor of(BuildContext context, Object key) {
    final StaticColors? colors = Theme.of(context).extension<StaticColors>();

    if (colors == null) {
      throw ArgumentError('[StaticColors] are not defined in your ThemeData');
    }

    final StaticColor? lookup = colors.colors[key];

    if (lookup == null) {
      throw ArgumentError("Couldn't find [StaticColor] with provided key");
    }

    return lookup;
  }

  /// Creates a new map of [StaticColor]s.
  @override
  StaticColors copyWith({Map<Object, StaticColor>? colors}) =>
      StaticColors(colors ?? this.colors);

  @override
  StaticColors lerp(covariant ThemeExtension<StaticColors> other, double t) {
    if (other is! StaticColors) {
      return this;
    }

    // lerp colors if this instance
    final Map<Object, StaticColor> newColors =
        colors.map((id, color) {
            final StaticColor? otherColor = other.colors[id];
            return MapEntry(id, color.lerp(otherColor, t));
          })
          // add new colors from [other]
          ..addEntries(
            other.colors.entries.where(
              (entry) => !colors.containsKey(entry.key),
            ),
          );

    return StaticColors(newColors);
  }
}
