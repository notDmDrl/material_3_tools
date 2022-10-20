/// [double] constants which represent Material 3 [elevation system](https://m3.material.io/styles/elevation/overview).
///
/// See also:
///
/// * Material 3 specification for elevation:
/// <https://m3.material.io/styles/elevation/tokens>
abstract class Elevation {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  const Elevation._();

  /// Baseline elevation of 0px;
  static const double level0 = 0;

  /// Baseline elevation of 1px;
  static const double level1 = 1;

  /// Baseline elevation of 3px;
  static const double level2 = 3;

  /// Baseline elevation of 6px;
  static const double level3 = 6;

  /// Baseline elevation of 8px;
  static const double level4 = 8;

  /// Baseline elevation of 12px;
  static const double level5 = 12;
}
