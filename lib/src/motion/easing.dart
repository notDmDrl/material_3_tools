import 'package:flutter/material.dart';

/// [Curve] constants which represent Material 3 [easing](https://m3.material.io/styles/motion/overview).
///
/// See also:
///
/// * Material 3 specification for easing:
/// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs>
abstract final class MaterialEasing {
  /// [Linear](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#6341c2bf-54a0-4260-8ec7-6173926709a3)
  static const Curve linear = Easing.linear;

  /// [Standard](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#7e37d374-0c1b-4007-8187-6f29bb1fb3e7)
  static const Curve standard = Easing.standard;

  /// [Standard decelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#7e37d374-0c1b-4007-8187-6f29bb1fb3e7)
  static const Curve standardDecelerate = Easing.standardDecelerate;

  /// [Standard accelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#7e37d374-0c1b-4007-8187-6f29bb1fb3e7)
  static const Curve standardAccelerate = Easing.standardAccelerate;

  /// [Emphasized](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#cbea5c6e-7b0d-47a0-98c3-767080a38d95)
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;

  /// [Emphasized decelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#cbea5c6e-7b0d-47a0-98c3-767080a38d95)
  static const Curve emphasizedDecelerate = Easing.emphasizedDecelerate;

  /// [Emphasized accelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#cbea5c6e-7b0d-47a0-98c3-767080a38d95)
  static const Curve emphasizedAccelerate = Easing.emphasizedAccelerate;

  /// [Legacy standard](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#6341c2bf-54a0-4260-8ec7-6173926709a3)
  static const Curve legacy = Easing.legacy;

  /// [Legacy standard decelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#6341c2bf-54a0-4260-8ec7-6173926709a3)
  static const Curve legacyDecelerate = Easing.legacyDecelerate;

  /// [Legacy standard accelerate](https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#6341c2bf-54a0-4260-8ec7-6173926709a3)
  static const Curve legacyAccelerate = Easing.legacyAccelerate;
}
