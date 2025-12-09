import 'package:flutter/material.dart';

import '../src/components/buttons/states.dart';
import 'interaction_states.dart';

/// A helper class that allows creating Material 3 [ButtonStyle]s by
/// using default values from Material 3 [common buttons](https://m3.material.io/components/buttons/overview)
/// guidelines.
///
/// See also:
///
/// * Elevated button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#0eea2a85-b4d7-4c74-b08e-98410b9412c7>
/// * Elevated button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#4e89da4d-a8fa-4e20-bb8d-b8a93eff3e3e>
///
/// * Filled button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#0b1b7bd2-3de8-431a-afa1-d692e2e18b0d>
/// * Filled button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#9ecffdb3-ef29-47e7-8d5d-f78b404fcafe>
///
/// * Outlined button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#de72d8b1-ba16-4cd7-989e-e2ad3293cf63>
/// * Outlined button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#3742b09f-c224-43e0-a83e-541bd29d0f05>
///
/// * Text button Material 3 specs:
/// <https://m3.material.io/components/buttons/specs#899b9107-0127-4a01-8f4c-87f19323a1b4>
/// * Text button Material 3 guidelines:
/// <https://m3.material.io/components/buttons/guidelines#c9bcbc0b-ee05-45ad-8e80-e814ae919fbb>
///
/// * Material 3 buttons accessibility:
/// <https://m3.material.io/components/buttons/accessibility>
final class M3ButtonStyle extends ButtonStyle {
  /// Creates [ButtonStyle] with non [WidgetStateProperty] properties and
  /// Material 3 defaults where possible.
  M3ButtonStyle({
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? selectedColor,
    Color? backgroundSelectedColor,
    Color? disabledColor,
    Color? shadowColor,
    super.elevation,
    EdgeInsetsGeometry padding = M3ButtonStyle.layoutPadding,
    Size minimumSize = const Size(64, 40),
    Size? fixedSize,
    Size maximumSize = Size.infinite,
    super.iconSize = const WidgetStatePropertyAll(18),
    super.iconAlignment,
    OutlineStateOverlay? super.side,
    OutlinedBorder? shape,
    super.mouseCursor,
    MaterialTapTargetSize super.tapTargetSize =
        MaterialTapTargetSize.shrinkWrap,
    super.visualDensity,
    InteractiveInkFeatureFactory super.splashFactory = InkSparkle.splashFactory,
    Duration super.animationDuration = kThemeChangeDuration,
    AlignmentGeometry super.alignment = Alignment.center,
    super.backgroundBuilder,
    super.foregroundBuilder,
  }) : super(
         enableFeedback: true,
         surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
         textStyle: WidgetStatePropertyAll(textStyle),
         backgroundColor: switch ((backgroundColor, backgroundSelectedColor)) {
           (Color color?, null) => BackgroundStateOverlay(
             color: color,
             disabledColor: disabledColor,
           ),
           (Color unselected?, Color selected?) =>
             BackgroundStateOverlay.toggle(
               unselected: unselected,
               selected: selected,
               disabledColor: disabledColor,
             ),
           _ => null,
         },
         foregroundColor: switch ((foregroundColor, selectedColor)) {
           (Color color?, null) => ForegroundStateOverlay(
             color: color,
             disabledColor: disabledColor,
           ),
           (Color unselected?, Color selected?) =>
             ForegroundStateOverlay.toggle(
               unselected: unselected,
               selected: selected,
               disabledColor: disabledColor,
             ),
           _ => null,
         },
         iconColor: switch ((foregroundColor, selectedColor)) {
           (Color color?, null) => ForegroundStateOverlay(
             color: color,
             disabledColor: disabledColor,
           ),
           (Color unselected?, Color selected?) =>
             ForegroundStateOverlay.toggle(
               unselected: unselected,
               selected: selected,
               disabledColor: disabledColor,
             ),
           _ => null,
         },
         overlayColor: switch ((foregroundColor, selectedColor)) {
           (Color color?, null) => InteractionStatesOverlay(color: color),
           (Color unselected?, Color selected?) =>
             InteractionStatesOverlay.toggle(
               unselected: unselected,
               selected: selected,
             ),
           _ => null,
         },
         shadowColor: WidgetStatePropertyAll(shadowColor),
         padding: WidgetStatePropertyAll(padding),
         minimumSize: WidgetStatePropertyAll(minimumSize),
         fixedSize: WidgetStatePropertyAll(fixedSize),
         maximumSize: WidgetStatePropertyAll(maximumSize),
         shape: WidgetStatePropertyAll(shape),
       );

