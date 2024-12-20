import 'package:flutter/rendering.dart' show BorderRadius, Radius;

/// [BorderRadius] constants which represent Material 3 [shape system](https://m3.material.io/styles/shape/overview).
///
/// See also:
///
/// * Material 3 specification for shapes:
/// <https://m3.material.io/styles/shape/shape-scale-tokens>
abstract final class Shapes {
  /// Baseline shape with all corners having `radius` of zero.
  static const BorderRadius none = BorderRadius.zero;

  /// Baseline shape with all corners having `radius` of 4.0.
  static const extraSmall = BorderRadius.all(CornerSize.extraSmall);

  /// Baseline shape with all corners having `radius` of 8.0.
  static const small = BorderRadius.all(CornerSize.small);

  /// Baseline shape with all corners having `radius` of 12.0.
  static const medium = BorderRadius.all(CornerSize.medium);

  /// Baseline shape with all corners having `radius` of 16.0.
  static const large = BorderRadius.all(CornerSize.large);

  /// Baseline shape with all corners having `radius` of 20.0.
  static const largeIncreased = BorderRadius.all(CornerSize.largeIncreased);

  /// Baseline shape with all corners having `radius` of 28.0.
  static const extraLarge = BorderRadius.all(CornerSize.extraLarge);

  /// Baseline shape with all corners having `radius` of 32.0.
  static const extraLargeIncreased = BorderRadius.all(
    CornerSize.extraLargeIncreased,
  );

  /// Baseline shape with all corners having `radius` of 48.0.
  static const extraExtraLarge = BorderRadius.all(CornerSize.extraExtraLarge);

  /// Baseline shape with all corners having `radius` of 90.0.
  static const full = BorderRadius.all(CornerSize.full);
}

/// [Radius.circular] constants which represent Material 3 [shape system](https://m3.material.io/styles/shape/overview).
///
/// Usually should only be used internally for [Shapes] constants, but is
/// exposed for convenience.
///
/// Values are taken from *androidx* material 3 compose [source code](https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:compose/material3/material3/src/commonMain/kotlin/androidx/compose/material3/Shapes.kt).
abstract final class CornerSize {
  /// A non-rounded corner size.
  static const Radius none = Radius.zero;

  /// An extra small rounded corner size.
  static const extraSmall = Radius.circular(4);

  /// A small rounded corner size.
  static const small = Radius.circular(8);

  /// A medium rounded corner size.
  static const medium = Radius.circular(12);

  /// A large rounded corner size.
  static const large = Radius.circular(16);

  ///  A large rounded corner size, slightly larger than [large].
  static const largeIncreased = Radius.circular(20);

  /// An extra large rounded corner size.
  static const extraLarge = Radius.circular(28);

  /// An extra large rounded corner size, slightly larger than [extraLarge].
  static const extraLargeIncreased = Radius.circular(32);

  /// An extra extra large (XXL) rounded corner size.
  static const extraExtraLarge = Radius.circular(48);

  /// A fully rounded corner size.
  static const full = Radius.circular(90);
}
