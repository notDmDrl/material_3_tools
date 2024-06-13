import 'package:flutter/material.dart';

import '../../material_3_tools.dart';

/// A helper class that allows creating Material 3 [ButtonStyle] without
/// providing [BuildContext] for accessing [ColorScheme] via
/// `Theme.of(context).colorScheme` while also using values from Material 3
/// [common buttons](https://m3.material.io/components/buttons/overview)
/// guidelines.
///
/// [M3ButtonStyle] is best suited for situations when your app has custom
/// design which is not compatible with Material 3 color system (ex. color
/// scheme generated by [ColorScheme.fromSeed] generates colors that are too
/// different from your own design system) but you still want to use Material 3
/// buttons design.
///
/// While more verbose than [ButtonStyle] it allows much more easily
/// create const [ButtonStyle] thanks to replacing [WidgetStateProperty] with
/// corresponding type in each [ButtonStyle]'s [WidgetStateProperty] property.
///
/// See also:
///
/// * [ElevatedButton.styleFrom], a static convenience method that constructs a
/// outlined button [ButtonStyle] given simple values.
/// * Elevated button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#0eea2a85-b4d7-4c74-b08e-98410b9412c7>
/// * Elevated button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#4e89da4d-a8fa-4e20-bb8d-b8a93eff3e3e>
///
/// * [FilledButton.styleFrom], a static convenience method that constructs a
/// outlined button [ButtonStyle] given simple values.
/// * Filled button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#0b1b7bd2-3de8-431a-afa1-d692e2e18b0d>
/// * Filled button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#9ecffdb3-ef29-47e7-8d5d-f78b404fcafe>
///
/// * [OutlinedButton.styleFrom], a static convenience method that constructs a
/// outlined button [ButtonStyle] given simple values.
/// * Outlined button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#de72d8b1-ba16-4cd7-989e-e2ad3293cf63>
/// * Outlined button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#3742b09f-c224-43e0-a83e-541bd29d0f05>
///
/// * [TextButton.styleFrom], a static convenience method that constructs a
/// text button [ButtonStyle] given simple values.
/// * Text button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#899b9107-0127-4a01-8f4c-87f19323a1b4>
/// * Text button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#c9bcbc0b-ee05-45ad-8e80-e814ae919fbb>
///
/// * Material 3 buttons accessibility:
/// <https://m3.material.io/components/buttons/accessibility>
@immutable
base class M3ButtonStyle extends ButtonStyle {
  /// Creates [ButtonStyle] with non [WidgetStateProperty] properties and
  /// Material 3 defaults where possible.
  const M3ButtonStyle({
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledColor,
    Color? shadowColor,
    super.elevation,
    EdgeInsetsGeometry? padding,
    Size? minimumSize = const Size(64, 40),
    Size? fixedSize,
    Size? maximumSize = Size.infinite,
    OutlineStateOverlay? super.side,
    OutlinedBorder? shape,
    MouseCursor? mouseCursor,
    super.tapTargetSize = MaterialTapTargetSize.shrinkWrap,
    super.visualDensity,
    super.splashFactory = InkSparkle.splashFactory,
  })  : _textStyle = textStyle,
        _foregroundColor = foregroundColor,
        _disabledColor = disabledColor,
        _backgroundColor = backgroundColor,
        _shadowColor = shadowColor,
        _padding = padding,
        _minimumSize = minimumSize,
        _fixedSize = fixedSize,
        _shape = shape,
        _maximumSize = maximumSize,
        _mouseCursor = mouseCursor,
        super(
          animationDuration: kThemeChangeDuration,
          enableFeedback: true,
          alignment: Alignment.center,
          surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        );

  /// Padding values for [ElevatedButton], [FilledButton] and [OutlinedButton].
  ///
  /// Taken from:
  ///
  /// * [ElevatedButton] - <https://m3.material.io/components/buttons/specs#1f1b4b99-9a1c-4f7e-b713-e9c286c771e0>;
  /// * [FilledButton] - <https://m3.material.io/components/buttons/specs#0697c92a-54ba-4921-b28a-0f4abeea0a85>;
  /// * [OutlinedButton] - <https://m3.material.io/components/buttons/specs#a3fc4f33-447f-45e0-93a8-35d538e0faa6>
  static const EdgeInsets layoutPadding = EdgeInsets.symmetric(horizontal: 24);

  /// Padding values for [ElevatedButton.icon], [FilledButton.icon] and
  /// [OutlinedButton.icon].
  ///
  /// Taken from:
  ///
  /// * [ElevatedButton] - <https://m3.material.io/components/buttons/specs#1f1b4b99-9a1c-4f7e-b713-e9c286c771e0>;
  /// * [FilledButton] - <https://m3.material.io/components/buttons/specs#0697c92a-54ba-4921-b28a-0f4abeea0a85>;
  /// * [OutlinedButton] - <https://m3.material.io/components/buttons/specs#a3fc4f33-447f-45e0-93a8-35d538e0faa6>
  static const EdgeInsets iconLayoutPadding =
      EdgeInsets.only(left: 16, right: 24);

  /// Padding values for [TextButton] taken from
  /// <https://m3.material.io/components/buttons/specs#bff80ee9-28fb-41a0-a671-0ab29ffc04d5>
  static const EdgeInsets textButtonLayoutPadding =
      EdgeInsets.symmetric(horizontal: 12);

  /// Padding values for [TextButton.icon] taken from
  /// <https://m3.material.io/components/buttons/specs#bff80ee9-28fb-41a0-a671-0ab29ffc04d5>
  static const EdgeInsets textButtonIconLayoutPadding =
      EdgeInsets.only(left: 12, right: 16);

  // Private fields for creating [ButtonStyleButton.allOrNull].
  final TextStyle? _textStyle;
  final Color? _foregroundColor;
  final Color? _disabledColor;
  final Color? _backgroundColor;
  final Color? _shadowColor;
  final EdgeInsetsGeometry? _padding;
  final Size? _minimumSize;
  final Size? _fixedSize;
  final Size? _maximumSize;
  final OutlinedBorder? _shape;
  final MouseCursor? _mouseCursor;

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      ButtonStyleButton.allOrNull(_textStyle);

  @override
  WidgetStateProperty<Color?>? get backgroundColor => this is M3TextButtonStyle
      ? null
      : BackgroundStateOverlay(
          color: _backgroundColor,
          disabledColor: _disabledColor,
        );

  @override
  WidgetStateProperty<Color?>? get foregroundColor => ForegroundStateOverlay(
        color: _foregroundColor,
        disabledColor: _disabledColor,
      );

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      InteractionStatesOverlay(_foregroundColor);

  @override
  WidgetStateProperty<Color?>? get shadowColor =>
      ButtonStyleButton.allOrNull(_shadowColor);

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      ButtonStyleButton.allOrNull(_padding);

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      ButtonStyleButton.allOrNull(_minimumSize);

  @override
  WidgetStateProperty<Size?>? get fixedSize =>
      ButtonStyleButton.allOrNull(_fixedSize);

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      ButtonStyleButton.allOrNull(_maximumSize);

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      ButtonStyleButton.allOrNull(_shape);

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      ButtonStyleButton.allOrNull(_mouseCursor);
}
