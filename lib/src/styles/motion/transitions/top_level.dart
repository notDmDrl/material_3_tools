// Material Easing was deprecated, yet still required for transitions.
// ignore_for_file: deprecated_member_use_from_same_package
import 'package:flutter/widgets.dart';

import '/src/styles/motion/easing_and_duration.dart';
import '_page_transition_switcher.dart';

/// Defines a transition in which the outgoing page fades out, then the incoming
/// page fades in and, if [applyScaleTransition] is set to true, scales up.
///
/// See also:
///
/// * [M3 guidelines: top level transition](https://m3.material.io/styles/motion/transitions/transition-patterns#8327d206-2a7d-423a-abf0-2be86130535b)
/// * [Material motion: top level transition with scale animation](https://github.com/material-components/material-components-android/blob/master/docs/theming/Motion.md#fade-through)
final class const TopLevelTransition({
  super.key,

  /// The current child widget to display.
  ///
  /// See [PageTransitionSwitcher.child].
  required final Widget child,

  /// Whether to apply a scale transition to an incoming page.
  final bool applyScaleTransition = false,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => PageTransitionSwitcher(
    transitionBuilder: (child, animation, secondaryAnimation) =>
        _ZoomedFadeInFadeOut(
          animation: animation,
          applyScaleTransition: applyScaleTransition,
          child: _ZoomedFadeInFadeOut(
            animation: ReverseAnimation(secondaryAnimation),
            applyScaleTransition: applyScaleTransition,
            child: child,
          ),
        ),
    child: child,
  );
}

class const _ZoomedFadeInFadeOut({
  required final Animation<double> animation,
  required final bool applyScaleTransition,
  final Widget? child,
}) extends StatelessWidget {
  static final _inCurve = CurveTween(curve: MaterialEasing.legacy);

  static final _scaleIn = TweenSequence<double>([
    TweenSequenceItem(tween: ConstantTween(0.92), weight: 6 / 20),
    TweenSequenceItem(
      tween: Tween<double>(begin: 0.92, end: 1).chain(_inCurve),
      weight: 14 / 20,
    ),
  ]);

  static final _fadeInOpacity = TweenSequence<double>([
    TweenSequenceItem(tween: ConstantTween(0), weight: 6 / 20),
    TweenSequenceItem(
      tween: Tween<double>(begin: 0, end: 1).chain(_inCurve),
      weight: 14 / 20,
    ),
  ]);

  static FadeTransition _forward(
    Animation<double> animation,
    Widget? child, {
    required bool applyScaleTransition,
  }) {
    var resolvedChild = child;
    if (applyScaleTransition) {
      resolvedChild = ScaleTransition(
        scale: _scaleIn.animate(animation),
        child: child,
      );
    }

    return FadeTransition(
      opacity: _fadeInOpacity.animate(animation),
      child: resolvedChild,
    );
  }

  static final _outCurve = CurveTween(curve: MaterialEasing.legacy);

  static final _fadeOutOpacity = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween<double>(begin: 1, end: 0).chain(_outCurve),
      weight: 6 / 20,
    ),
    TweenSequenceItem(tween: ConstantTween(0), weight: 14 / 20),
  ]);

  static FadeTransition _reverse(
    BuildContext _,
    Animation<double> animation,
    Widget? child,
  ) =>
      FadeTransition(opacity: _fadeOutOpacity.animate(animation), child: child);

  @override
  Widget build(BuildContext context) => DualTransitionBuilder(
    animation: animation,
    forwardBuilder: (_, animation, child) => _forward(
      animation,
      child,
      applyScaleTransition: applyScaleTransition,
    ),
    reverseBuilder: _reverse,
    child: child,
  );
}
