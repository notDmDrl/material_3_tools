import 'package:flutter/material.dart';

/// Used by [PageTransitionsTheme] to define a horizontal slide and fade
/// [MaterialPageRoute] page transition animation that looks like the default
/// page transition used in Material 3 and Android 12+.
///
/// Extends [FadeForwardsPageTransitionsBuilder] to allow transition duration
/// change.
///
/// See also:
///
///  * [FadeForwardsPageTransitionsBuilder], which defines a page transition
///    that's similar to the one provided by Android U.
///  * [PredictiveBackPageTransitionsBuilder], which defines a page
///    transition that allows peeking behind the current route on Android.
///  * [FadeUpwardsPageTransitionsBuilder], which defines a page transition
///    that's similar to the one provided by Android O.
///  * [OpenUpwardsPageTransitionsBuilder], which defines a page transition
///    that's similar to the one provided by Android P.
///  * [ZoomPageTransitionsBuilder], which defines the default page transition
///    that's similar to the one provided in Android Q.
///  * [CupertinoPageTransitionsBuilder], which defines a horizontal page
///    transition that matches native iOS page transitions.
///  * [M3 guidelines: motion, transition, forward and backward](https://m3.material.io/styles/motion/transitions/transition-patterns#df9c7d76-1454-47f3-ad1c-268a31f58bad)
final class ForwardAndBackwardTransitionsBuilder
    extends FadeForwardsPageTransitionsBuilder {
  /// Constructs a page transition animation that matches the transition used in
  /// Material 3 and Android 12+
  const ForwardAndBackwardTransitionsBuilder({
    super.backgroundColor,
    this.transitionDuration = const Duration(
      milliseconds: FadeForwardsPageTransitionsBuilder.kTransitionMilliseconds,
    ),
  });

  /// {@macro flutter.widgets.TransitionRoute.transitionDuration}
  ///
  /// Defaults to 450 milliseconds.
  @override
  final Duration transitionDuration;
}
