import 'package:flutter/material.dart';

/// A scrim can bring focus to specific elements by increasing the visual
/// contrast of a large layered surface. Use the scrim beneath elements
/// like modals and expanded navigation menus.
///
/// Scrims use the *scrim* color role at an opacity of 32%.
abstract final class Scrim {
  /// Returns the color of scrim container of the current [ColorScheme].
  ///
  /// See also:
  ///
  /// * Scrim guidelines:
  /// <https://m3.material.io/styles/elevation/applying-elevation#92b9fb39-f0c4-4829-8e4d-97ac512976aa>
  Color of(BuildContext context) => ColorScheme.of(context).scrim.withValues(
    alpha: 0.32,
  );
}
