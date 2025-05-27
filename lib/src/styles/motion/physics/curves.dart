/// @docImport 'package:flutter/material.dart';
/// @docImport 'spring.dart';
library;

import 'package:flutter/animation.dart' show Cubic, Curve;

/// Creates a pair of a [Curve] and [Duration].
///
/// Used by [MotionPhysicsCurve].
typedef MotionPhysicsCurvePair = ({Curve curve, Duration duration});

/// Material 3 Expressive [SpringDescription]s converted to pairs of a [Curve]
/// and [Duration].
///
/// Expressive motion scheme has 3 preset motion schemes with 3 speeds each.
///
/// Spatial and effect springs come in three speeds: default, fast,
/// and slow. Most motion should use the default speed, while smaller elements
/// may use fast and larger elements may use slow.
///
/// Variants are:
///
/// * [Expressive spatial](https://m3.material.io/styles/motion/overview/how-it-works#325277b0-f2fc-4be9-aa87-31cea6d1777d)
/// should be used for most situations, particularly hero moments and key interactions.
/// * [Standard spatial](https://m3.material.io/styles/motion/overview/how-it-works#3990a20e-9cd2-4b8d-89b0-31cbc6ce346c)
/// should be used for utilitarian products.
/// * [Effects](https://m3.material.io/styles/motion/overview/how-it-works#a7deb339-30ae-4559-9140-d7b7e29e68c6)
/// should be used to animate properties such as color and opacity animations, where there shouldn’t be any overshoot.
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fm8or28vc-5.png?alt=media&token=12806c6a-d624-4706-87bf-91cc61506aa1)
///
/// See also:
///
/// * [MotionPhysicsSpring], a [SpringDescription] based motion physics.
/// * [Web: Convert springs to curves](https://m3.material.io/styles/motion/overview/specs#e3e4f10b-6314-47b7-9051-988066081fa0)
abstract final class MotionPhysicsCurve {
  /// Standard spatial movement with a fast duration.
  static const MotionPhysicsCurvePair standardFast = (
    curve: Cubic(0.27, 1.06, 0.18, 1),
    duration: Duration(milliseconds: 350),
  );

  /// Standard spatial movement with a fast default.
  static const MotionPhysicsCurvePair standardDefault = (
    curve: Cubic(0.27, 1.06, 0.18, 1),
    duration: Duration(milliseconds: 500),
  );

  /// Standard spatial movement with a slow duration.
  static const MotionPhysicsCurvePair standardSlow = (
    curve: Cubic(0.27, 1.06, 0.18, 1),
    duration: Duration(milliseconds: 750),
  );

  /// Expressive spatial movement with a fast duration.
  static const MotionPhysicsCurvePair expressiveFast = (
    curve: Cubic(0.42, 1.67, 0.21, 0.9),
    duration: Duration(milliseconds: 350),
  );

  /// Expressive spatial movement with a default duration.
  static const MotionPhysicsCurvePair expressiveDefault = (
    curve: Cubic(0.38, 1.21, 0.22, 1),
    duration: Duration(milliseconds: 500),
  );

  /// Expressive spatial movement with a slow duration.
  static const MotionPhysicsCurvePair expressiveSlow = (
    curve: Cubic(0.39, 1.29, 0.35, 0.98),
    duration: Duration(milliseconds: 650),
  );

  /// Effects movement with a fast duration.
  static const MotionPhysicsCurvePair effectsFast = (
    curve: Cubic(0.31, 0.94, 0.34, 1),
    duration: Duration(milliseconds: 150),
  );

  /// Effects movement with a default duration.
  static const MotionPhysicsCurvePair effectsDefault = (
    curve: Cubic(0.34, 0.80, 0.34, 1),
    duration: Duration(milliseconds: 200),
  );

  /// Effects movement with a slow duration.
  static const MotionPhysicsCurvePair effectsSlow = (
    curve: Cubic(0.34, 0.88, 0.34, 1),
    duration: Duration(milliseconds: 300),
  );
}
