import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import 'forward_and_backward.dart';

/// Used by [PageTransitionsTheme] to define a horizontal slide and fade
/// [MaterialPageRoute] page transition animation that looks like the default
/// page transition used on Android U and above when using predictive back.
///
/// Is a copy of [PredictiveBackPageTransitionsBuilder], with
/// [ForwardAndBackwardTransitionsBuilder] as a replacement for
/// [FadeForwardsPageTransitionsBuilder], to allow transition duration and
/// background color change.
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
final class PredictiveForwardAndBackwardTransitionsBuilder
    extends PageTransitionsBuilder {
  /// Constructs a page transition animation that matches the transition used in
  /// Material 3 and Android 12+
  const PredictiveForwardAndBackwardTransitionsBuilder({
    this.transitionDuration = const Duration(
      milliseconds: FadeForwardsPageTransitionsBuilder.kTransitionMilliseconds,
    ),
    this.backgroundColor,
  });

  /// {@macro flutter.widgets.TransitionRoute.transitionDuration}
  ///
  /// Defaults to 450 milliseconds.
  @override
  final Duration transitionDuration;

  /// The background color during transition between two routes.
  ///
  /// When a new page fades in and the old page fades out, this background color
  /// helps avoid a black background between two page.
  ///
  /// Defaults to [ColorScheme.surface]
  final Color? backgroundColor;

  /// Default builders for each platform.
  ///
  /// The list of builders is: [PredictiveForwardAndBackwardTransitionsBuilder]
  /// for [TargetPlatform.android], [ForwardAndBackwardTransitionsBuilder] for
  /// [TargetPlatform.windows] and [TargetPlatform.linux],
  /// [CupertinoPageTransitionsBuilder] for [TargetPlatform.iOS] and
  /// [TargetPlatform.macOS].
  static PageTransitionsTheme defaultBuilders({
    Duration transitionDuration = const Duration(
      milliseconds: FadeForwardsPageTransitionsBuilder.kTransitionMilliseconds,
    ),
    Color? backgroundColor,
  }) => PageTransitionsTheme(
    builders: {
      .android: PredictiveForwardAndBackwardTransitionsBuilder(
        transitionDuration: transitionDuration,
        backgroundColor: backgroundColor,
      ),
      .iOS: const CupertinoPageTransitionsBuilder(),
      .macOS: const CupertinoPageTransitionsBuilder(),
      .windows: ForwardAndBackwardTransitionsBuilder(
        transitionDuration: transitionDuration,
        backgroundColor: backgroundColor,
      ),
      .linux: ForwardAndBackwardTransitionsBuilder(
        transitionDuration: transitionDuration,
        backgroundColor: backgroundColor,
      ),
    },
  );

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => _PredictiveBackGestureDetector(
    route: route,
    builder:
        (
          context,
          phase,
          startBackEvent,
          currentBackEvent,
        ) {
          // Only do a predictive back transition when the user is performing a
          // pop gesture. Otherwise, for things like button presses or other
          // programmatic navigation, fall back to
          // FadeForwardsPageTransitionsBuilder.
          if (route.popGestureInProgress) {
            return _PredictiveBackSharedElementPageTransition(
              isDelegatedTransition: true,
              animation: animation,
              phase: phase,
              secondaryAnimation: secondaryAnimation,
              startBackEvent: startBackEvent,
              currentBackEvent: currentBackEvent,
              animationDuration: transitionDuration,
              child: child,
            );
          }

          return ForwardAndBackwardTransitionsBuilder(
            backgroundColor: backgroundColor,
          ).buildTransitions(
            route,
            context,
            animation,
            secondaryAnimation,
            child,
          );
        },
  );
}

enum _PredictiveBackPhase { idle, start, update, commit, cancel }

class _PredictiveBackGestureDetector extends StatefulWidget {
  const _PredictiveBackGestureDetector({
    required this.route,
    required this.builder,
  });

  final Widget Function(
    BuildContext,
    _PredictiveBackPhase,
    PredictiveBackEvent?,
    PredictiveBackEvent?,
  )
  builder;
  final PageRoute<dynamic> route;

  @override
  State<_PredictiveBackGestureDetector> createState() =>
      _PredictiveBackGestureDetectorState();
}

