import 'package:flutter/material.dart';
import 'package:material_3_tools/src/page_route.dart';

// We lose ability to have it in const context but the animation duration is
// synchronized with route duration.
final _kAnimationDuration =
    M3MaterialPageRoute.kTransitionDuration.inMilliseconds;
const int _kFadeDuration = 83;
const double _kSlideDeltaX = 96;

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
  const _EnterTransition.forward(BuildContext _, this.animation, this.child)
      : reverse = false;

  const _EnterTransition.reverse(BuildContext _, this.animation, this.child)
      : reverse = true;

  final Animation<double> animation;
  final Widget? child;
  final bool reverse;

  static const int _kFadeInStartOffset = 50;
  static final double _fadeInBegin = _kFadeInStartOffset / _kAnimationDuration;
  static final double _fadeInEnd =
      (_kFadeInStartOffset + _kFadeDuration) / _kAnimationDuration;

  static final Animatable<double> _fadeInTransition = CurveTween(
    curve: Interval(_fadeInBegin, _fadeInEnd),
  );

  static final Animatable<Offset> _slideInTransition = Tween<Offset>(
    begin: const Offset(_kSlideDeltaX, 0),
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.easeInOutCubicEmphasized));

  @override
  Widget build(BuildContext context) {
    final fillColor = Theme.of(context).canvasColor;
    final fadeAnimation = switch (reverse) {
      true => kAlwaysCompleteAnimation,
      false => _fadeInTransition.animate(animation),
    };
    var offsetScaleFactor = reverse ? -1.0 : 1.0;
    if (Directionality.of(context) == TextDirection.rtl) {
      offsetScaleFactor *= -1.0;
    }

    return FadeTransition(
      opacity: fadeAnimation,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          // Both enter and exit transitions paint a background, to fade in and
          // out the old page, and to prevent the old page sliding in and out
          // from leaking the content below.
          //
          // When the exit transition fades out the new page, the background
          // painted by the transition also fades out, which should reveal the
          // old page below. However, the background painted by the *enter*
          // transition does not fade out, due to how DualTransitionBuilder
          // works. When a page is being popped off, this background will
          // obscure the old page, until the navigator removes the new page
          // after the transition ended.
          //
          // Hide the background after the enter transition has completed to
          // avoid this.
          final shouldHideBackground = animation.isCompleted;

          final transform = Transform.translate(
            offset: _slideInTransition.evaluate(animation) * offsetScaleFactor,
            child: child,
          );

          if (shouldHideBackground) {
            return ColoredBox(
              color: fillColor,
              child: transform,
            );
          }

          return transform;
        },
        child: child,
      ),
    );
  }
}

@immutable
class _ExitTransition extends StatelessWidget {
  const _ExitTransition.forward(BuildContext _, this.animation, this.child)
      : reverse = false;

  const _ExitTransition.reverse(BuildContext _, this.animation, this.child)
      : reverse = true;

  final Animation<double> animation;
  final bool reverse;
  final Widget? child;

  static const int _fadeOutStartOffset = 35;
  static final double _fadeOutBegin = _fadeOutStartOffset / _kAnimationDuration;
  static final double _fadeOutEnd =
      (_fadeOutStartOffset + _kFadeDuration) / _kAnimationDuration;

  static final Animatable<double> _fadeOutTransition =
      Tween<double>(begin: 1, end: 0).chain(
    CurveTween(curve: Interval(_fadeOutBegin, _fadeOutEnd)),
  );

  static final Animatable<Offset> _slideOutTransition = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-_kSlideDeltaX, 0),
  ).chain(CurveTween(curve: Curves.easeInOutCubicEmphasized));

  @override
  Widget build(BuildContext context) {
    final fillColor = Theme.of(context).canvasColor;

    final fadeAnimation = switch (reverse) {
      true => kAlwaysCompleteAnimation,
      false => _fadeOutTransition.animate(animation),
    };
    var offsetScaleFactor = reverse ? -1.0 : 1.0;
    if (Directionality.of(context) == TextDirection.rtl) {
      offsetScaleFactor *= -1.0;
    }

    return FadeTransition(
      opacity: fadeAnimation,
      child: ColoredBox(
        color: fillColor,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Transform.translate(
            offset: _slideOutTransition.evaluate(animation) * offsetScaleFactor,
            child: child,
          ),
          child: child,
        ),
      ),
    );
  }
}
