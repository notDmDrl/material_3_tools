import 'package:flutter/material.dart';

import '../../material_3_tools.dart';

/// A helper class that allows creating Material 3 [OutlinedButton]
/// [ButtonStyle] by extending [M3ButtonStyle] and limiting properties to the
/// ones that are used in Material 3 styled [OutlinedButton].
///
/// See also:
///
/// * [OutlinedButton.styleFrom], a static convenience method that constructs a
/// outlined button [ButtonStyle] given simple values.
/// * Outlined button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#de72d8b1-ba16-4cd7-989e-e2ad3293cf63>
/// * Outlined button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#3742b09f-c224-43e0-a83e-541bd29d0f05>
/// * Material 3 buttons accessibility:
/// <https://m3.material.io/components/buttons/accessibility>
@immutable
class M3OutlinedButtonStyle extends M3ButtonStyle {
  /// Creates [ButtonStyle] for [OutlinedButton] with const constructor.
  const M3OutlinedButtonStyle({
    super.textStyle,
    super.foregroundColor,
    super.disabledColor,
    super.side,
    super.backgroundColor,
    super.elevation = const MaterialStatePropertyAll(0),
    super.padding = M3ButtonStyle.layoutPadding,
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
