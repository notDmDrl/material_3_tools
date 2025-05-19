import 'package:flutter/animation.dart';

// https://m3.material.io/styles/motion/overview/how-it-works#91dfe12e-1e79-4417-a27e-33049358b149
abstract final class ExpressiveSpring {
  // Standard spatial
  static const standardSpatialFast = SpringDescription(
    mass: 1,
    stiffness: 1400,
    damping: 0.9,
  );
  static const standardSpatialDefault = SpringDescription(
    mass: 1,
    stiffness: 700,
    damping: 0.9,
  );
  static const standardSpatialSlow = SpringDescription(
    mass: 1,
    stiffness: 300,
    damping: 0.9,
  );

  // Expressive spatial
  static const expressiveSpatialFast = SpringDescription(
    mass: 1,
    stiffness: 800,
    damping: 0.6,
  );
  static const expressiveSpatialDefault = SpringDescription(
    mass: 1,
    stiffness: 380,
    damping: 0.8,
  );
  static const expressiveSpatialSlow = SpringDescription(
    mass: 1,
    stiffness: 200,
    damping: 0.8,
  );

  // Effects (same for standard and expressive)
  static const effectsFast = SpringDescription(
    mass: 1,
    stiffness: 3800,
    damping: 1,
  );
  static const effectsDefault = SpringDescription(
    mass: 1,
    stiffness: 1600,
    damping: 1,
  );
  static const effectsSlow = SpringDescription(
    mass: 1,
    stiffness: 800,
    damping: 1,
  );
}
