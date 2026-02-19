import 'package:flutter/widgets.dart';

import '/src/styles/motion/physics/curves.dart';
import '/src/styles/motion/physics/spring.dart';
import 'specs/button_color.dart';
import 'specs/button_size.dart';

/// Types of buttons in Material 3 [button component specs](https://m3.material.io/components/buttons/specs)
///
/// ![](https://lh3.googleusercontent.com/7Vjp5irga3GlT0U-h7e6hfX3rYr5Fqtky_CurQoMYy7XUy-jCESxyo2yudjXddnaRc72DJksLjQDkwYNClrgJkMNbTaZz5GD2jQFJbu3A6wk=s0)
enum ButtonType {
  /// The default button type.
  button,

  /// The toggle (selection) button type.
  toggle,
}

/// Types of button shapes in Material 3 [button component specs](https://m3.material.io/components/buttons/specs)
enum ButtonShape {
  /// Fully rounded button shape.
  round,

  /// More "squared" button shape.
  square,
}

@immutable
final class ButtonConfiguration {
  const ButtonConfiguration({
    required this.size,
    required this.shape,
    required this.color,
  });

  final ButtonSize size;
  final ButtonShape shape;
  final ButtonColor color;

  // are the same for every size
  static const SpringDescription spring = MotionPhysicsSpring.standardFast;
  static const MotionPhysicsCurvePair curve = MotionPhysicsCurve.standardFast;

  ButtonConfiguration copyWith({
    ButtonSize? size,
    ButtonShape? shape,
    ButtonColor? color,
  }) => ButtonConfiguration(
    size: size ?? this.size,
    shape: shape ?? this.shape,
    color: color ?? this.color,
  );

  @override
  int get hashCode => Object.hash(size, shape, color);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! ButtonConfiguration) {
      return false;
    }

    return other.size == size && other.shape == shape && other.color == color;
  }
}
