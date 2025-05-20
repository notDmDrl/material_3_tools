import 'package:flutter/material.dart' show Cubic, Curve;

typedef ExCurve = ({Curve curve, Duration duration});

// https://m3.material.io/styles/motion/overview/specs#e3e4f10b-6314-47b7-9051-988066081fa0
abstract final class ExpressiveCurve {
  // Standard spatial
  static const ExCurve standardSpatialFast = (
    curve: Cubic(0.27, 1.06, 0.18, 1),
    duration: Duration(milliseconds: 350),
  );
  static const ExCurve standardSpatialDefault = (
    curve: Cubic(0.27, 1.06, 0.18, 1),
    duration: Duration(milliseconds: 500),
  );
  static const ExCurve standardSpatialSlow = (
    curve: Cubic(0.27, 1.06, 0.18, 1),
    duration: Duration(milliseconds: 750),
  );

  // Expressive spatial
  static const ExCurve expressiveSpatialFast = (
    curve: Cubic(0.42, 1.67, 0.21, 0.9),
    duration: Duration(milliseconds: 350),
  );
  static const ExCurve expressiveSpatialDefault = (
    curve: Cubic(0.38, 1.21, 0.22, 1),
    duration: Duration(milliseconds: 500),
  );
  static const ExCurve expressiveSpatialSlow = (
    curve: Cubic(0.39, 1.29, 0.35, 0.98),
    duration: Duration(milliseconds: 650),
  );

  // Effects (same for standard and expressive)
  static const ExCurve effectsFast = (
    curve: Cubic(0.31, 0.94, 0.34, 1),
    duration: Duration(milliseconds: 150),
  );
  static const ExCurve effectsDefault = (
    curve: Cubic(0.34, 0.80, 0.34, 1),
    duration: Duration(milliseconds: 200),
  );
  static const ExCurve effectsSlow = (
    curve: Cubic(0.34, 0.88, 0.34, 1),
    duration: Duration(milliseconds: 300),
  );
}
