import 'package:flutter/cupertino.dart' show CupertinoRouteTransitionMixin;
import 'package:flutter/material.dart';

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
@Deprecated('')
final class M3MaterialPageRoute<T> extends PageRoute<T>
    with _M3MaterialRouteTransitionMixin<T> {
  /// Creates a [M3MaterialPageRoute] with short 300ms duration transition.
  @Deprecated('')
  M3MaterialPageRoute({
    required this.builder,
    super.settings,
    super.fullscreenDialog,
  }) : maintainState = true,
       materialTransitionDuration = Durations.medium2,
       super(barrierDismissible: false, allowSnapshotting: true);

  /// Creates a [M3MaterialPageRoute] with a long 800ms duration transition.
  @Deprecated('')
  M3MaterialPageRoute.long({
    required this.builder,
    super.settings,
    super.fullscreenDialog,
  }) : maintainState = true,
       materialTransitionDuration = Durations.extralong2,
       super(barrierDismissible: false, allowSnapshotting: true);

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  final bool maintainState;

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';

  @override
  final Duration materialTransitionDuration;
}

/// A mixin that provides platform-adaptive M3 transitions for a [PageRoute].
///
/// For Android, the transition is [FadeForwardsPageTransitionsBuilder].
///
/// For iOS, the transition is the one provided by
/// [CupertinoPageTransitionsBuilder].
mixin _M3MaterialRouteTransitionMixin<T> on PageRoute<T> {
  /// Builds the primary contents of the route.
  @protected
  Widget buildContent(BuildContext context);

  /// Duration for FadeForwardsPageTransitionsBuilder;
  @protected
  Duration get materialTransitionDuration;

  @override
  Duration get transitionDuration => _getTransitionDuration(navigator!.context);

  @override
  Duration get reverseTransitionDuration => transitionDuration;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  DelegatedTransitionBuilder? get delegatedTransition => _delegatedTransition;

  static Widget? _delegatedTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    bool allowSnapshotting,
    Widget? child,
  ) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    final TargetPlatform platform = Theme.of(context).platform;
    final DelegatedTransitionBuilder? themeDelegatedTransition = theme
        .delegatedTransition(platform);

    return themeDelegatedTransition?.call(
      context,
      animation,
      secondaryAnimation,
      allowSnapshotting,
      child,
    );
  }

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    final bool nextRouteIsNotFullscreen =
        (nextRoute is! PageRoute<T>) || !nextRoute.fullscreenDialog;

    final bool nextRouteHasDelegatedTransition =
        nextRoute is ModalRoute<T> && nextRoute.delegatedTransition != null;

    return nextRouteIsNotFullscreen &&
        ((nextRoute is _M3MaterialRouteTransitionMixin) ||
            nextRouteHasDelegatedTransition);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = buildContent(context);

    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  Duration _getTransitionDuration(BuildContext context) => switch (Theme.of(
    context,
  ).platform) {
    TargetPlatform.iOS ||
    TargetPlatform.macOS => CupertinoRouteTransitionMixin.kTransitionDuration,
    _ => materialTransitionDuration,
  };

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;

    return theme.buildTransitions<T>(
      this,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
