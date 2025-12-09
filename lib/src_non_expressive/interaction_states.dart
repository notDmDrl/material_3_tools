import 'package:flutter/material.dart';

const _kDisabledContainerOpacity = 0.1;

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
