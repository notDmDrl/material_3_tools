import 'package:flutter/material.dart'
    show Cubic, Curve, Curves, Durations, Easing;

/// [Curve] constants which represent Material 3 [easing](https://m3.material.io/styles/motion/overview).
///
/// See also:
///
/// * Material 3 specification for easing:
/// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs>
@Deprecated(
  'In the expressive update, components and motion now use '
  'the motion physics system, which uses springs. '
  'Products should migrate to the new system. '
  'The easing and duration system is still used for transitions and can be '
  "used by teams that haven't yet updated to GM3 Expressive, but is no longer maintained.",
)
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

/// Combination of easing and duration.
typedef MotionPair = ({Curve easing, Duration duration});

/// Suggested easing and duration pairs from Material 3 [motion spec](https://m3.material.io/styles/motion/overview)
///
/// See also:
///
/// * [Durations] - [Duration] constants based on Material 3 duration spec.
/// * [MaterialEasing] - [Curve] constants based on Material 3 easing spec.
@Deprecated(
  'In the expressive update, components and motion now use '
  'the motion physics system, which uses springs. '
  'Products should migrate to the new system. '
  'The easing and duration system is still used for transitions and can be '
  "used by teams that haven't yet updated to GM3 Expressive, but is no longer maintained.",
)
abstract final class Motion {
  /// > Selection controls have a short duration of 200ms with Standard easing.
  ///
  /// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#97194be9-de1c-41b9-90d4-21ae2b8d3f38>
  static const MotionPair selectionMotion = (
    easing: MaterialEasing.standard,
    duration: Durations.short4,
  );

  /// > A FAB expanding into a Sheet uses a 400ms duration with Emphasized
  /// easing.
  ///
  /// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#e08d2356-1831-4375-bc2f-6d45230c6d98>
  static const MotionPair fabExpandingMotion = (
    easing: MaterialEasing.emphasized,
    duration: Durations.medium4,
  );

  /// > A Card expanding to full screen uses a long 500ms duration with
  /// Emphasized easing.
  ///
  /// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#48bf653e-46f9-48f5-87e0-eaf8ea3fe716>
  static const MotionPair cardExpansionMotion = (
    easing: MaterialEasing.emphasized,
    duration: Durations.long2,
  );

  /// > An ambient carousel auto-advance transition uses an extra long 1000ms
  /// duration with emphasized easing.
  ///
  /// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#ee9dbe95-70fa-4804-8347-c4fd58c60fe2>
  static const MotionPair ambientCarouselMotion = (
    easing: MaterialEasing.emphasized,
    duration: Durations.long4,
  );
}
