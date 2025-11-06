import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// Utility methods for creating lighter or darker variant of a given color.
abstract final class ColorUtils {
  /// Returns a lighter, by a given [ratio], variant of a given [color].
  ///
  /// If [ratio] cannot be achieved with the given [color], returns
  /// original [color].
  static Color lighter({
    required Color color,
    double ratio = 1,
  }) {
    assert(ratio >= 1 && ratio <= 21, 'Ratio should be within 1 and 21');

    final Hct hct = color.toHct();
    final double newTone = Contrast.lighter(
      tone: hct.tone,
      ratio: ratio,
    );
    if (newTone == -1) {
      return color;
    }

    return Color(
      hct.applyTone(newTone).toInt(),
    );
  }

  /// Returns a darker, by a given [ratio], variant of a given [color].
  ///
  /// If [ratio] cannot be achieved with the given [color], returns
  /// original [color].
  static Color darker({
    required Color color,
    double ratio = 1,
  }) {
    assert(ratio >= 1 && ratio <= 21, 'Ratio should be within 1 and 21');

    final Hct hct = color.toHct();
    final double newTone = Contrast.darker(
      tone: hct.tone,
      ratio: ratio,
    );
    if (newTone == -1) {
      return color;
    }

    return Color(
      hct.applyTone(newTone).toInt(),
    );
  }

  /// Returns a list of [Color]s, both lighter and darker, as well as the
  /// original [color], that can be used for creating gradients based on a single
  /// [color].
  ///
  /// Returned colors are in an order - lighter variant, original [color],
  /// and darker variant.
  ///
  /// If [ratio] cannot be achieved with the given [color], returns list of 3
  /// original [color]s in a row.
  static List<Color> gradient({
    required Color color,
    double ratio = 1,
  }) {
    assert(ratio >= 1 && ratio <= 21, 'Ratio should be within 1 and 21');

    final Hct hct = color.toHct();
    final double lighter = Contrast.lighter(
      tone: hct.tone,
      ratio: ratio,
    );
    final double darker = Contrast.darker(
      tone: hct.tone,
      ratio: ratio,
    );
    if (lighter == -1 || darker == -1) {
      return [color, color, color];
    }

    return [
      Color(
        hct.applyTone(lighter).toInt(),
      ),
      color,
      Color(
        hct.applyTone(darker).toInt(),
      ),
    ];
  }
}

extension on Hct {
  Hct applyTone(double newTone) => Hct.from(
    hue,
    chroma,
    newTone,
  );
}

extension on Color {
  Hct toHct() => Hct.fromInt(toARGB32());
}
