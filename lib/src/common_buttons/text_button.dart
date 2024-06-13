import 'package:flutter/material.dart';

import '../../material_3_tools.dart';

/// A helper class that allows creating Material 3 [TextButton]
/// [ButtonStyle] by extending [M3ButtonStyle] and limiting properties to the
/// ones that are used in Material 3 styled [TextButton].
///
/// See also:
///
/// * [TextButton.styleFrom], a static convenience method that constructs a
/// text button [ButtonStyle] given simple values.
/// * Text button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#899b9107-0127-4a01-8f4c-87f19323a1b4>
/// * Text button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#c9bcbc0b-ee05-45ad-8e80-e814ae919fbb>
/// * Material 3 buttons accessibility:
/// <https://m3.material.io/components/buttons/accessibility>
@immutable
final class M3TextButtonStyle extends M3ButtonStyle {
  /// Creates [ButtonStyle] for [TextButton] with const constructor.
  const M3TextButtonStyle({
    super.textStyle,
    super.foregroundColor,
    super.disabledColor,
    super.elevation = const WidgetStatePropertyAll(0),
    super.padding = M3ButtonStyle.textButtonLayoutPadding,
    super.minimumSize,
    super.fixedSize,
    super.maximumSize,
    super.shape,
    super.mouseCursor,
    super.tapTargetSize,
    super.visualDensity,
    super.splashFactory = InkSparkle.splashFactory,
  });
}
