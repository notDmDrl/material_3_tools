import 'package:flutter/material.dart';

import '../interaction_states.dart';
import 'elevated_button.dart';

/// A helper class that allows creating Material 3 [ButtonStyle] for
/// `FilledButton` which is not present in the Flutter.
///
/// It is made in similar way as the `_TokenDefaultsM3` for [TextButton],
/// [ElevatedButton] or [OutlinedButton].
///
/// It is also possible to create custom, non [ColorScheme] dependent version
/// using [M3ElevatedButtonStyle] by providing needed color values as well as
/// setting [M3ElevatedButtonStyle] `isFilled` to **true** (this allows button
/// to use `FilledButton` elevation states).
///
/// See also:
///
/// * [M3ElevatedButtonStyle], for creating custom `FilledButton` styles.
/// * Filled button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#0b1b7bd2-3de8-431a-afa1-d692e2e18b0d>
/// * Filled button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#9ecffdb3-ef29-47e7-8d5d-f78b404fcafe>
/// * Material 3 buttons accessibility:
/// <https://m3.material.io/components/buttons/accessibility>
@immutable
class FilledButtonTokenDefaults extends ButtonStyle {
  /// Creates [ButtonStyle] for `FilledButton` from [ColorScheme]
  FilledButtonTokenDefaults(this.context)
      : super(
          animationDuration: kThemeChangeDuration,
          enableFeedback: true,
          alignment: Alignment.center,
          elevation: const MaterialStatePropertyAll(0),
          minimumSize: const MaterialStatePropertyAll(Size(64, 40)),
          maximumSize: const MaterialStatePropertyAll(Size.infinite),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
        );

  /// Build context required for getting [_colors];
  final BuildContext context;

  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  MaterialStateProperty<TextStyle?> get textStyle =>
      MaterialStatePropertyAll<TextStyle?>(
        Theme.of(context).textTheme.labelLarge,
      );

  @override
  MaterialStateProperty<Color?>? get backgroundColor => BackgroundStateOverlay(
        color: _colors.primary,
        disabledColor: _colors.onSurface,
      );

  @override
  MaterialStateProperty<Color?>? get foregroundColor => ForegroundStateOverlay(
        color: _colors.onPrimary,
        disabledColor: _colors.onSurface,
      );

  @override
  MaterialStateProperty<Color?>? get overlayColor =>
      InteractionStatesOverlay(_colors.primary);

  // No default surfaceTint

  @override
  MaterialStateProperty<Color>? get shadowColor =>
      ButtonStyleButton.allOrNull<Color>(_colors.shadow);

  /// Reuse padding settings from [ElevatedButton].
  ///
  /// Note those values are not correct compared to Material 3 specs.
  ///
  /// Consider overriding this value in `style` property with
  /// [M3ElevatedButtonStyle.layoutPadding] or
  /// [M3ElevatedButtonStyle.iconLayoutPadding] which are exactly same as
  /// padding values for `FilledButton` from
  /// <https://m3.material.io/components/buttons/specs#0697c92a-54ba-4921-b28a-0f4abeea0a85>
  @override
  MaterialStateProperty<EdgeInsetsGeometry?>? get padding =>
      Theme.of(context).elevatedButtonTheme.style?.padding;

  @override
  MaterialStateProperty<MouseCursor?>? get mouseCursor =>
      MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      });

  @override
  VisualDensity? get visualDensity => Theme.of(context).visualDensity;

  @override
  MaterialTapTargetSize? get tapTargetSize =>
      Theme.of(context).materialTapTargetSize;

  @override
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(context).splashFactory;
}
