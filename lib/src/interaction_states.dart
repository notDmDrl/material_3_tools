import 'package:flutter/material.dart';

import '/material_3_tools.dart';

/// Defines the ink response focus, hover, drag and splash colors.
///
/// See also:
///
/// * Material 3 specification for interaction states:
/// <https://m3.material.io/foundations/interaction-states>
///
/// * Used in [M3TextButtonStyle];
/// * Used in [M3FilledButtonStyle];
/// * Used in [M3OutlinedButtonStyle];
/// * Used in [M3ElevatedButtonStyle];
///
/// Possible usage places:
///
/// * [ButtonStyle.overlayColor];
/// * [InkResponse.overlayColor];
/// * [TabBar.overlayColor];
@immutable
class InteractionStatesOverlay implements MaterialStateProperty<Color?> {
  /// Creates Material 3 interaction state overlay.
  const InteractionStatesOverlay(this.color);

  /// Overlay color.
  ///
  /// Usually is [ColorScheme.primary].
  final Color? color;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return color?.withOpacity(0.08);
    }
    if (states.contains(MaterialState.focused)) {
      return color?.withOpacity(0.1);
    }
    if (states.contains(MaterialState.pressed)) {
      return color?.withOpacity(0.1);
    }
    if (states.contains(MaterialState.dragged)) {
      return color?.withOpacity(0.16);
    }

    return null;
  }
}

/// Defines foreground colors in enabled and disabled states.
///
/// See also:
///
/// * Material 3 specification for interaction states:
/// <https://m3.material.io/foundations/interaction-states>
///
/// * Used in [M3TextButtonStyle];
/// * Used in [M3FilledButtonStyle];
/// * Used in [M3OutlinedButtonStyle];
/// * Used in [M3ElevatedButtonStyle];
@immutable
class ForegroundStateOverlay implements MaterialStateProperty<Color?> {
  /// Creates Material 3 foreground interaction state overlay.
  const ForegroundStateOverlay({required this.color, this.disabledColor});

  /// Enabled color.
  ///
  /// Usually is [ColorScheme.primary].
  final Color? color;

  /// Disabled color.
  ///
  /// If null [color] will be used.
  final Color? disabledColor;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return (disabledColor ?? color)?.withOpacity(0.38);
    }

    return color;
  }
}

/// Defines background colors in enabled and disabled states.
///
/// See also:
///
/// * Material 3 specification for interaction states:
/// <https://m3.material.io/foundations/interaction-states>
///
/// * Used in [M3TextButtonStyle];
/// * Used in [M3FilledButtonStyle];
/// * Used in [M3OutlinedButtonStyle];
/// * Used in [M3ElevatedButtonStyle];
@immutable
class BackgroundStateOverlay implements MaterialStateProperty<Color?> {
  /// Creates Material 3 background interaction state overlay.
  const BackgroundStateOverlay({required this.color, this.disabledColor});

  /// Enabled color.
  ///
  /// Usually is [ColorScheme.primary].
  final Color? color;

  /// Disabled color.
  ///
  /// If null [color] will be used.
  final Color? disabledColor;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return (disabledColor ?? color)?.withOpacity(0.12);
    }

    return color;
  }
}

/// Defines border sides in enabled, disabled and focused states.
///
/// See also:
///
/// * Material 3 specification for interaction states:
/// <https://m3.material.io/foundations/interaction-states>
///
/// * Used in [M3OutlinedButtonStyle];
@immutable
class OutlineStateOverlay implements MaterialStateProperty<BorderSide> {
  /// Creates Material 3 outline interaction state.
  const OutlineStateOverlay({
    required this.color,
    this.disabledColor,
    this.focusedColor,
  });

  /// Enabled color.
  ///
  /// Usually is [ColorScheme.outline].
  final Color color;

  /// Disabled color.
  ///
  /// Usually is [ColorScheme.onSurface].
  ///
  /// If null [color] will be used.
  final Color? disabledColor;

  /// Focused color.
  ///
  /// Usually is [ColorScheme.primary].
  ///
  /// If null [color] will be used.
  final Color? focusedColor;

  @override
  BorderSide resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return BorderSide(color: (disabledColor ?? color).withOpacity(0.12));
    }

    if (states.contains(MaterialState.focused)) {
      return BorderSide(color: focusedColor ?? color);
    }

    return BorderSide(color: color);
  }
}

/// Defines elevation states for [ElevatedButton].
@immutable
class ElevatedButtonElevation implements MaterialStateProperty<double> {
  /// Creates Material 3 elevated button elevation state.
  const ElevatedButtonElevation();

  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return 0;
    }
    if (states.contains(MaterialState.hovered)) {
      return 3;
    }
    if (states.contains(MaterialState.focused)) {
      return 1;
    }
    if (states.contains(MaterialState.pressed)) {
      return 1;
    }

    return 1;
  }
}

/// Defines elevation states for [FilledButton] and [FilledButton.tonal].
@immutable
class FilledButtonElevation implements MaterialStateProperty<double> {
  /// Creates Material 3 filled button elevation state.
  const FilledButtonElevation();

  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return 1;
    }
    if (states.contains(MaterialState.dragged)) {
      return 6;
    }

    return 0;
  }
}
