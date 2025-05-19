import 'package:flutter/material.dart';

typedef ExCurve = (Curve curve, Duration duration);

// https://m3.material.io/styles/motion/overview/specs#e3e4f10b-6314-47b7-9051-988066081fa0
abstract final class ExpressiveCurve {
  // Standard spatial
  static const ExCurve standardSpatialFast = (
    Cubic(0.27, 1.06, 0.18, 1),
    Durations.medium3,
  );
  static const ExCurve standardSpatialDefault = (
    Cubic(0.27, 1.06, 0.18, 1),
    Durations.long2,
  );
  static const ExCurve standardSpatialSlow = (
    Cubic(0.27, 1.06, 0.18, 1),
    Duration(milliseconds: 750),
  );

  // Expressive spatial
  static const ExCurve expressiveSpatialFast = (
    Cubic(0.42, 1.67, 0.21, 0.9),
    Durations.medium3,
  );
  static const ExCurve expressiveSpatialDefault = (
    Cubic(0.38, 1.21, 0.22, 1),
    Durations.long2,
  );
  static const ExCurve expressiveSpatialSlow = (
    Cubic(0.39, 1.29, 0.35, 0.98),
    Duration(milliseconds: 650),
  );

  // Effects (same for standard and expressive)
  static const ExCurve effectsFast = (
    Cubic(0.31, 0.94, 0.34, 1),
    Durations.short3,
  );
  static const ExCurve effectsDefault = (
    Cubic(0.34, 0.80, 0.34, 1),
    Durations.short4,
  );
  static const ExCurve effectsSlow = (
    Cubic(0.34, 0.88, 0.34, 1),
    Durations.medium2,
  );
}
