import 'package:flutter/material.dart';

import 'duration.dart';
import 'easing.dart';

/// Suggested easing and duration pairs from Material 3 [motion spec](https://m3.material.io/styles/motion/overview)
///
/// See also:
///
/// * [MotionDuration]: [Duration] constants based on Material 3 duration spec.
/// * [Easing]: [Curve] constants based on Material 3 easing spec.
abstract final class Motion {
  /// > Selection controls have a short duration of 200ms with Standard easing.
  ///
  /// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#97194be9-de1c-41b9-90d4-21ae2b8d3f38>
  static const MotionPair selectionMotion =
      (easing: MaterialEasing.standard, duration: MotionDuration.short4);

  /// > A FAB expanding into a Sheet uses a 400ms duration with Emphasized
  /// easing.
  ///
  /// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#e08d2356-1831-4375-bc2f-6d45230c6d98>
  static const MotionPair fabExpandingMotion =
      (easing: MaterialEasing.emphasized, duration: MotionDuration.medium4);

  /// > A Card expanding to full screen uses a long 500ms duration with
  /// Emphasized easing.
  ///
  /// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#48bf653e-46f9-48f5-87e0-eaf8ea3fe716>
  static const MotionPair cardExpansionMotion =
      (easing: MaterialEasing.emphasized, duration: MotionDuration.long2);

  /// > An ambient carousel auto-advance transition uses an extra long 1000ms
  /// duration with emphasized easing.
  ///
  /// <https://m3.material.io/styles/motion/easing-and-duration/tokens-specs#ee9dbe95-70fa-4804-8347-c4fd58c60fe2>
  static const MotionPair ambientCarouselMotion =
      (easing: MaterialEasing.emphasized, duration: MotionDuration.long4);
}

/// Combination of easing and duration.
typedef MotionPair = ({Curve easing, Duration duration});
