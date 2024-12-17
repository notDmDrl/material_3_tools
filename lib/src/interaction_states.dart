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

  WidgetStateProperty<Color?> get _mapper => WidgetStateProperty.fromMap({
    WidgetState.hovered: color?.withValues(alpha: _kHoverOpacity),
    WidgetState.focused: color?.withValues(alpha: _kFocusOpacity),
    WidgetState.pressed: color?.withValues(alpha: _kPressedOpacity),
    WidgetState.dragged: color?.withValues(alpha: _kDraggedOpacity),
    WidgetState.any: null,
  });

  @override
  Color? resolve(Set<WidgetState> states) => _mapper.resolve(states);
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

  WidgetStateProperty<Color?> get _mapper => WidgetStateProperty.fromMap({
    WidgetState.disabled: (disabledColor ?? color)?.withValues(
      alpha: _kDisabledForegroundOpacity,
    ),
    WidgetState.any: color,
  });

  @override
  Color? resolve(Set<WidgetState> states) => _mapper.resolve(states);
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

  WidgetStateProperty<Color?> get _mapper => WidgetStateProperty.fromMap({
    WidgetState.disabled: (disabledColor ?? color)?.withValues(
      alpha: _kDisabledContainerOpacity,
    ),
    WidgetState.any: color,
  });

  @override
  Color? resolve(Set<WidgetState> states) => _mapper.resolve(states);
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

  WidgetStateProperty<Color> get _mapper => WidgetStateProperty.fromMap({
    WidgetState.disabled: (disabledColor ?? color).withValues(
      alpha: _kDisabledContainerOpacity,
    ),
    WidgetState.focused: focusedColor ?? color,
    WidgetState.any: color,
  });

  @override
  BorderSide resolve(Set<WidgetState> states) =>
      BorderSide(color: _mapper.resolve(states));
}

/// Defines elevation states for [ElevatedButton].
@immutable
class ElevatedButtonElevation implements WidgetStateProperty<double> {
  /// Creates Material 3 elevated button elevation state.
  const ElevatedButtonElevation();

  static const _mapper = WidgetStateProperty<double>.fromMap({
    WidgetState.disabled: 0,
    WidgetState.hovered: 3,
    WidgetState.any: 1,
  });

  @override
  double resolve(Set<WidgetState> states) => _mapper.resolve(states);
}

/// Defines elevation states for [FilledButton] and [FilledButton.tonal].
@immutable
class FilledButtonElevation implements WidgetStateProperty<double> {
  /// Creates Material 3 filled button elevation state.
  const FilledButtonElevation();

  static const _mapper = WidgetStateProperty<double>.fromMap({
    WidgetState.hovered: 1,
    WidgetState.dragged: 6,
    WidgetState.any: 1,
  });

  @override
  double resolve(Set<WidgetState> states) => _mapper.resolve(states);
}