class _PredictiveBackGestureDetectorState
    extends State<_PredictiveBackGestureDetector>
    with WidgetsBindingObserver {
  bool get _isEnabled =>
      widget.route.isCurrent && widget.route.popGestureEnabled;

  _PredictiveBackPhase get phase => _phase;
  _PredictiveBackPhase _phase = .idle;

  set phase(_PredictiveBackPhase phase) {
    if (_phase != phase && mounted) {
      setState(() => _phase = phase);
    }
  }

  PredictiveBackEvent? get startBackEvent => _startBackEvent;
  PredictiveBackEvent? _startBackEvent;

  set startBackEvent(PredictiveBackEvent? startBackEvent) {
    if (_startBackEvent != startBackEvent && mounted) {
      setState(() => _startBackEvent = startBackEvent);
    }
  }

  PredictiveBackEvent? get currentBackEvent => _currentBackEvent;
  PredictiveBackEvent? _currentBackEvent;

  set currentBackEvent(PredictiveBackEvent? currentBackEvent) {
    if (_currentBackEvent != currentBackEvent && mounted) {
      setState(() => _currentBackEvent = currentBackEvent);
    }
  }

  @override
  bool handleStartBackGesture(PredictiveBackEvent backEvent) {
    phase = .start;
    final bool gestureInProgress = !backEvent.isButtonEvent && _isEnabled;
    if (!gestureInProgress) {
      return false;
    }

    widget.route.handleStartBackGesture(progress: 1 - backEvent.progress);
    startBackEvent = currentBackEvent = backEvent;
    return true;
  }

  @override
  void handleUpdateBackGestureProgress(PredictiveBackEvent backEvent) {
    phase = .update;

    widget.route.handleUpdateBackGestureProgress(
      progress: 1 - backEvent.progress,
    );
    currentBackEvent = backEvent;
  }

  @override
  void handleCancelBackGesture() {
    phase = .cancel;

    widget.route.handleCancelBackGesture();
    startBackEvent = currentBackEvent = null;
  }

  @override
  void handleCommitBackGesture() {
    phase = .commit;

    widget.route.handleCommitBackGesture();
    startBackEvent = currentBackEvent = null;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(
    context,
    widget.route.popGestureInProgress ? phase : .idle,
    startBackEvent,
    currentBackEvent,
  );
}

class _PredictiveBackSharedElementPageTransition extends StatefulWidget {
  const _PredictiveBackSharedElementPageTransition({
    required this.isDelegatedTransition,
    required this.animation,
    required this.secondaryAnimation,
    required this.phase,
    required this.startBackEvent,
    required this.currentBackEvent,
    required this.child,
    required this.animationDuration,
  });

  final bool isDelegatedTransition;
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final _PredictiveBackPhase phase;
  final PredictiveBackEvent? startBackEvent;
  final PredictiveBackEvent? currentBackEvent;
  final Widget child;
  final Duration animationDuration;

  @override
  State<_PredictiveBackSharedElementPageTransition> createState() =>
      _PredictiveBackSharedElementPageTransitionState();
}

class _PredictiveBackSharedElementPageTransitionState
    extends State<_PredictiveBackSharedElementPageTransition>
    with SingleTickerProviderStateMixin {
  // Constants as per the motion specs
  // https://developer.android.com/design/ui/mobile/guides/patterns/predictive-back#motion-specs
  static const _kMinScale = 0.90;
  static const _kDivisionFactor = 20.0;
  static const _kMargin = 8.0;
  static const _kYPositionFactor = 0.1;

  // The duration of the commit transition.
  //
  // This is not the same as PredictiveBackPageTransitionsBuilder's duration,
  // which is the duration of widget.animation, so an Interval is used.
  //
  // Eyeballed on a Pixel 9 running Android 16.
  static const _kCommitMilliseconds = 400;
  static const Curve _kCurve = Curves.easeInOutCubicEmphasized;
  late final _kCommitInterval = Interval(
    0,
    _kCommitMilliseconds / widget.animationDuration.inMilliseconds,
    curve: _kCurve,
  );

  // todo
  // Ideally this would match the curvature of the physical Android device being
  // used, but that is not yet supported. Instead, this value is a best guess at
  // a value that looks reasonable on most devices.
  // See https://github.com/flutter/flutter/issues/97349.
  static const _kDeviceBorderRadius = 32.0;

  // Since we don't know the device border radius, this provides a smooth
  // transition between the default radius and the actual radius.
  final _borderRadiusTween = Tween<double>(
    begin: 0,
    end: _kDeviceBorderRadius,
  );

  // The route fades out after commit.
  final _opacityTween = Tween<double>(begin: 1, end: 0);

  // The route shrinks during the gesture and animates back to normal after
  // commit.
  final _scaleTween = Tween<double>(begin: 1, end: _kMinScale);

  // An animation that stays constant at zero before the commit, and after the
  // commit goes from zero to one.
  final _commitAnimation = ProxyAnimation();

  // An animation that goes from zero to a maximum of one during a predictive
  // back gesture, and then at commit, it goes from its current value to zero.
  // Used for animations that follow the gesture and then animate back to their
  // original value after commit.
  final _bounceAnimation = ProxyAnimation();
  var _lastBounceAnimationValue = 0.0;

  // An animation that proxies to widget.animation during the gesture and then
  // to _commitAnimation after the commit. So, it goes from zero to a maximum of
  // one before commit, and then after commit goes from zero to one again.
  final _animation = ProxyAnimation();

  /// The same as widget.animation but with a curve applied.
  CurvedAnimation? _curvedAnimation;

  /// The reverse of _curvedAnimation.
  CurvedAnimation? _curvedAnimationReversed;

  late Animation<Offset> _positionAnimation;

  Offset _lastDrag = Offset.zero;

  // This isn't done as an animation because it's based on the vertical drag
  // amount, not the progression of the back gesture like widget.animation is.
  double _getYShiftPosition(double screenHeight) {
    final double startTouchY = widget.startBackEvent?.touchOffset?.dy ?? 0;
    final double currentTouchY = widget.currentBackEvent?.touchOffset?.dy ?? 0;

    final double yShiftMax = (screenHeight / _kDivisionFactor) - _kMargin;

    final double rawYShift = currentTouchY - startTouchY;
    final double easedYShift =
        // This curve was eyeballed on a Pixel 9 running Android 16.
        Curves.easeOut.transform(
          clampDouble(rawYShift.abs() / screenHeight, 0, 1),
        ) *
        rawYShift.sign *
        yShiftMax;

    return clampDouble(easedYShift, -yShiftMax, yShiftMax);
  }

  void _updateAnimations(Size screenSize) {
    _animation.parent = switch (widget.phase) {
      _PredictiveBackPhase.commit => _curvedAnimationReversed,
      _ => widget.animation,
    };

    _bounceAnimation.parent = switch (widget.phase) {
      .commit => Tween<double>(
        begin: 0,
        end: _lastBounceAnimationValue,
      ).animate(_curvedAnimation!),
      _ => ReverseAnimation(widget.animation),
    };

    _commitAnimation.parent = switch (widget.phase) {
      .commit => _animation,
      _ => kAlwaysDismissedAnimation,
    };

    final double xShift = (screenSize.width / _kDivisionFactor) - _kMargin;
    _positionAnimation = _animation.drive(switch (widget.phase) {
      .commit => Tween<Offset>(
        begin: _lastDrag,
        end: Offset(screenSize.height * _kYPositionFactor, 0),
      ),
      _ => Tween<Offset>(
        // The y position before commit is given by the vertical drag, not by an
        // animation.
        begin: switch (widget.currentBackEvent?.swipeEdge) {
          .left => Offset(
            xShift,
            _getYShiftPosition(screenSize.height),
          ),
          .right => Offset(
            -xShift,
            _getYShiftPosition(screenSize.height),
          ),
          null => Offset(xShift, _getYShiftPosition(screenSize.height)),
        },
        end: Offset.zero,
      ),
    });
  }

  void _updateCurvedAnimations() {
    _curvedAnimation?.dispose();
    _curvedAnimationReversed?.dispose();
    _curvedAnimation = CurvedAnimation(
      parent: widget.animation,
      curve: _kCommitInterval,
    );
    _curvedAnimationReversed = CurvedAnimation(
      parent: ReverseAnimation(widget.animation),
      curve: _kCommitInterval,
    );
  }

  @override
  void didUpdateWidget(_PredictiveBackSharedElementPageTransition oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.animation != oldWidget.animation) {
      _updateCurvedAnimations();
    }
    if (widget.phase != oldWidget.phase && widget.phase == .commit) {
      _updateAnimations(MediaQuery.sizeOf(context));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateCurvedAnimations();
    _updateAnimations(MediaQuery.sizeOf(context));
  }

  @override
  void dispose() {
    _curvedAnimation!.dispose();
    _curvedAnimationReversed!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: widget.animation,
    builder: (context, child) {
      _lastBounceAnimationValue = _bounceAnimation.value;

      return Transform.scale(
        scale: _scaleTween.evaluate(_bounceAnimation),
        child: Transform.translate(
          offset: switch (widget.phase) {
            .commit => _positionAnimation.value,
            _ => _lastDrag = Offset(
              _positionAnimation.value.dx,
              _getYShiftPosition(MediaQuery.heightOf(context)),
            ),
          },
          child: Opacity(
            opacity: _opacityTween.evaluate(_commitAnimation),
            child: ClipRRect(
              borderRadius: .circular(
                _borderRadiusTween.evaluate(_bounceAnimation),
              ),
              child: child,
            ),
          ),
        ),
      );
    },
    child: widget.child,
  );
}
