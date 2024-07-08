/// @docImport 'package:flutter/material.dart';
library;

import 'package:flutter/foundation.dart' show immutable;

import '../interaction_states.dart';
import 'button_style.dart';

/// A helper class that allows creating Material 3 [ElevatedButton]
/// [ButtonStyle] by extending [M3ButtonStyle] and limiting properties to the
/// ones that are used in Material 3 styled [ElevatedButton].
///
/// See also:
///
/// * [ElevatedButton.styleFrom], a static convenience method that constructs a
/// outlined button [ButtonStyle] given simple values.
/// * Elevated button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#0eea2a85-b4d7-4c74-b08e-98410b9412c7>
/// * Elevated button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#4e89da4d-a8fa-4e20-bb8d-b8a93eff3e3e>
/// * Material 3 buttons accessibility:
/// <https://m3.material.io/components/buttons/accessibility>
@immutable
final class M3ElevatedButtonStyle extends M3ButtonStyle {
  /// Creates [ButtonStyle] for [ElevatedButton] with const constructor.
  const M3ElevatedButtonStyle({
    super.textStyle,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledColor,
    super.shadowColor,
    super.elevation = const ElevatedButtonElevation(),
    super.padding = M3ButtonStyle.layoutPadding,
    super.minimumSize,
    super.fixedSize,
    super.maximumSize,
    super.shape,
    super.mouseCursor,
    super.tapTargetSize,
    super.visualDensity,
    super.splashFactory,
  });
}
