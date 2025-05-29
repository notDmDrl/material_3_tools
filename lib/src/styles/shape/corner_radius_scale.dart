import 'package:flutter/rendering.dart' show BorderRadius, Radius;

/// [BorderRadius] constants which represent Material 3 [shape system](https://m3.material.io/styles/shape/overview-principles).
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fm0c881mj-1.png?alt=media&token=fcb5e003-c5d3-4208-af8a-8766b55ad7ee)
///
/// See also:
///
/// * [M3 guidelines: corner radius scale](https://m3.material.io/styles/shape/corner-radius-scale#7c4b83c5-25e3-4337-889d-4f24a2b93e6d)
abstract final class CornerRadiusScale {
  /// Baseline shape with all corners having `radius` of zero.
  static const BorderRadius none = BorderRadius.zero;

  /// Baseline shape with all corners having `radius` of 4.0.
  static const extraSmall = BorderRadius.all(
    CornerRadius.extraSmall,
  );

  /// Baseline shape with all corners having `radius` of 8.0.
  static const small = BorderRadius.all(
    CornerRadius.small,
  );

  /// Baseline shape with all corners having `radius` of 12.0.
  static const medium = BorderRadius.all(
    CornerRadius.medium,
  );

  /// Baseline shape with all corners having `radius` of 16.0.
  static const large = BorderRadius.all(
    CornerRadius.large,
  );

  /// Baseline shape with all corners having `radius` of 20.0.
  static const largeIncreased = BorderRadius.all(
    CornerRadius.largeIncreased,
  );

  /// Baseline shape with all corners having `radius` of 28.0.
  static const extraLarge = BorderRadius.all(
    CornerRadius.extraLarge,
  );

  /// Baseline shape with all corners having `radius` of 32.0.
  static const extraLargeIncreased = BorderRadius.all(
    CornerRadius.extraLargeIncreased,
  );

  /// Baseline shape with all corners having `radius` of 48.0.
  static const extraExtraLarge = BorderRadius.all(
    CornerRadius.extraExtraLarge,
  );

  /// Baseline shape with all corners having `radius` of 90.0.
  static const full = BorderRadius.all(
    CornerRadius.full,
  );
}

/// [Radius.circular] constants which represent Material 3 [shape system](https://m3.material.io/styles/shape/overview-principles).
///
/// Usually should only be used internally for [CornerRadiusScale] constants, but is
/// exposed for convenience.
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fm0c881mj-1.png?alt=media&token=fcb5e003-c5d3-4208-af8a-8766b55ad7ee)
///
/// See also:
///
/// * [M3 guidelines: corner radius scale](https://m3.material.io/styles/shape/corner-radius-scale#7c4b83c5-25e3-4337-889d-4f24a2b93e6d)
abstract final class CornerRadius {
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
