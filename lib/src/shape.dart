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
  static const BorderRadius extraSmall = BorderRadius.all(
    CornerSize.extraSmall,
  );

  /// Baseline shape with top corners having `radius` of 4.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius extraSmallTop = BorderRadius.vertical(
    top: CornerSize.extraSmall,
  );

  /// Baseline shape with bottom corners having `radius` of 4.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius extraSmallBottom = BorderRadius.vertical(
    bottom: CornerSize.extraSmall,
  );

  /// Baseline shape with left corners having `radius` of 4.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius extraSmallLeft = BorderRadius.horizontal(
    left: CornerSize.extraSmall,
  );

  /// Baseline shape with right corners having `radius` of 4.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius extraSmallRight = BorderRadius.horizontal(
    right: CornerSize.extraSmall,
  );

  /// Baseline shape with all corners having `radius` of 8.0.
  static const BorderRadius small = BorderRadius.all(
    CornerSize.small,
  );

  /// Baseline shape with top corners having `radius` of 8.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius smallTop = BorderRadius.vertical(
    top: CornerSize.small,
  );

  /// Baseline shape with bottom corners having `radius` of 8.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius smallBottom = BorderRadius.vertical(
    bottom: CornerSize.small,
  );

  /// Baseline shape with left corners having `radius` of 8.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius smallLeft = BorderRadius.horizontal(
    left: CornerSize.small,
  );

  /// Baseline shape with right corners having `radius` of 8.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius smallRight = BorderRadius.horizontal(
    right: CornerSize.small,
  );

  /// Baseline shape with all corners having `radius` of 12.0.
  static const BorderRadius medium = BorderRadius.all(
    CornerSize.medium,
  );

  /// Baseline shape with top corners having `radius` of 12.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius mediumTop = BorderRadius.vertical(
    top: CornerSize.medium,
  );

  /// Baseline shape with bottom corners having `radius` of 12.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius mediumBottom = BorderRadius.vertical(
    bottom: CornerSize.medium,
  );

  /// Baseline shape with left corners having `radius` of 12.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius mediumLeft = BorderRadius.horizontal(
    left: CornerSize.medium,
  );

  /// Baseline shape with right corners having `radius` of 12.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius mediumRight = BorderRadius.horizontal(
    right: CornerSize.medium,
  );

  /// Baseline shape with all corners having `radius` of 16.0.
  static const BorderRadius large = BorderRadius.all(
    CornerSize.large,
  );

  /// Baseline shape with top corners having `radius` of 16.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius largeTop = BorderRadius.vertical(
    top: CornerSize.large,
  );

  /// Baseline shape with bottom corners having `radius` of 16.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius largeBottom = BorderRadius.vertical(
    bottom: CornerSize.large,
  );

  /// Baseline shape with left corners having `radius` of 16.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius largeLeft = BorderRadius.horizontal(
    left: CornerSize.large,
  );

  /// Baseline shape with right corners having `radius` of 16.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius largeRight = BorderRadius.horizontal(
    right: CornerSize.large,
  );

  /// Baseline shape with all corners having `radius` of 20.0.
  static const BorderRadius largeIncreased = BorderRadius.all(
    CornerSize.largeIncreased,
  );

  /// Baseline shape with top corners having `radius` of 20.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius largeIncreasedTop = BorderRadius.vertical(
    top: CornerSize.largeIncreased,
  );

  /// Baseline shape with bottom corners having `radius` of 20.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius largeIncreasedBottom = BorderRadius.vertical(
    bottom: CornerSize.largeIncreased,
  );

  /// Baseline shape with left corners having `radius` of 20.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius largeIncreasedLeft = BorderRadius.horizontal(
    left: CornerSize.largeIncreased,
  );

  /// Baseline shape with right corners having `radius` of 20.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius largeIncreasedRight = BorderRadius.horizontal(
    right: CornerSize.largeIncreased,
  );

  /// Baseline shape with all corners having `radius` of 28.0.
  static const BorderRadius extraLarge = BorderRadius.all(
    CornerSize.extraLarge,
  );

  /// Baseline shape with top corners having `radius` of 28.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeTop = BorderRadius.vertical(
    top: CornerSize.extraLarge,
  );

  /// Baseline shape with bottom corners having `radius` of 28.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeBottom = BorderRadius.vertical(
    bottom: CornerSize.extraLarge,
  );

  /// Baseline shape with left corners having `radius` of 28.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeLeft = BorderRadius.horizontal(
    left: CornerSize.extraLarge,
  );

  /// Baseline shape with right corners having `radius` of 28.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeRight = BorderRadius.horizontal(
    right: CornerSize.extraLarge,
  );

  /// Baseline shape with all corners having `radius` of 32.0.
  static const BorderRadius extraLargeIncreased = BorderRadius.all(
    CornerSize.extraLargeIncreased,
  );

  /// Baseline shape with top corners having `radius` of 32.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeIncreasedTop = BorderRadius.vertical(
    top: CornerSize.extraLargeIncreased,
  );

  /// Baseline shape with bottom corners having `radius` of 32.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeIncreasedBottom = BorderRadius.vertical(
    bottom: CornerSize.extraLargeIncreased,
  );

  /// Baseline shape with left corners having `radius` of 32.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeIncreasedLeft = BorderRadius.horizontal(
    left: CornerSize.extraLargeIncreased,
  );

  /// Baseline shape with right corners having `radius` of 32.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeIncreasedRight = BorderRadius.horizontal(
    right: CornerSize.extraLargeIncreased,
  );

  /// Baseline shape with all corners having `radius` of 48.0.
  static const BorderRadius extraExtraLarge = BorderRadius.all(
    CornerSize.extraExtraLarge,
  );

  /// Baseline shape with top corners having `radius` of 48.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius extraExtraLargeTop = BorderRadius.vertical(
    top: CornerSize.extraExtraLarge,
  );

  /// Baseline shape with bottom corners having `radius` of 48.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius extraExtraLargeBottom = BorderRadius.vertical(
    bottom: CornerSize.extraExtraLarge,
  );

  /// Baseline shape with left corners having `radius` of 48.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius extraExtraLargeLeft = BorderRadius.horizontal(
    left: CornerSize.extraExtraLarge,
  );

  /// Baseline shape with right corners having `radius` of 48.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius extraExtraLargeRight = BorderRadius.horizontal(
    right: CornerSize.extraExtraLarge,
  );

  /// Baseline shape with all corners having `radius` of 90.0.
  static const BorderRadius full = BorderRadius.all(
    CornerSize.full,
  );
}

/// [Radius.circular] constants which represent Material 3 [shape system](https://m3.material.io/styles/shape/overview).
///
/// Usually should only be used internally for [Shapes] constants, but is
/// exposed for convenience.
///
/// Values are taken from *androidx* material 3 compose [source code](https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:compose/material3/material3/src/commonMain/kotlin/androidx/compose/material3/Shapes.kt).
abstract final class CornerSize {
  /// A non-rounded corner size.
  static const none = Radius.zero;

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
