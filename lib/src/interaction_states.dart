import 'package:flutter/material.dart';

/// Defines the ink response focus, hover, drag and splash colors.
///
/// See also:
///
/// * Material 3 specification for interaction states:
/// <https://m3.material.io/foundations/interaction-states>
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
  final Color color;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return color.withOpacity(0.08);
    }
    if (states.contains(MaterialState.focused)) {
      return color.withOpacity(0.12);
    }
    if (states.contains(MaterialState.pressed)) {
      return color.withOpacity(0.12);
    }
    if (states.contains(MaterialState.dragged)) {
      return color.withOpacity(0.16);
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
@immutable
class ForegroundStateOverlay implements MaterialStateProperty<Color?> {
  /// Creates Material 3 foreground interaction state overlay.
  const ForegroundStateOverlay({required this.color, this.disabledColor});

  /// Enabled color.
  final Color? color;

  /// Disabled color.
  ///
  /// If null [color] will be used.
  final Color? disabledColor;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (color == null) return null;

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
@immutable
class BackgroundStateOverlay implements MaterialStateProperty<Color?> {
  /// Creates Material 3 background interaction state overlay.
  const BackgroundStateOverlay({required this.color, this.disabledColor});

  /// Enabled color.
  final Color? color;

  /// Disabled color.
  ///
  /// If null [color] will be used.
  final Color? disabledColor;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (color == null) return null;

    if (states.contains(MaterialState.disabled)) {
      return (disabledColor ?? color)?.withOpacity(0.12);
    }

    return color;
  }
}
