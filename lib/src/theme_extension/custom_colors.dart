import 'package:flutter/material.dart';

import '../custom_color.dart';

/// Defines a set of [CustomColor] to be defined inside [ThemeData.extensions].
///
/// Custom colors are mapped based on [Object] key.
///
/// All examples are assuming [Object] is a [Enum] with values:
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
/// To directly get required color use [CustomColors.maybeColorOf]:
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
  /// found by provided key this function will throw.
  static CustomColor of(BuildContext context, Object key) {
    final colors = Theme.of(context).extension<CustomColors>();

    if (colors == null) {
      throw ArgumentError('[CustomColors] are not defined in your ThemeData');
    }

    final lookup = colors.colors[key];

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
  CustomColors lerp(
    covariant ThemeExtension<CustomColors> other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }

    assert(
      colors.length == other.colors.length,
      'Cannot lerp between 2 uneven lengths maps',
    );

    final map = <Object, CustomColor>{};

    final length = colors.length;

    for (var i = 0; i < length; i++) {
      final color = colors.entries.elementAt(i);
      final otherColor = other.colors.values.elementAt(i);

      map.putIfAbsent(color.key, () => color.value.lerp(otherColor, t));
    }

    return CustomColors(map);
  }
}
