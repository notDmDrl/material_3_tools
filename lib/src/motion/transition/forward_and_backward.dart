import 'package:flutter/material.dart';

import '../easing.dart';

/// Used by [PageTransitionsTheme] to define a horizontal slide and fade
/// [MaterialPageRoute] page transition animation that looks like the default
/// page transition used in Material 3 and Android 12+.
///
/// See also:
///
///  * [FadeUpwardsPageTransitionsBuilder], which defines a page transition
///    that's similar to the one provided by Android O.
///  * [OpenUpwardsPageTransitionsBuilder], which defines a page transition
///    that's similar to the one provided by Android P.
///  * [ZoomPageTransitionsBuilder], which defines the default page transition
///    that's similar to the one provided in Android Q.
///  * [CupertinoPageTransitionsBuilder], which defines a horizontal page
///    transition that matches native iOS page transitions.
///  * Forward and Backward transition:
///  <https://m3.material.io/styles/motion/transitions/transition-patterns#df9c7d76-1454-47f3-ad1c-268a31f58bad>
@immutable
final class ForwardAndBackwardTransitionsBuilder
    extends PageTransitionsBuilder {
  /// Constructs a page transition animation that matches the transition used in
  /// Material 3 and Android 12+
  const ForwardAndBackwardTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      ForwardAndBackwardTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      );
}

/// Defines a transition in which outgoing and incoming elements share a
/// horizontal slide and fade transition.
///
/// Consider using [ForwardAndBackwardTransitionsBuilder] within a
/// [PageTransitionsTheme] if you want to apply [ForwardAndBackwardTransition]
/// to [MaterialPageRoute] transitions within a Navigator.
///
/// See also:
///
///  * Forward and Backward transition:
///  <https://m3.material.io/styles/motion/transitions/transition-patterns#df9c7d76-1454-47f3-ad1c-268a31f58bad>
@immutable
class ForwardAndBackwardTransition extends StatelessWidget {
  /// Creates a [ForwardAndBackwardTransition].
  const ForwardAndBackwardTransition({
    super.key,
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
  });

  /// The animation that drives the [child]'s entrance and exit.
  final Animation<double> animation;

  /// The animation that transitions [child] when new content is pushed on top
  /// of it.
  final Animation<double> secondaryAnimation;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) => DualTransitionBuilder(
        animation: animation,
        forwardBuilder: _EnterTransition.forward,
        reverseBuilder: _ExitTransition.reverse,
        child: DualTransitionBuilder(
          animation: ReverseAnimation(secondaryAnimation),
          forwardBuilder: _EnterTransition.reverse,
          reverseBuilder: _ExitTransition.forward,
          child: child,
        ),
      );
}

@immutable
class _EnterTransition extends StatelessWidget {
  const _EnterTransition.forward(
    BuildContext _,
    this.animation,
    this.child,
  ) : reverse = false;

  const _EnterTransition.reverse(
    BuildContext _,
    this.animation,
    this.child,
  ) : reverse = true;

  final Animation<double> animation;
  final Widget? child;
  final bool reverse;

  static final Animatable<double> _fadeInTransition = CurveTween(
    curve: MaterialEasing.standardDecelerate,
  ).chain(CurveTween(curve: const Interval(0.3, 1)));

  @override
  Widget build(BuildContext context) {
    final slideInTransition = Tween<Offset>(
      begin: Offset(!reverse ? 30.0 : -30.0, 0),
      end: Offset.zero,
    ).chain(CurveTween(curve: MaterialEasing.standard));

    return FadeTransition(
      opacity: _fadeInTransition.animate(animation),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Transform.translate(
          offset: slideInTransition.evaluate(animation),
          child: child,
        ),
        child: child,
      ),
    );
  }
}

@immutable
class _ExitTransition extends StatelessWidget {
  const _ExitTransition.forward(
    BuildContext _,
    this.animation,
    this.child,
  ) : reverse = false;

  const _ExitTransition.reverse(
    BuildContext _,
    this.animation,
    this.child,
  ) : reverse = true;

  final Animation<double> animation;
  final bool reverse;
  final Widget? child;

  static final Animatable<double> _fadeOutTransition = _FlippedCurveTween(
    curve: MaterialEasing.standardAccelerate,
  ).chain(CurveTween(curve: const Interval(0, 0.3)));

  @override
  Widget build(BuildContext context) {
    final slideOutTransition = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(!reverse ? -30.0 : 30.0, 0),
    ).chain(CurveTween(curve: MaterialEasing.standard));

    final fillColor = Theme.of(context).canvasColor;

    return FadeTransition(
      opacity: _fadeOutTransition.animate(animation),
      child: ColoredBox(
        color: fillColor,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Transform.translate(
            offset: slideOutTransition.evaluate(animation),
            child: child,
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Enables creating a flipped [CurveTween].
///
/// This creates a [CurveTween] that evaluates to a result that flips the
/// tween vertically.
///
/// This tween sequence assumes that the evaluated result has to be a double
/// between 0.0 and 1.0.
class _FlippedCurveTween extends CurveTween {
  /// Creates a vertically flipped [CurveTween].
  _FlippedCurveTween({required super.curve});

  @override
  double transform(double t) => 1.0 - super.transform(t);
}
