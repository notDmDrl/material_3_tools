/// @docImport 'package:flutter/animation.dart';
/// @docImport 'curves.dart';
library;

import 'package:flutter/animation.dart' show SpringDescription;

/// Material 3 Expressive [SpringDescription]s.
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
/// * [MotionPhysicsCurve], a [Curve] and [Duration] based motion physics.
/// * [Web: Convert springs to curves](https://m3.material.io/styles/motion/overview/specs#e3e4f10b-6314-47b7-9051-988066081fa0)
abstract final class MotionPhysicsSpring {
  /// Standard spatial movement with a fast duration.
  static const standardFast = SpringDescription(
    mass: 1,
    stiffness: 1400,
    damping: 0.9,
  );

  /// Standard spatial movement with a fast default.
  static const standardDefault = SpringDescription(
    mass: 1,
    stiffness: 700,
    damping: 0.9,
  );

  /// Standard spatial movement with a slow duration.
  static const standardSlow = SpringDescription(
    mass: 1,
    stiffness: 300,
    damping: 0.9,
  );

  /// Expressive spatial movement with a fast duration.
  static const expressiveFast = SpringDescription(
    mass: 1,
    stiffness: 800,
    damping: 0.6,
  );

  /// Expressive spatial movement with a default duration.
  static const expressiveDefault = SpringDescription(
    mass: 1,
    stiffness: 380,
    damping: 0.8,
  );

  /// Expressive spatial movement with a slow duration.
  static const expressiveSlow = SpringDescription(
    mass: 1,
    stiffness: 200,
    damping: 0.8,
  );

  /// Effects movement with a fast duration.
  static const effectsFast = SpringDescription(
    mass: 1,
    stiffness: 3800,
    damping: 1,
  );

  /// Effects movement with a default duration.
  static const effectsDefault = SpringDescription(
    mass: 1,
    stiffness: 1600,
    damping: 1,
  );

  /// Effects movement with a slow duration.
  static const effectsSlow = SpringDescription(
    mass: 1,
    stiffness: 800,
    damping: 1,
  );
}
