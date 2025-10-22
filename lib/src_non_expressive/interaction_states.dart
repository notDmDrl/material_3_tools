import 'package:flutter/material.dart';

// Values taken from https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:compose/material3/material3/src/commonMain/kotlin/androidx/compose/material3/tokens/StateTokens.kt
const _kDraggedOpacity = 0.16;
const _kFocusOpacity = 0.1;
const _kHoverOpacity = 0.08;
const _kPressedOpacity = 0.1;

const _kDisabledContainerOpacity = 0.12;
const _kDisabledForegroundOpacity = 0.38;

/// Defines the ink response for focus, hover, drag and splash [WidgetState]s.
///
/// See also:
///
/// * Material 3 specification for interaction states:
/// <https://m3.material.io/foundations/interaction-states>
@immutable
class InteractionStatesOverlay implements WidgetStateProperty<Color?> {
  /// Creates Material 3 interaction state overlay.
  const InteractionStatesOverlay({required this.color, this.selectedColor});

  /// Overlay color.
  ///
  /// Usually is [ColorScheme.primary].
  final Color? color;

  /// An optional color for [WidgetState.selected].
  ///
  /// If null, [WidgetState.selected] state will be ignored.
  final Color? selectedColor;

  WidgetStateMapper<Color?> get _mapper {
    // for non-null promotion
    final Color? selectedColor = this.selectedColor;
    final Color? color = this.color;

    return WidgetStateMapper<Color?>({
      if (selectedColor != null) ...{
        WidgetState.selected & WidgetState.hovered: selectedColor.withValues(
          alpha: _kHoverOpacity,
        ),
        WidgetState.selected & WidgetState.focused: selectedColor.withValues(
          alpha: _kFocusOpacity,
        ),
        WidgetState.selected & WidgetState.pressed: selectedColor.withValues(
          alpha: _kPressedOpacity,
        ),
        WidgetState.selected & WidgetState.dragged: selectedColor.withValues(
          alpha: _kDraggedOpacity,
        ),
      },
      if (color != null) ...{
        WidgetState.hovered: color.withValues(alpha: _kHoverOpacity),
        WidgetState.focused: color.withValues(alpha: _kFocusOpacity),
        WidgetState.pressed: color.withValues(alpha: _kPressedOpacity),
        WidgetState.dragged: color.withValues(alpha: _kDraggedOpacity),
      },
      WidgetState.any: null,
    });
  }

  @override
  Color? resolve(Set<WidgetState> states) => _mapper.resolve(states);
}

/// Defines foreground colors in enabled and disabled states.
///
/// See also:
///
/// * Material 3 specification for interaction states:
/// <https://m3.material.io/foundations/interaction-states>
@immutable
class ForegroundStateOverlay implements WidgetStateProperty<Color?> {
  /// Creates Material 3 foreground interaction state overlay.
  const ForegroundStateOverlay({
    required this.color,
    this.disabledColor,
    this.selectedColor,
  });

  /// Enabled color.
  ///
  /// Usually is [ColorScheme.primary].
  final Color? color;

  /// An optional color for [WidgetState.disabled].
  ///
  /// If null, [color] will be used.
  final Color? disabledColor;

  /// An optional color for [WidgetState.selected].
  ///
  /// If null, [color] will be used.
  final Color? selectedColor;

  WidgetStateMapper<Color?> get _mapper => WidgetStateMapper<Color?>({
    WidgetState.disabled: (disabledColor ?? color)?.withValues(
      alpha: _kDisabledForegroundOpacity,
    ),
    if (selectedColor != null) WidgetState.selected: selectedColor,
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
@immutable
class BackgroundStateOverlay implements WidgetStateProperty<Color?> {
  /// Creates Material 3 background interaction state overlay.
  const BackgroundStateOverlay({
    required this.color,
    this.disabledColor,
    this.selectedColor,
  });

  /// Enabled color.
  ///
  /// Usually is [ColorScheme.primary].
  final Color? color;

  /// An optional color for [WidgetState.disabled].
  ///
  /// If null, [color] will be used.
  final Color? disabledColor;

  /// An optional color for [WidgetState.selected].
  ///
  /// If null, [color] will be used.
  final Color? selectedColor;

  WidgetStateMapper<Color?> get _mapper => WidgetStateMapper<Color?>({
    WidgetState.disabled: (disabledColor ?? color)?.withValues(
      alpha: _kDisabledContainerOpacity,
    ),
    if (selectedColor != null) WidgetState.selected: selectedColor,
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
@immutable
class OutlineStateOverlay implements WidgetStateProperty<BorderSide> {
  /// Creates Material 3 outline interaction state.
  const OutlineStateOverlay({
    required this.color,
    this.disabledColor,
    this.focusedColor,
    this.selectedColor,
    this.borderWidthResolver = const {WidgetState.any: 1},
  });

  /// Enabled color.
  ///
  /// Usually is [ColorScheme.outline].
  final Color color;

  /// An optional color for [WidgetState.disabled].
  ///
  /// Usually is [ColorScheme.onSurface].
  ///
  /// If null, [color] will be used.
  final Color? disabledColor;

  /// An optional color for [WidgetState.focused].
  ///
  /// Usually is [ColorScheme.primary].
  ///
  /// If null, [color] will be used.
  final Color? focusedColor;

  /// An optional color for [WidgetState.selected].
  ///
  /// If null, [WidgetState.selected] state will be ignored.
  final Color? selectedColor;

  /// Border width resolver.
  ///
  /// Defaults to the width of `1` for [WidgetState.any]
  final WidgetStateMap<double> borderWidthResolver;

  WidgetStateColor get _mapper => WidgetStateColor.fromMap({
    WidgetState.disabled: (disabledColor ?? color).withValues(
      alpha: _kDisabledContainerOpacity,
    ),
    WidgetState.selected: ?selectedColor,
    WidgetState.focused: ?focusedColor,
    WidgetState.any: color,
  });

  @override
  BorderSide resolve(Set<WidgetState> states) => BorderSide(
    color: _mapper.resolve(states),
    width: WidgetStateMapper(borderWidthResolver).resolve(states),
  );
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

  /// Creates filled button elevation state that always has the elevation value
  /// of zero.
  static const WidgetStateProperty<double> none = WidgetStatePropertyAll(0);

  static const _mapper = WidgetStateProperty<double>.fromMap({
    WidgetState.hovered: 1,
    WidgetState.dragged: 6,
    WidgetState.any: 1,
  });

  @override
  double resolve(Set<WidgetState> states) => _mapper.resolve(states);
}
