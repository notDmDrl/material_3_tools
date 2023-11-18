import 'package:animations/animations.dart' show PageTransitionSwitcher;
import 'package:flutter/material.dart';

import '../easing.dart';

/// Defines a transition in which the outgoing page fades out, then the incoming
/// page fades in and scales up.
///
/// See also:
///
///  * Top level transition:
///  <https://m3.material.io/styles/motion/transitions/transition-patterns#8327d206-2a7d-423a-abf0-2be86130535b>
@immutable
final class TopLevelTransition extends PageTransitionSwitcher {
  /// Creates [TopLevelTransition].
  const TopLevelTransition({
    super.key,
    required super.child,
  }) : super(
          transitionBuilder: _TopLevelTransition.new,
          duration: Durations.medium2,
        );
}

@immutable
class _TopLevelTransition extends StatelessWidget {
  const _TopLevelTransition(
    this.child,
    this.animation,
    this.secondaryAnimation,
  );

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget? child;

  @override
  Widget build(BuildContext context) => _ZoomedFadeInFadeOut(
        listenable: animation,
        child: _ZoomedFadeInFadeOut(
          listenable: ReverseAnimation(secondaryAnimation),
          child: child,
        ),
      );
}

@immutable
class _ZoomedFadeInFadeOut extends AnimatedWidget {
  const _ZoomedFadeInFadeOut({
    required super.listenable,
    this.child,
  });

  final Widget? child;

  static final _inCurve = CurveTween(curve: MaterialEasing.legacy);

  static final _scaleIn = TweenSequence<double>([
    TweenSequenceItem(
      tween: ConstantTween(0.92),
      weight: 6 / 20,
    ),
    TweenSequenceItem(
      tween: Tween<double>(begin: 0.92, end: 1).chain(_inCurve),
      weight: 14 / 20,
    ),
  ]);

  static final _fadeInOpacity = TweenSequence<double>([
    TweenSequenceItem(
      tween: ConstantTween(0),
      weight: 6 / 20,
    ),
    TweenSequenceItem(
      tween: Tween<double>(begin: 0, end: 1).chain(_inCurve),
      weight: 14 / 20,
    ),
  ]);

  static FadeTransition _forward(
    BuildContext _,
    Animation<double> animation,
    Widget? child,
  ) =>
      FadeTransition(
        opacity: _fadeInOpacity.animate(animation),
        child: ScaleTransition(
          scale: _scaleIn.animate(animation),
          child: child,
        ),
      );

  static final _outCurve = CurveTween(curve: MaterialEasing.legacy);

  static final _fadeOutOpacity = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween<double>(begin: 1, end: 0).chain(_outCurve),
      weight: 6 / 20,
    ),
    TweenSequenceItem(
      tween: ConstantTween(0),
      weight: 14 / 20,
    ),
  ]);

  static FadeTransition _reverse(
    BuildContext _,
    Animation<double> animation,
    Widget? child,
  ) =>
      FadeTransition(
        opacity: _fadeOutOpacity.animate(animation),
        child: child,
      );

  @override
  Widget build(BuildContext context) => DualTransitionBuilder(
        animation: listenable as Animation<double>,
        forwardBuilder: _forward,
        reverseBuilder: _reverse,
        child: child,
      );
}