  /// A helper constructor that allows creating Material 3 [ElevatedButton]'s
  /// style by limiting properties to the ones that are used in Material 3
  /// styled [ElevatedButton].
  ///
  /// See also:
  ///
  /// * [ElevatedButton.styleFrom], a static convenience method that constructs
  /// an elevated button [ButtonStyle] given simple values.
  /// * Elevated button Material 3 specs:
  /// <https://m3.material.io/components/buttons/specs#0eea2a85-b4d7-4c74-b08e-98410b9412c7>
  /// * Elevated button Material 3 guidelines:
  /// <https://m3.material.io/components/buttons/guidelines#4e89da4d-a8fa-4e20-bb8d-b8a93eff3e3e>
  /// * Material 3 buttons accessibility:
  /// <https://m3.material.io/components/buttons/accessibility>
  factory M3ButtonStyle.elevated({
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? selectedColor,
    Color? backgroundSelectedColor,
    Color? disabledColor,
    Color? shadowColor,
    WidgetStateProperty<double>? elevation,
    EdgeInsetsGeometry padding = M3ButtonStyle.layoutPadding,
    Size minimumSize = const Size(64, 40),
    Size? fixedSize,
    Size maximumSize = Size.infinite,
    OutlineStateOverlay? side,
    OutlinedBorder? shape,
    WidgetStateProperty<MouseCursor>? mouseCursor,
    MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.shrinkWrap,
    VisualDensity? visualDensity,
    InteractiveInkFeatureFactory splashFactory = InkSparkle.splashFactory,
    WidgetStatePropertyAll<double> iconSize = const WidgetStatePropertyAll(18),
    IconAlignment? iconAlignment,
    Duration animationDuration = kThemeChangeDuration,
    AlignmentGeometry alignment = Alignment.center,
    ButtonLayerBuilder? backgroundBuilder,
    ButtonLayerBuilder? foregroundBuilder,
  }) => M3ButtonStyle(
    textStyle: textStyle,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    selectedColor: selectedColor,
    backgroundSelectedColor: backgroundSelectedColor,
    disabledColor: disabledColor,
    shadowColor: shadowColor,
    elevation: elevation,
    padding: padding,
    minimumSize: minimumSize,
    fixedSize: fixedSize,
    maximumSize: maximumSize,
    iconSize: iconSize,
    iconAlignment: iconAlignment,
    side: side,
    shape: shape,
    mouseCursor: mouseCursor,
    visualDensity: visualDensity,
    tapTargetSize: tapTargetSize,
    animationDuration: animationDuration,
    alignment: alignment,
    splashFactory: splashFactory,
    backgroundBuilder: backgroundBuilder,
    foregroundBuilder: foregroundBuilder,
  );

  /// A helper constructor that allows creating Material 3 [FilledButton]'s
  /// style by limiting properties to the ones that are used in Material 3
  /// styled [FilledButton].
  ///
  /// See also:
  ///
  /// * [FilledButton.styleFrom], a static convenience method that constructs a
  /// filled button [ButtonStyle] given simple values.
  /// * Filled button Material 3 specs:
  /// <https://m3.material.io/components/buttons/specs#0b1b7bd2-3de8-431a-afa1-d692e2e18b0d>
  /// * Filled button Material 3 guidelines:
  /// <https://m3.material.io/components/buttons/guidelines#9ecffdb3-ef29-47e7-8d5d-f78b404fcafe>
  /// * Material 3 buttons accessibility:
  /// <https://m3.material.io/components/buttons/accessibility>
  factory M3ButtonStyle.filled({
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? selectedColor,
    Color? backgroundSelectedColor,
    Color? disabledColor,
    Color? shadowColor,
    WidgetStateProperty<double>? elevation,
    EdgeInsetsGeometry padding = M3ButtonStyle.layoutPadding,
    Size minimumSize = const Size(64, 40),
    Size? fixedSize,
    Size maximumSize = Size.infinite,
    OutlineStateOverlay? side,
    OutlinedBorder? shape,
    WidgetStateProperty<MouseCursor>? mouseCursor,
    MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.shrinkWrap,
    VisualDensity? visualDensity,
    InteractiveInkFeatureFactory splashFactory = InkSparkle.splashFactory,
    WidgetStatePropertyAll<double> iconSize = const WidgetStatePropertyAll(18),
    IconAlignment? iconAlignment,
    Duration animationDuration = kThemeChangeDuration,
    AlignmentGeometry alignment = Alignment.center,
    ButtonLayerBuilder? backgroundBuilder,
    ButtonLayerBuilder? foregroundBuilder,
  }) => M3ButtonStyle(
    textStyle: textStyle,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    selectedColor: selectedColor,
    backgroundSelectedColor: backgroundSelectedColor,
    disabledColor: disabledColor,
    shadowColor: shadowColor,
    elevation: elevation,
    padding: padding,
    minimumSize: minimumSize,
    fixedSize: fixedSize,
    maximumSize: maximumSize,
    iconSize: iconSize,
    iconAlignment: iconAlignment,
    side: side,
    shape: shape,
    mouseCursor: mouseCursor,
    visualDensity: visualDensity,
    tapTargetSize: tapTargetSize,
    animationDuration: animationDuration,
    alignment: alignment,
    splashFactory: splashFactory,
    backgroundBuilder: backgroundBuilder,
    foregroundBuilder: foregroundBuilder,
  );

