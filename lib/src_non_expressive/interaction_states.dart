/// @docImport 'package:material_ui/material_ui.dart';
library;

import 'package:flutter/widgets.dart';

const _kDisabledContainerOpacity = 0.1;

/// Defines border sides in enabled, disabled and focused states.
///
/// See also:
///
/// * Material 3 specification for interaction states:
/// <https://m3.material.io/foundations/interaction-states>
@immutable
class const OutlineStateOverlay({
  /// Enabled color.
  ///
  /// Usually is [ColorScheme.outline].
  required final Color color,

  /// An optional color for [WidgetState.disabled].
  ///
  /// Usually is [ColorScheme.onSurface].
  ///
  /// If null, [color] will be used.
  final Color? disabledColor,

  /// An optional color for [WidgetState.focused].
  ///
  /// Usually is [ColorScheme.primary].
  ///
  /// If null, [color] will be used.
  final Color? focusedColor,

  /// An optional color for [WidgetState.selected].
  ///
  /// If null, [WidgetState.selected] state will be ignored.
  final Color? selectedColor,

  /// Border width resolver.
  ///
  /// Defaults to the width of `1` for [WidgetState.any]
  final WidgetStateMap<double> borderWidthResolver = const {WidgetState.any: 1},
}) implements WidgetStateProperty<BorderSide> {
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
