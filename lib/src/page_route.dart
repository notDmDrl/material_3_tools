import 'package:flutter/cupertino.dart' show CupertinoRouteTransitionMixin;
import 'package:flutter/material.dart';

import 'motion/transition/forward_and_backward.dart';

/// A modal route that replaces the entire screen with a platform-adaptive M3
/// transition.
///
/// The `fullscreenDialog` property specifies whether the incoming route is a
/// fullscreen modal dialog. On iOS, those routes animate from the bottom to the
/// top rather than horizontally.
///
/// The type `T` specifies the return type of the route which can be supplied as
/// the route is popped from the stack via [Navigator.pop] by providing the
/// optional `result` argument.
///
/// See also:
///
/// [MaterialPageRoute] - the default material modal route.
final class M3MaterialPageRoute<T> extends PageRoute<T>
    with _M3MaterialRouteTransitionMixin<T> {
  /// Creates a [M3MaterialPageRoute].
  M3MaterialPageRoute({
    required this.builder,
    super.settings,
    super.fullscreenDialog,
  }) : maintainState = true,
       super(barrierDismissible: false, allowSnapshotting: true);

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  final bool maintainState;

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';
}

/// A mixin that provides platform-adaptive M3 transitions for a [PageRoute].
///
/// For Android, the transition is [ForwardAndBackwardTransition].
///
/// For iOS, the transition is the one provided by
/// [CupertinoPageTransitionsBuilder].
mixin _M3MaterialRouteTransitionMixin<T> on PageRoute<T> {
  /// Builds the primary contents of the route.
  @protected
  Widget buildContent(BuildContext context);

  @override
  Duration get transitionDuration => Durations.medium4;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool canTransitionTo(
    TransitionRoute<dynamic> nextRoute,
  ) => switch (nextRoute) {
    _M3MaterialRouteTransitionMixin(:final fullscreenDialog) =>
      !fullscreenDialog,
    MaterialRouteTransitionMixin(:final fullscreenDialog) => !fullscreenDialog,
    CupertinoRouteTransitionMixin(:final fullscreenDialog) => !fullscreenDialog,
    PopupRoute() => false,
    _ => true,
  };

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final result = buildContent(context);

    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  static const _kTransitionsTheme = PageTransitionsTheme(builders: {
    TargetPlatform.android: ForwardAndBackwardTransitionsBuilder(),
    TargetPlatform.windows: ForwardAndBackwardTransitionsBuilder(),
    TargetPlatform.linux: ForwardAndBackwardTransitionsBuilder(),
    TargetPlatform.fuchsia: ForwardAndBackwardTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => _kTransitionsTheme.buildTransitions<T>(
    this,
    context,
    animation,
    secondaryAnimation,
    child,
  );
}