  /// A helper constructor that allows creating Material 3 [OutlinedButton]'s
  /// style by limiting properties to the ones that are used in Material 3
  /// styled [OutlinedButton].
  ///
  /// See also:
  ///
  /// * [OutlinedButton.styleFrom], a static convenience method that constructs
  /// an outlined button [ButtonStyle] given simple values.
  /// * Outlined button Material 3 specs:
  /// <https://m3.material.io/components/buttons/specs#de72d8b1-ba16-4cd7-989e-e2ad3293cf63>
  /// * Outlined button Material 3 guidelines:
  /// <https://m3.material.io/components/buttons/guidelines#3742b09f-c224-43e0-a83e-541bd29d0f05>
  /// * Material 3 buttons accessibility:
  /// <https://m3.material.io/components/buttons/accessibility>
  factory M3ButtonStyle.outlined({
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? selectedColor,
    Color? backgroundSelectedColor,
    Color? disabledColor,
    Color? shadowColor,
    WidgetStateProperty<double>? elevation,
    EdgeInsetsGeometry padding = M3ButtonStyle.layoutPadding,
    Size minimumSize = const Size(64, 40),
    Size? fixedSize,
    Size maximumSize = Size.infinite,
    OutlineStateOverlay? side,
    OutlinedBorder? shape,
    WidgetStateProperty<MouseCursor>? mouseCursor,
    MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.shrinkWrap,
    VisualDensity? visualDensity,
    InteractiveInkFeatureFactory splashFactory = InkSparkle.splashFactory,
    WidgetStatePropertyAll<double> iconSize = const WidgetStatePropertyAll(18),
    IconAlignment? iconAlignment,
    Duration animationDuration = kThemeChangeDuration,
    AlignmentGeometry alignment = Alignment.center,
    ButtonLayerBuilder? backgroundBuilder,
    ButtonLayerBuilder? foregroundBuilder,
  }) => M3ButtonStyle(
    textStyle: textStyle,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    selectedColor: selectedColor,
    backgroundSelectedColor: backgroundSelectedColor,
    disabledColor: disabledColor,
    shadowColor: shadowColor,
    elevation: elevation,
    padding: padding,
    minimumSize: minimumSize,
    fixedSize: fixedSize,
    maximumSize: maximumSize,
    iconSize: iconSize,
    iconAlignment: iconAlignment,
    side: side,
    shape: shape,
    mouseCursor: mouseCursor,
    visualDensity: visualDensity,
    tapTargetSize: tapTargetSize,
    animationDuration: animationDuration,
    alignment: alignment,
    splashFactory: splashFactory,
    backgroundBuilder: backgroundBuilder,
    foregroundBuilder: foregroundBuilder,
  );

