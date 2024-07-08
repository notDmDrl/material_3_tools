import 'package:flutter/material.dart'
    show
        Navigator,
        NavigatorState,
        RouteSettings,
        WidgetBuilder,
        optionalTypeArgs;

import '../page_route.dart';

/// Set of Material 3 styled route actions.
///
/// To use, call [Navigator.of] with the desired action.
extension NavigatorStateX on NavigatorState {
  /// Push the given route onto the navigator.
  ///
  /// The route transition is defined by [M3MaterialPageRoute].
  ///
  /// The `T` type argument is the type of the return value of the route.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// Future<void> openPage(BuildContext context) async {
  ///   await Navigator.of(context).m3Push<void>(
  ///     builder: (context) => const Page(),
  ///   );
  /// }
  /// ```
  @optionalTypeArgs
  Future<T?> m3push<T extends Object?>({
    required WidgetBuilder builder,
    bool fullscreenDialog = false,
    RouteSettings? settings,
  }) =>
      push(
        M3MaterialPageRoute<T>(
          builder: builder,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  /// Replace the current route of the navigator by pushing the given route and
  /// then disposing the previous route once the new route has finished
  /// animating in.
  ///
  /// The route transition is defined by [M3MaterialPageRoute].
  ///
  /// The `T` type argument is the type of the return value of the new route,
  /// and `TO` is the type of the return value of the old route.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// Future<void> openPage(BuildContext context) async {
  ///   await Navigator.of(context).m3pushReplacement<void, void>(
  ///     builder: (context) => const Page(),
  ///   );
  /// }
  /// ```
  @optionalTypeArgs
  Future<T?> m3pushReplacement<T extends Object?, TO extends Object?>({
    required WidgetBuilder builder,
    bool fullscreenDialog = false,
    RouteSettings? settings,
    TO? result,
  }) =>
      pushReplacement<T, TO>(
        M3MaterialPageRoute<T>(
          builder: builder,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        ),
        result: result,
      );
}
