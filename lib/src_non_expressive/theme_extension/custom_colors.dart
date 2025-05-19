import 'package:flutter/material.dart';

import '../custom_color.dart' show CustomColor;

/// Defines a set of [CustomColor] to be defined inside [ThemeData.extensions].
///
/// Custom colors are mapped based on [Object] key.
///
/// All examples assume [Object] is an [Enum] with values:
///
/// ```dart
/// enum AppCustomColors { red, green, blue }
/// ```
///
/// Example:
/// ```dart
/// ThemeData(
///   extensions: [
///     CustomColors({
///       AppCustomColors.red:
///           CustomColor.fromSource(sourceColor: Colors.red),
///       AppCustomColors.green:
///           CustomColor.fromSource(sourceColor: Colors.green),
///       AppCustomColors.blue:
///           CustomColor.fromSource(sourceColor: Colors.blue),
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
/// Default [CustomColor] brightness in [CustomColor.fromSource] is
/// [Brightness.light].
///
/// Accessing values:
///
/// To directly get required color use [CustomColors.of]:
///
/// ```dart
/// final color = CustomColors.of(context, AppCustomColors.red);
/// ```
@immutable
final class CustomColors extends ThemeExtension<CustomColors> {
  /// Creates a map of [CustomColor].
  const CustomColors(this.colors);

  /// A map of custom colors.
  final Map<Object, CustomColor> colors;

  /// Get [CustomColor] by its key from [ThemeData.extensions].
  ///
  /// If [CustomColors] is not defined or no [CustomColor] was
  /// found by provided key, this function will throw.
  static CustomColor of(BuildContext context, Object key) {
    final CustomColors? colors = Theme.of(context).extension<CustomColors>();

    if (colors == null) {
      throw ArgumentError('[CustomColors] are not defined in your ThemeData');
    }

    final CustomColor? lookup = colors.colors[key];

    if (lookup == null) {
      throw ArgumentError("Couldn't find [CustomColor] with provided key");
    }

    return lookup;
  }

  /// Creates a new map of [CustomColor]s.
  @override
  CustomColors copyWith({Map<Object, CustomColor>? colors}) =>
      CustomColors(colors ?? this.colors);

  @override
  CustomColors lerp(covariant ThemeExtension<CustomColors> other, double t) {
    if (other is! CustomColors) {
      return this;
    }

    // lerp colors if this instance
    final Map<Object, CustomColor> newColors = colors.map((id, color) {
        final CustomColor? otherColor = other.colors[id];
        return MapEntry(id, color.lerp(otherColor, t));
      })
      // add new colors from [other]
      ..addEntries(
        other.colors.entries.where((entry) => !colors.containsKey(entry.key)),
      );

    return CustomColors(newColors);
  }
}
