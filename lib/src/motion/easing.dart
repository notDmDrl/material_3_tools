import 'package:flutter/animation.dart';

/// [Curve] constants which represent Material 3 [easing](https://m3.material.io/styles/motion/overview).
///
/// See also:
///
/// * Material 3 specification for easing:
/// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs>
abstract final class MaterialEasing {
  /// [Linear](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#6341c2bf-54a0-4260-8ec7-6173926709a3)
  static const Curve linear = Cubic(0, 0, 1, 1);

  /// [Standard](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#7e37d374-0c1b-4007-8187-6f29bb1fb3e7)
  static const Curve standard = Cubic(0.2, 0, 0, 1);

  /// [Standard decelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#7e37d374-0c1b-4007-8187-6f29bb1fb3e7)
  static const Curve standardDecelerate = Cubic(0, 0, 0, 1);

  /// [Standard accelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#7e37d374-0c1b-4007-8187-6f29bb1fb3e7)
  static const Curve standardAccelerate = Cubic(0.3, 0, 1, 1);

  /// [Emphasized](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#cbea5c6e-7b0d-47a0-98c3-767080a38d95)
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;

  /// [Emphasized decelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#cbea5c6e-7b0d-47a0-98c3-767080a38d95)
  static const Curve emphasizedDecelerate = Cubic(0.05, 0.7, 0.1, 1);

  /// [Emphasized accelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#cbea5c6e-7b0d-47a0-98c3-767080a38d95)
  static const Curve emphasizedAccelerate = Cubic(0.3, 0, 0.8, 0.15);

  /// [Legacy standard](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#6341c2bf-54a0-4260-8ec7-6173926709a3)
  static const Curve legacy = Curves.fastOutSlowIn;

  /// [Legacy standard decelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#6341c2bf-54a0-4260-8ec7-6173926709a3)
  static const Curve legacyDecelerate = Cubic(0, 0, 0.2, 1);

  /// [Legacy standard accelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#6341c2bf-54a0-4260-8ec7-6173926709a3)
  static const Curve legacyAccelerate = Cubic(0.4, 0, 1, 1);
}
