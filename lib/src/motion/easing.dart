import 'package:flutter/material.dart' show Cubic, Curve, Curves, Easing;

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

  /// Easing used for Android 14+ predictive back gesture.
  ///
  /// Values are taken from *androidx* material 3 compose [source code](https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:compose/material3/material3/src/androidMain/kotlin/androidx/compose/material3/internal/PredictiveBack.android.kt).
  ///
  /// See also:
  ///
  /// * Material 3 specification for gestures:
  /// <https://m3.material.io/foundations/interaction/gestures#22462fb2-fbe8-4e0c-b3e7-9278bd18ea0d>
  static const Curve predictiveBackEasing = Cubic(0.1, 0.1, 0, 1);
}
