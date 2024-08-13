// copy of https://github.com/flutter/flutter/blob/34da366f7dc845bfc79eb03c05239ce7460d8cba/packages/flutter/lib/src/material/predictive_back_page_transitions_builder.dart

part of 'forward_and_backward.dart';

class _PredictiveBackGestureDetector extends StatefulWidget {
  const _PredictiveBackGestureDetector({
    required this.route,
    required this.builder,
  });

  final WidgetBuilder builder;
  final PredictiveBackRoute route;

  @override
  State<_PredictiveBackGestureDetector> createState() =>
      _PredictiveBackGestureDetectorState();
}

class _PredictiveBackGestureDetectorState
    extends State<_PredictiveBackGestureDetector> with WidgetsBindingObserver {
  /// True when the predictive back gesture is enabled.
  bool get _isEnabled =>
      widget.route.isCurrent && widget.route.popGestureEnabled;

  /// The back event when the gesture first started.
  PredictiveBackEvent? get startBackEvent => _startBackEvent;
  PredictiveBackEvent? _startBackEvent;
  set startBackEvent(PredictiveBackEvent? startBackEvent) {
    if (_startBackEvent != startBackEvent && mounted) {
      setState(() => _startBackEvent = startBackEvent);
    }
  }

  /// The most recent back event during the gesture.
  PredictiveBackEvent? get currentBackEvent => _currentBackEvent;
  PredictiveBackEvent? _currentBackEvent;
  set currentBackEvent(PredictiveBackEvent? currentBackEvent) {
    if (_currentBackEvent != currentBackEvent && mounted) {
      setState(() => _currentBackEvent = currentBackEvent);
    }
  }

  // Begin WidgetsBindingObserver.

  @override
  bool handleStartBackGesture(PredictiveBackEvent backEvent) {
    final gestureInProgress = !backEvent.isButtonEvent && _isEnabled;
    if (!gestureInProgress) return false;

    widget.route.handleStartBackGesture(progress: 1 - backEvent.progress);
    startBackEvent = currentBackEvent = backEvent;

    return true;
  }

  @override
  void handleUpdateBackGestureProgress(PredictiveBackEvent backEvent) {
    widget.route.handleUpdateBackGestureProgress(
      progress: 1 - backEvent.progress,
    );
    currentBackEvent = backEvent;
  }

  @override
  void handleCancelBackGesture() {
    widget.route.handleCancelBackGesture();
    startBackEvent = currentBackEvent = null;
  }

  @override
  void handleCommitBackGesture() {
    widget.route.handleCommitBackGesture();
    startBackEvent = currentBackEvent = null;
  }

  // End WidgetsBindingObserver.

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
  Widget build(BuildContext context) => widget.builder(context);
}

/// Android's predictive back page transition.
class _PredictiveBackPageTransition extends StatelessWidget {
  const _PredictiveBackPageTransition({
    required this.animation,
    required this.secondaryAnimation,
    required this.getIsCurrent,
    required this.child,
  });

  // These values were eyeballed to match the native predictive back animation
  // on a Pixel 2 running Android API 34.
  static const double _scaleFullyOpened = 1;
  static const double _scaleStartTransition = 0.8;
  static const double _opacityFullyOpened = 1;
  static const double _opacityStart = 0.8;
  static const double _weightForStartState = 80;
  static const double _weightForEndState = 100.0 - _weightForStartState;
  static const double _screenWidthDivisionFactor = 20;
  static const double _xShiftAdjustment = 8;

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final ValueGetter<bool> getIsCurrent;
  final Widget child;

  double _getXShift(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;

    return (screenWidth / _screenWidthDivisionFactor) - _xShiftAdjustment;
  }

  Widget _secondaryAnimatedBuilder(BuildContext context, Widget? child) {
    // These values were eyeballed from the Settings app on a physical Pixel 6
    // running Android 14.
    final isCurrent = getIsCurrent();
    final xShiftTween = isCurrent
        ? ConstantTween<double>(0)
        : Tween<double>(begin: _getXShift(context), end: 0);
    final Animatable<double> scaleTween = isCurrent
        ? ConstantTween<double>(_scaleFullyOpened)
        : Tween<double>(
            begin: _scaleStartTransition,
            end: _scaleFullyOpened,
          );
    final Animatable<double> fadeTween =
        TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: _opacityFullyOpened,
          end: _opacityStart,
        ),
        weight: _weightForEndState,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: _opacityFullyOpened,
          end: _opacityStart,
        ),
        weight: _weightForStartState,
      ),
    ]);

    return Transform.translate(
      offset: Offset(
        xShiftTween.animate(secondaryAnimation).value,
        0,
      ),
      child: Transform.scale(
        scale: scaleTween.animate(secondaryAnimation).value,
        child: Opacity(
          opacity: fadeTween.animate(secondaryAnimation).value,
          child: child,
        ),
      ),
    );
  }

  Widget _primaryAnimatedBuilder(BuildContext context, Widget? child) {
    // These values were eyeballed from the Settings app on a physical Pixel 6
    // running Android 14.
    final xShift = _getXShift(context);
    final xShiftTween = Tween<double>(begin: 0, end: 1);
    final Animatable<double> scaleTween =
        TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.98, end: 0.98),
        weight: _weightForStartState,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.98, end: 1),
        weight: _weightForEndState,
      ),
    ]);
    final Animatable<double> fadeTween =
        TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 0.05),
        weight: 76,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.05, end: 0.95),
        weight: 4,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.95, end: 1),
        weight: _weightForEndState,
      ),
    ]);

    return Transform.translate(
      offset: Offset(
        xShift - xShiftTween.animate(animation).value * xShift,
        0,
      ),
      child: Transform.scale(
        scale: scaleTween.animate(animation).value,
        child: Opacity(
          opacity: fadeTween.animate(animation).value,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: secondaryAnimation,
        builder: _secondaryAnimatedBuilder,
        child: AnimatedBuilder(
          animation: animation,
          builder: _primaryAnimatedBuilder,
          child: child,
        ),
      );
}
