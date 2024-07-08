/// @docImport 'package:flutter/material.dart';
library;

import 'package:flutter/foundation.dart' show immutable;

import '../interaction_states.dart';
import 'button_style.dart';

/// A helper class that allows creating Material 3 [FilledButton]
/// [ButtonStyle] by extending [M3ButtonStyle] and limiting properties to the
/// ones that are used in Material 3 styled [FilledButton].
///
/// See also:
///
/// * [FilledButton.styleFrom], a static convenience method that constructs a
/// outlined button [ButtonStyle] given simple values.
/// * Filled button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#0b1b7bd2-3de8-431a-afa1-d692e2e18b0d>
/// * Filled button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#9ecffdb3-ef29-47e7-8d5d-f78b404fcafe>
/// * Material 3 buttons accessibility:
/// <https://m3.material.io/components/buttons/accessibility>
@immutable
final class M3FilledButtonStyle extends M3ButtonStyle {
  /// Creates [ButtonStyle] for [FilledButton] with const constructor.
  const M3FilledButtonStyle({
    super.textStyle,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledColor,
    super.shadowColor,
    super.shape,
    super.elevation = const FilledButtonElevation(),
    super.padding = M3ButtonStyle.layoutPadding,
    super.minimumSize,
    super.fixedSize,
    super.maximumSize,
    super.mouseCursor,
    super.tapTargetSize,
    super.visualDensity,
    super.splashFactory,
  });
}
