import 'package:flutter/material.dart';

import '/src/foundations/interaction/states.dart';
import 'button_configuration.dart';

/// Opacity and alpha constants which represent Material 3 button state layer
/// system.
///
/// The state layer uses a fixed percentage for the opacity for each state.
abstract final class ButtonStateToken {
  /// Baseline of disabled button's background opacity.
  ///
  /// See also:
  ///
  /// * [disabledContainerAlpha], the same value, but in alpha instead.
  static const disabledContainerOpacity = 0.1;

  /// Baseline of disabled button's background opacity.
  ///
  /// See also:
  ///
  /// * [disabledContainerOpacity], the same value, but in opacity percentage instead.
  static const disabledContainerAlpha = 0x1A;

  /// Baseline of disabled button's background opacity.
  ///
  /// See also:
  ///
  /// * [disabledLabelAlpha], the same value, but in alpha instead.
  static const disabledLabelOpacity = 0.38;

  /// Baseline of disabled button's background opacity.
  ///
  /// See also:
  ///
  /// * [disabledLabelOpacity], the same value, but in opacity percentage instead.
  static const disabledLabelAlpha = 0x61;
}

/// Defines the ink response for focus, hover, drag and splash [WidgetState]s.
final class InteractionStatesOverlay implements WidgetStateProperty<Color> {
  /// Creates Material 3 interaction state overlay for a default button.
  const InteractionStatesOverlay({required this.color})
    : _type = .button,
      unselected = null,
      selected = null;

  /// Creates Material 3 interaction state overlay for a toggle button.
  const InteractionStatesOverlay.toggle({
    required this.unselected,
    required this.selected,
  }) : _type = .toggle,
       color = null;

  final ButtonType _type;

  /// Overlay color.
  final Color? color;

  /// Overlay color for unselected toggle buttons.
  final Color? unselected;

  /// Overlay color for selected toggle buttons.
  final Color? selected;

  WidgetStateMapper<Color> get _mapper {
    final Map<WidgetStatesConstraint, Color> map;

    switch (_type) {
      case ButtonType.button:
        final Color? color = this.color;

        map = {
          if (color != null) ...{
            WidgetState.hovered: color.withAlpha(StateLayerToken.hoverAlpha),
            WidgetState.focused: color.withAlpha(StateLayerToken.focusAlpha),
            WidgetState.pressed: color.withAlpha(StateLayerToken.pressAlpha),
            WidgetState.dragged: color.withAlpha(StateLayerToken.dragAlpha),
          },
          WidgetState.any: Colors.transparent,
        };
      case ButtonType.toggle:
        final Color? unselected = this.unselected;
        final Color? selected = this.selected;

        map = {
          if (selected != null) ...{
            WidgetState.selected & WidgetState.hovered: selected.withAlpha(
              StateLayerToken.hoverAlpha,
            ),
            WidgetState.selected & WidgetState.focused: selected.withAlpha(
              StateLayerToken.focusAlpha,
            ),
            WidgetState.selected & WidgetState.pressed: selected.withAlpha(
              StateLayerToken.pressAlpha,
            ),
            WidgetState.selected & WidgetState.dragged: selected.withAlpha(
              StateLayerToken.dragAlpha,
            ),
          },
          if (unselected != null) ...{
            WidgetState.hovered: unselected.withAlpha(
              StateLayerToken.hoverAlpha,
            ),
            WidgetState.focused: unselected.withAlpha(
              StateLayerToken.focusAlpha,
            ),
            WidgetState.pressed: unselected.withAlpha(
              StateLayerToken.pressAlpha,
            ),
            WidgetState.dragged: unselected.withAlpha(
              StateLayerToken.dragAlpha,
            ),
          },

          WidgetState.any: Colors.transparent,
        };
    }

    return WidgetStateMapper(map);
  }

  @override
  Color resolve(Set<WidgetState> states) => _mapper.resolve(states);
}

/// Defines foreground colors in enabled and disabled states.
final class ForegroundStateOverlay implements WidgetStateProperty<Color> {
  /// Creates Material 3 foreground interaction state overlay for a default
  /// button.
  const ForegroundStateOverlay({
    required Color this.color,
    Color? disabledColor,
  }) : _type = .button,
       disabledColor = disabledColor ?? color,
       unselected = null,
       selected = null;

  /// Creates Material 3 foreground interaction state overlay for a toggle
  /// button.
  const ForegroundStateOverlay.toggle({
    required Color this.unselected,
    required Color this.selected,
    Color? disabledColor,
  }) : _type = .toggle,
       disabledColor = disabledColor ?? unselected,
       color = null;

  final ButtonType _type;

  /// Overlay color.
  final Color? color;

  /// An optional color for [WidgetState.disabled].
  ///
  /// If null, [color] will be used.
  final Color disabledColor;

  /// Overlay color for unselected toggle buttons.
  final Color? unselected;

  /// Overlay color for selected toggle buttons.
  final Color? selected;

  WidgetStateMapper<Color> get _mapper {
    final Map<WidgetStatesConstraint, Color> map = switch (_type) {
      ButtonType.button => {
        WidgetState.disabled: disabledColor.withAlpha(
          ButtonStateToken.disabledLabelAlpha,
        ),
        WidgetState.any: color!,
      },
      ButtonType.toggle => {
        WidgetState.disabled: disabledColor.withAlpha(
          ButtonStateToken.disabledLabelAlpha,
        ),
        WidgetState.selected: selected!,
        WidgetState.any: unselected!,
      },
    };

    return WidgetStateMapper(map);
  }

  @override
  Color resolve(Set<WidgetState> states) => _mapper.resolve(states);
}

final class BackgroundStateOverlay implements WidgetStateProperty<Color?> {
  /// Creates Material 3 background interaction state overlay for a default
  /// button.
  const BackgroundStateOverlay({
    required Color this.color,
    Color? disabledColor,
  }) : _type = .button,
       disabledColor = disabledColor ?? color,
       unselected = null,
       selected = null;

  /// Creates Material 3 background interaction state overlay for a toggle
  /// button.
  const BackgroundStateOverlay.toggle({
    required Color this.unselected,
    required Color this.selected,
    Color? disabledColor,
  }) : _type = .toggle,
       disabledColor = disabledColor ?? unselected,
       color = null;

  final ButtonType _type;

  /// Overlay color.
  final Color? color;

  /// An optional color for [WidgetState.disabled].
  ///
  /// If null, [color] will be used.
  final Color disabledColor;

  /// Overlay color for unselected toggle buttons.
  final Color? unselected;

  /// Overlay color for selected toggle buttons.
  final Color? selected;

  WidgetStateMapper<Color> get _mapper {
    final Map<WidgetStatesConstraint, Color> map = switch (_type) {
      ButtonType.button => {
        WidgetState.disabled: disabledColor.withAlpha(
          ButtonStateToken.disabledContainerAlpha,
        ),
        WidgetState.any: color!,
      },
      ButtonType.toggle => {
        WidgetState.disabled: disabledColor.withAlpha(
          ButtonStateToken.disabledContainerAlpha,
        ),
        WidgetState.selected: selected!,
        WidgetState.any: unselected!,
      },
    };

    return WidgetStateMapper(map);
  }

  @override
  Color resolve(Set<WidgetState> states) => _mapper.resolve(states);
}
