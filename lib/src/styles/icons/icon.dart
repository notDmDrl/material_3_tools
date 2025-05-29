/// @docImport 'package:flutter/material.dart';
/// @docImport 'package:flutter/rendering.dart';
library;

import 'package:flutter/widgets.dart';

import 'icon_grade.dart';
import 'optical_size.dart';

/// A copy of [Icon] with some M3 defaults used.
@immutable
class M3Icon extends StatelessWidget {
  /// Creates a M3 styled [Icon].
  const M3Icon(
    this.icon, {
    super.key,
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    this.semanticLabel,
    this.textDirection,
    this.applyTextScaling,
    this.blendMode,
  });

  /// The icon to display. The available icons are described in [Icons].
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  final IconData? icon;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.size]. If that is
  /// `null`, defaults to 24.
  ///
  /// If this [Icon] is being placed inside an [IconButton], then use
  /// [IconButton.iconSize] instead, so that the [IconButton] can make the splash
  /// area the appropriate size as well. The [IconButton] uses an [IconTheme] to
  /// pass down the size to the [Icon].
  ///
  /// See also:
  ///
  /// * [Icon.size].
  /// * [IconOpticalSize], default Material 3 optical sizes.
  final double? size;

  /// The fill for drawing the icon.
  ///
  /// Requires the underlying icon font to support the `FILL` [FontVariation]
  /// axis, otherwise has no effect. Variable font filenames often indicate
  /// the supported axes. Must be between 0.0 (unfilled) and 1.0 (filled),
  /// inclusive.
  ///
  /// Can be used to convey a state transition for animation or interaction.
  ///
  /// Defaults to nearest [IconTheme]'s [IconThemeData.fill].
  ///
  /// See also:
  ///
  /// * [weight], for controlling stroke weight.
  /// * [grade], for controlling stroke weight in a more granular way.
  /// * [opticalSize], for controlling optical size.
  /// * [Icon.fill].
  final double? fill;

  /// The stroke weight for drawing the icon.
  ///
  /// Requires the underlying icon font to support the `wght` [FontVariation]
  /// axis, otherwise has no effect. Variable font filenames often indicate
  /// the supported axes. Must be greater than 0.
  ///
  /// Defaults to nearest [IconTheme]'s [IconThemeData.weight].
  ///
  /// See also:
  ///
  /// * [fill], for controlling fill.
  /// * [grade], for controlling stroke weight in a more granular way.
  /// * [opticalSize], for controlling optical size.
  /// * https://fonts.google.com/knowledge/glossary/weight_axis
  /// * [Icon.weight].
  final double? weight;

  /// The grade (granular stroke weight) for drawing the icon.
  ///
  /// Requires the underlying icon font to support the `GRAD` [FontVariation]
  /// axis, otherwise has no effect. Variable font filenames often indicate
  /// the supported axes. Can be negative.
  ///
  /// Grade and [weight] both affect a symbol's stroke weight (thickness), but
  /// grade has a smaller impact on the size of the symbol.
  ///
  /// Grade is also available in some text fonts. One can match grade levels
  /// between text and symbols for a harmonious visual effect. For example, if
  /// the text font has a -25 grade value, the symbols can match it with a
  /// suitable value, say -25.
  ///
  /// Defaults to nearest [IconTheme]'s [IconThemeData.grade].
  /// If that is `null`, defaults to nearest [ThemeData]'s [IconGrade.of].
  ///
  /// See also:
  ///
  /// * [fill], for controlling fill.
  /// * [weight], for controlling stroke weight in a less granular way.
  /// * [opticalSize], for controlling optical size.
  /// * https://fonts.google.com/knowledge/glossary/grade_axis
  /// * [Icon.grade].
  final double? grade;

  /// The optical size for drawing the icon.
  ///
  /// Requires the underlying icon font to support the `opsz` [FontVariation]
  /// axis, otherwise has no effect. Variable font filenames often indicate
  /// the supported axes. Must be greater than 0.
  ///
  /// For an icon to look the same at different sizes, the stroke weight
  /// (thickness) must change as the icon size scales. Optical size offers a way
  /// to automatically adjust the stroke weight as icon size changes.
  ///
  /// Defaults to resolved icon size.
  ///
  /// See also:
  ///
  /// * [fill], for controlling fill.
  /// * [weight], for controlling stroke weight.
  /// * [grade], for controlling stroke weight in a more granular way.
  /// * https://fonts.google.com/knowledge/glossary/optical_size_axis
  /// * [Icon.opticalSize].
  /// * [IconOpticalSize], default Material 3 optical sizes.
  final double? opticalSize;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.color].
  ///
  /// The color (whether specified explicitly here or obtained from the
  /// [IconTheme]) will be further adjusted by the nearest [IconTheme]'s
  /// [IconThemeData.opacity].
  ///
  /// See also:
  ///
  /// * [Icon.color].
  final Color? color;

  /// Semantic label for the icon.
  ///
  /// Announced by assistive technologies (e.g TalkBack/VoiceOver).
  /// This label does not show in the UI.
  ///
  ///  * [SemanticsProperties.label], which is set to [semanticLabel] in the
  ///    underlying [Semantics] widget.
  ///
  /// See also:
  ///
  /// * [Icon.semanticLabel].
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  ///
  /// If this is null, the ambient [Directionality] is used instead.
  ///
  /// Some icons follow the reading direction. For example, "back" buttons point
  /// left in left-to-right environments and right in right-to-left
  /// environments. Such icons have their [IconData.matchTextDirection] field
  /// set to true, and the [Icon] widget uses the [textDirection] to determine
  /// the orientation in which to draw the icon.
  ///
  /// This property has no effect if the [icon]'s [IconData.matchTextDirection]
  /// field is false, but for consistency a text direction value must always be
  /// specified, either directly using this property or using [Directionality].
  ///
  /// See also:
  ///
  /// * [Icon.textDirection].
  final TextDirection? textDirection;

  /// Whether to scale the size of this widget using the ambient
  /// [MediaQuery]'s [TextScaler].
  ///
  /// This is specially useful when you have an icon associated with a text, as
  /// scaling the text without scaling the icon would result in a confusing
  /// interface.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.applyTextScaling].
  ///
  /// See also:
  ///
  /// * [Icon.applyTextScaling].
  final bool? applyTextScaling;

  /// The [BlendMode] to apply to the foreground of the icon.
  ///
  /// Defaults to [BlendMode.srcOver]
  ///
  /// See also:
  ///
  /// * [Icon.blendMode].
  final BlendMode? blendMode;

  /// The default icon size if none is specified.
  ///
  /// See also:
  ///
  /// * [IconOpticalSize], default Material 3 optical sizes.
  static const double kDefaultIconSize = IconOpticalSize.size24;

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconThemeData = IconTheme.of(context);

    final double resolvedSize = size ?? iconThemeData.size ?? kDefaultIconSize;

    return Icon(
      icon,
      size: resolvedSize,
      fill: fill,
      weight: weight,
      grade: grade ?? iconThemeData.grade ?? IconGrade.of(context),
      opticalSize: opticalSize ?? resolvedSize,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
      applyTextScaling: applyTextScaling,
      blendMode: blendMode,
    );
  }
}
