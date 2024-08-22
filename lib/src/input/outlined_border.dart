import 'package:flutter/material.dart';

import '../shape.dart';

/// Draws a rounded rectangle around an [InputDecorator]'s container.
///
/// When the input decorator's label is floating, for example because its input
/// child has the focus, the label appears inside the border outline.
///
/// The input decorator's "container" is the optionally filled area above the
/// decorator's helper, error, and counter.
///
/// This [InputBorder] is a mix of [OutlineInputBorder] and
/// [UnderlineInputBorder] features - a fully rounded input border with the
/// label being placed inside of input decorator's container.
///
/// See also:
///
/// * [OutlineInputBorder], an [InputDecorator] border which draws a rounded
/// rectangle around the input decorator's container.
/// * [UnderlineInputBorder], the default [InputDecorator] border which draws a
/// horizontal line at the bottom of the input decorator's container.
/// * [InputDecoration], which is used to configure an [InputDecorator].
@immutable
class OutlinedInputBorder extends InputBorder {
  /// Creates a rounded rectangle outline border for an [InputDecorator].
  ///
  /// If the [borderSide] parameter is [BorderSide.none], it will not draw a
  /// border. However, it will still define a shape (which you can see if
  /// [InputDecoration.filled] is true).
  ///
  /// If an application does not specify a [borderSide] parameter of
  /// value [BorderSide.none], the input decorator substitutes its own, using
  /// [copyWith], based on the current theme and [InputDecorator.isFocused].
  ///
  /// The [borderRadius] parameter defaults to a value where all four corners
  /// have a circular radius of 4.0. The corner radii must be circular, i.e.
  /// their [Radius.x] and [Radius.y] values must be the same.
  const OutlinedInputBorder({
    super.borderSide = BorderSide.none,
    this.borderRadius = Shapes.large,
  });

  /// The radii of the border's rounded rectangle corners.
  ///
  /// The corner radii must be circular, i.e. their [Radius.x] and [Radius.y]
  /// values must be the same.
  final BorderRadius borderRadius;

  static bool _cornersAreCircular(BorderRadius borderRadius) =>
      borderRadius.topLeft.x == borderRadius.topLeft.y &&
      borderRadius.bottomLeft.x == borderRadius.bottomLeft.y &&
      borderRadius.topRight.x == borderRadius.topRight.y &&
      borderRadius.bottomRight.x == borderRadius.bottomRight.y;

  @override
  bool get isOutline => false;

  @override
  OutlinedInputBorder copyWith({
    BorderSide? borderSide,
    BorderRadius? borderRadius,
  }) => OutlinedInputBorder(
    borderSide: borderSide ?? this.borderSide,
    borderRadius: borderRadius ?? this.borderRadius,
  );

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderSide.width);

  @override
  OutlinedInputBorder scale(double t) => OutlinedInputBorder(
    borderSide: borderSide.scale(t),
    borderRadius: borderRadius * t,
  );

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) =>
      a is OutlinedInputBorder
          ? OutlinedInputBorder(
            borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
            borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
          )
          : super.lerpFrom(a, t);

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) =>
      b is OutlinedInputBorder
          ? OutlinedInputBorder(
            borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
            borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
          )
          : super.lerpTo(b, t);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      Path()..addRRect(
        borderRadius
            .resolve(textDirection)
            .toRRect(rect)
            .deflate(borderSide.width),
      );

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    assert(gapPercentage >= 0.0 && gapPercentage <= 1.0, '');
    assert(_cornersAreCircular(borderRadius), '');

    final paint = borderSide.toPaint();
    final outer = borderRadius.toRRect(rect);
    final center = outer.deflate(borderSide.width / 2.0);

    canvas.drawRRect(center, paint);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is OutlinedInputBorder &&
        other.borderSide == borderSide &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => Object.hash(borderSide, borderRadius);
}
