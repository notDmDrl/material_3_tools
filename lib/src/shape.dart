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
    Radius.circular(4),
  );

  /// Baseline shape with top corners having `radius` of 4.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius extraSmallTop = BorderRadius.vertical(
    top: Radius.circular(4),
  );

  /// Baseline shape with bottom corners having `radius` of 4.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius extraSmallBottom = BorderRadius.vertical(
    bottom: Radius.circular(4),
  );

  /// Baseline shape with left corners having `radius` of 4.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius extraSmallLeft = BorderRadius.horizontal(
    left: Radius.circular(4),
  );

  /// Baseline shape with right corners having `radius` of 4.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius extraSmallRight = BorderRadius.horizontal(
    right: Radius.circular(4),
  );

  /// Baseline shape with all corners having `radius` of 8.0.
  static const BorderRadius small = BorderRadius.all(
    Radius.circular(8),
  );

  /// Baseline shape with top corners having `radius` of 8.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius smallTop = BorderRadius.vertical(
    top: Radius.circular(8),
  );

  /// Baseline shape with bottom corners having `radius` of 8.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius smallBottom = BorderRadius.vertical(
    bottom: Radius.circular(8),
  );

  /// Baseline shape with left corners having `radius` of 8.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius smallLeft = BorderRadius.horizontal(
    left: Radius.circular(8),
  );

  /// Baseline shape with right corners having `radius` of 8.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius smallRight = BorderRadius.horizontal(
    right: Radius.circular(8),
  );

  /// Baseline shape with all corners having `radius` of 12.0.
  static const BorderRadius medium = BorderRadius.all(
    Radius.circular(12),
  );

  /// Baseline shape with top corners having `radius` of 12.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius mediumTop = BorderRadius.vertical(
    top: Radius.circular(12),
  );

  /// Baseline shape with bottom corners having `radius` of 12.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius mediumBottom = BorderRadius.vertical(
    bottom: Radius.circular(12),
  );

  /// Baseline shape with left corners having `radius` of 12.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius mediumLeft = BorderRadius.horizontal(
    left: Radius.circular(12),
  );

  /// Baseline shape with right corners having `radius` of 12.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius mediumRight = BorderRadius.horizontal(
    right: Radius.circular(12),
  );

  /// Baseline shape with all corners having `radius` of 16.0.
  static const BorderRadius large = BorderRadius.all(
    Radius.circular(16),
  );

  /// Baseline shape with top corners having `radius` of 16.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius largeTop = BorderRadius.vertical(
    top: Radius.circular(16),
  );

  /// Baseline shape with bottom corners having `radius` of 16.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius largeBottom = BorderRadius.vertical(
    bottom: Radius.circular(16),
  );

  /// Baseline shape with left corners having `radius` of 16.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius largeLeft = BorderRadius.horizontal(
    left: Radius.circular(16),
  );

  /// Baseline shape with right corners having `radius` of 16.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius largeRight = BorderRadius.horizontal(
    right: Radius.circular(16),
  );

  /// Baseline shape with all corners having `radius` of 28.0.
  static const BorderRadius extraLarge = BorderRadius.all(
    Radius.circular(28),
  );

  /// Baseline shape with top corners having `radius` of 28.0 and bottom corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeTop = BorderRadius.vertical(
    top: Radius.circular(28),
  );

  /// Baseline shape with bottom corners having `radius` of 28.0 and top corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeBottom = BorderRadius.vertical(
    bottom: Radius.circular(28),
  );

  /// Baseline shape with left corners having `radius` of 28.0 and right corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeLeft = BorderRadius.horizontal(
    left: Radius.circular(28),
  );

  /// Baseline shape with right corners having `radius` of 28.0 and left corners
  /// having `radius` of 0.0.
  static const BorderRadius extraLargeRight = BorderRadius.horizontal(
    right: Radius.circular(28),
  );

  /// Baseline shape with all corners having `radius` of 90.0.
  static const BorderRadius full = BorderRadius.all(
    Radius.circular(90),
  );
}
