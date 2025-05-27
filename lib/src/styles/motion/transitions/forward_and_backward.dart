import 'package:flutter/material.dart';

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
  DelegatedTransitionBuilder get delegatedTransition =>
      (context, animation, secondaryAnimation, allowSnapshotting, child) =>
          _DelegatedTransition(animation: animation, child: child!);

  // Used by all of the sliding transition animations.
  static const Curve _transitionCurve = Curves.easeInOutCubicEmphasized;

  // The previous page slides from right to left as the current page appears.
  static final Animatable<Offset> _secondaryBackwardTranslationTween =
      Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-0.25, 0),
      ).chain(CurveTween(curve: _transitionCurve));

  // The previous page slides from left to right as the current page disappears.
  static final Animatable<Offset> _secondaryForwardTranslationTween =
      Tween<Offset>(
        begin: const Offset(-0.25, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve: _transitionCurve));

  // The fade in transition when the new page appears.
  static final Animatable<double> _fadeInTransition = Tween<double>(
    begin: 0,
    end: 1,
  ).chain(CurveTween(curve: const Interval(0, 0.75)));

  // The fade out transition of the old page when the new page appears.
  static final Animatable<double> _fadeOutTransition = Tween<double>(
    begin: 1,
    end: 0,
  ).chain(CurveTween(curve: const Interval(0, 0.25)));

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => _ForwardAndBackwardTransition(
    animation: animation,
    secondaryAnimation: secondaryAnimation,
    child: child,
  );
}

/// Defines a transition in which outgoing and incoming elements share a
/// horizontal slide and fade transition.
///
/// Consider using [ForwardAndBackwardTransitionsBuilder] within a
/// [PageTransitionsTheme] if you want to apply [_ForwardAndBackwardTransition]
/// to [MaterialPageRoute] transitions within a Navigator.
///
/// See also:
///
///  * Forward and Backward transition:
///  <https://m3.material.io/styles/motion/transitions/transition-patterns#df9c7d76-1454-47f3-ad1c-268a31f58bad>
@immutable
class _ForwardAndBackwardTransition extends StatelessWidget {
  /// Creates a [_ForwardAndBackwardTransition].
  const _ForwardAndBackwardTransition({
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

  // The new page slides in from right to left.
  static final Animatable<Offset> _forwardTranslationTween = Tween<Offset>(
    begin: const Offset(0.25, 0),
    end: Offset.zero,
  ).chain(
    CurveTween(curve: ForwardAndBackwardTransitionsBuilder._transitionCurve),
  );

  // The old page slides back from left to right.
  static final Animatable<Offset> _backwardTranslationTween = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.25, 0),
  ).chain(
    CurveTween(curve: ForwardAndBackwardTransitionsBuilder._transitionCurve),
  );

  @override
  Widget build(BuildContext context) => DualTransitionBuilder(
    animation: animation,
    forwardBuilder:
        (context, animation, child) => FadeTransition(
          opacity: ForwardAndBackwardTransitionsBuilder._fadeInTransition
              .animate(animation),
          child: SlideTransition(
            position: _forwardTranslationTween.animate(animation),
            child: child,
          ),
        ),
    reverseBuilder:
        (context, animation, child) => FadeTransition(
          opacity: ForwardAndBackwardTransitionsBuilder._fadeOutTransition
              .animate(animation),
          child: SlideTransition(
            position: _backwardTranslationTween.animate(animation),
            child: child,
          ),
        ),
    child: _DelegatedTransition(animation: secondaryAnimation, child: child),
  );
}

@immutable
class _DelegatedTransition extends StatelessWidget {
  const _DelegatedTransition({required this.animation, required this.child});

  /// The animation that transitions [child] when new content is pushed on top
  /// of it.
  final Animation<double> animation;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) => DualTransitionBuilder(
    animation: ReverseAnimation(animation),
    forwardBuilder:
        (context, animation, child) => ColoredBox(
          color:
              animation.isAnimating
                  ? Theme.of(context).canvasColor
                  : Colors.transparent,
          child: FadeTransition(
            opacity: ForwardAndBackwardTransitionsBuilder._fadeInTransition
                .animate(animation),
            child: SlideTransition(
              position: ForwardAndBackwardTransitionsBuilder
                  ._secondaryForwardTranslationTween
                  .animate(animation),
              child: child,
            ),
          ),
        ),
    reverseBuilder:
        (context, animation, child) => ColoredBox(
          color:
              animation.isAnimating
                  ? Theme.of(context).canvasColor
                  : Colors.transparent,
          child: FadeTransition(
            opacity: ForwardAndBackwardTransitionsBuilder._fadeOutTransition
                .animate(animation),
            child: SlideTransition(
              position: ForwardAndBackwardTransitionsBuilder
                  ._secondaryBackwardTranslationTween
                  .animate(animation),
              child: child,
            ),
          ),
        ),
    child: child,
  );
}
