/// @docImport 'common_buttons/elevated_button.dart';
/// @docImport 'common_buttons/filled_button.dart';
/// @docImport 'common_buttons/outlined_button.dart';
/// @docImport 'common_buttons/text_button.dart';
library;

import 'package:flutter/material.dart';

// Values taken from https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:compose/material3/material3/src/commonMain/kotlin/androidx/compose/material3/tokens/StateTokens.kt
const _kDraggedOpacity = 0.16;
const _kFocusOpacity = 0.1;
const _kHoverOpacity = 0.08;
const _kPressedOpacity = 0.1;

const _kDisabledContainerOpacity = 0.12;
const _kDisabledForegroundOpacity = 0.38;

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
class InteractionStatesOverlay implements WidgetStateProperty<Color?> {
  /// Creates Material 3 interaction state overlay.
  const InteractionStatesOverlay(this.color);

  /// Overlay color.
  ///
  /// Usually is [ColorScheme.primary].
  final Color? color;

  @override
  Color? resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return color?.withOpacity(_kHoverOpacity);
    }
    if (states.contains(WidgetState.focused)) {
      return color?.withOpacity(_kFocusOpacity);
    }
    if (states.contains(WidgetState.pressed)) {
      return color?.withOpacity(_kPressedOpacity);
    }
    if (states.contains(WidgetState.dragged)) {
      return color?.withOpacity(_kDraggedOpacity);
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
class ForegroundStateOverlay implements WidgetStateProperty<Color?> {
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
  Color? resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return (disabledColor ?? color)?.withOpacity(_kDisabledForegroundOpacity);
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
class BackgroundStateOverlay implements WidgetStateProperty<Color?> {
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
  Color? resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return (disabledColor ?? color)?.withOpacity(_kDisabledContainerOpacity);
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
class OutlineStateOverlay implements WidgetStateProperty<BorderSide> {
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
  BorderSide resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return BorderSide(
        color: (disabledColor ?? color).withOpacity(_kDisabledContainerOpacity),
      );
    }
    if (states.contains(WidgetState.focused)) {
      return BorderSide(color: focusedColor ?? color);
    }

    return BorderSide(color: color);
  }
}

/// Defines elevation states for [ElevatedButton].
@immutable
class ElevatedButtonElevation implements WidgetStateProperty<double> {
  /// Creates Material 3 elevated button elevation state.
  const ElevatedButtonElevation();

  @override
  double resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return 0;
    if (states.contains(WidgetState.hovered)) return 3;

    return 1;
  }
}

/// Defines elevation states for [FilledButton] and [FilledButton.tonal].
@immutable
class FilledButtonElevation implements WidgetStateProperty<double> {
  /// Creates Material 3 filled button elevation state.
  const FilledButtonElevation();

  @override
  double resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) return 1;
    if (states.contains(WidgetState.dragged)) return 6;

    return 0;
  }
}