  /// A helper constructor that allows creating Material 3 [TextButton]'s
  /// style by limiting properties to the ones that are used in Material 3
  /// styled [TextButton].
  ///
  /// See also:
  ///
  /// * [TextButton.styleFrom], a static convenience method that constructs a
  /// text button [ButtonStyle] given simple values.
  /// * Text button Material 3 specs:
  /// <https://m3.material.io/components/buttons/specs#899b9107-0127-4a01-8f4c-87f19323a1b4>
  /// * Text button Material 3 guidelines:
  /// <https://m3.material.io/components/buttons/guidelines#c9bcbc0b-ee05-45ad-8e80-e814ae919fbb>
  /// * Material 3 buttons accessibility:
  /// <https://m3.material.io/components/buttons/accessibility>
  factory M3ButtonStyle.text({
    TextStyle? textStyle,
    Color? foregroundColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? shadowColor,
    WidgetStateProperty<double>? elevation,
    EdgeInsetsGeometry padding = M3ButtonStyle.textButtonLayoutPadding,
    Size minimumSize = const Size(64, 40),
    Size? fixedSize,
    Size maximumSize = Size.infinite,
    OutlineStateOverlay? side,
    OutlinedBorder? shape,
    WidgetStateProperty<MouseCursor>? mouseCursor,
    MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.shrinkWrap,
    VisualDensity? visualDensity,
    InteractiveInkFeatureFactory splashFactory = InkSparkle.splashFactory,
    WidgetStatePropertyAll<double> iconSize = const WidgetStatePropertyAll(18),
    IconAlignment? iconAlignment,
    Duration animationDuration = kThemeChangeDuration,
    AlignmentGeometry alignment = Alignment.center,
    ButtonLayerBuilder? backgroundBuilder,
    ButtonLayerBuilder? foregroundBuilder,
  }) => M3ButtonStyle(
    textStyle: textStyle,
    foregroundColor: foregroundColor,
    selectedColor: selectedColor,
    disabledColor: disabledColor,
    shadowColor: shadowColor,
    elevation: elevation,
    padding: padding,
    minimumSize: minimumSize,
    fixedSize: fixedSize,
    maximumSize: maximumSize,
    iconSize: iconSize,
    iconAlignment: iconAlignment,
    side: side,
    shape: shape,
    mouseCursor: mouseCursor,
    visualDensity: visualDensity,
    tapTargetSize: tapTargetSize,
    animationDuration: animationDuration,
    alignment: alignment,
    splashFactory: splashFactory,
    backgroundBuilder: backgroundBuilder,
    foregroundBuilder: foregroundBuilder,
  );

  /// Padding values for [ElevatedButton], [FilledButton] and [OutlinedButton].
  ///
  /// Taken from:
  ///
  /// * [ElevatedButton] - <https://m3.material.io/components/buttons/specs#1f1b4b99-9a1c-4f7e-b713-e9c286c771e0>;
  /// * [FilledButton] - <https://m3.material.io/components/buttons/specs#0697c92a-54ba-4921-b28a-0f4abeea0a85>;
  /// * [OutlinedButton] - <https://m3.material.io/components/buttons/specs#a3fc4f33-447f-45e0-93a8-35d538e0faa6>
  static const layoutPadding = EdgeInsets.symmetric(horizontal: 24);

  /// Padding values for [ElevatedButton.icon], [FilledButton.icon] and
  /// [OutlinedButton.icon].
  ///
  /// Taken from:
  ///
  /// * [ElevatedButton] - <https://m3.material.io/components/buttons/specs#1f1b4b99-9a1c-4f7e-b713-e9c286c771e0>;
  /// * [FilledButton] - <https://m3.material.io/components/buttons/specs#0697c92a-54ba-4921-b28a-0f4abeea0a85>;
  /// * [OutlinedButton] - <https://m3.material.io/components/buttons/specs#a3fc4f33-447f-45e0-93a8-35d538e0faa6>
  static const iconLayoutPadding = EdgeInsets.only(left: 16, right: 24);

  /// Padding values for [TextButton] taken from
  /// <https://m3.material.io/components/buttons/specs#bff80ee9-28fb-41a0-a671-0ab29ffc04d5>
  static const textButtonLayoutPadding = EdgeInsets.symmetric(horizontal: 12);

  /// Padding values for [TextButton.icon] taken from
  /// <https://m3.material.io/components/buttons/specs#bff80ee9-28fb-41a0-a671-0ab29ffc04d5>
  static const textButtonIconLayoutPadding = EdgeInsets.only(
    left: 12,
    right: 16,
  );

  /// Helper method used to scale [M3ButtonStyle].**Padding values.
  static EdgeInsetsGeometry scaledPaddingOf(
    BuildContext context,
    EdgeInsets padding,
  ) {
    const kFontSize = 14.0;
    final TextTheme theme = Theme.of(context).textTheme;
    final double defaultFontSize = theme.labelLarge?.fontSize ?? kFontSize;
    final double effectiveTextScale =
        MediaQuery.textScalerOf(context).scale(defaultFontSize) / kFontSize;

    return ButtonStyleButton.scaledPadding(
      padding,
      EdgeInsets.only(left: padding.left / 2, right: padding.right / 2),
      EdgeInsets.only(left: padding.left / 2 / 2, right: padding.right / 2 / 2),
      effectiveTextScale,
    );
  }
}
