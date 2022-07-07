import 'package:flutter/material.dart';

import '../interaction_states.dart';
import 'elevated_button.dart';

/// A helper class that allows creating Material 3 [ButtonStyle] for
/// `FilledTonalButton` which is not present in the Flutter.
///
/// It is made in similar way as the `_TokenDefaultsM3` for [TextButton],
/// [ElevatedButton] or [OutlinedButton].
///
/// It is also possible to create custom, non [ColorScheme] dependent version
/// using [M3ElevatedButtonStyle] by providing needed color values as well as
/// setting [M3ElevatedButtonStyle] `isFilled` to **true** (this allows button
/// to use `FilledTonalButton` elevation states).
///
/// See also:
///
/// * [M3ElevatedButtonStyle], for creating custom `FilledTonalButton` styles.
/// * Filled button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#158f0a18-67fb-4ac4-9d22-cc4d1adc4579>
/// * Filled button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#07a1577b-aaf5-4824-a698-03526421058b>
/// * Material 3 buttons accessibility:
/// <https://m3.material.io/components/buttons/accessibility>
@immutable
class FillTonalButtonTokenDefaults extends ButtonStyle {
  /// Creates [ButtonStyle] for `FilledTonalButton` from [ColorScheme]
  FillTonalButtonTokenDefaults(this.context)
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
        color: _colors.secondaryContainer,
        disabledColor: _colors.onSurface,
      );

  @override
  MaterialStateProperty<Color?>? get foregroundColor => ForegroundStateOverlay(
        color: _colors.onSecondaryContainer,
        disabledColor: _colors.onSurface,
      );

  @override
  MaterialStateProperty<Color?>? get overlayColor =>
      InteractionStatesOverlay(_colors.onSecondaryContainer);

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
  /// padding values for `FilledTonalButton` from
  /// <https://m3.material.io/components/buttons/specs#f3391512-7a43-4c11-ad46-4cc1c6fee905>
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
