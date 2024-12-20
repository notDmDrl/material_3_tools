import 'package:flutter/cupertino.dart' show DefaultCupertinoLocalizations;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import 'page_route.dart';

// Copied from [MaterialApp] file
const _kErrorTextStyle = TextStyle(
  color: Color(0xD0FF0000),
  fontFamily: 'monospace',
  fontSize: 48,
  fontWeight: FontWeight.w900,
  decoration: TextDecoration.underline,
  decorationColor: Color(0xFFFFFF00),
  decorationStyle: TextDecorationStyle.double,
  debugLabel: 'fallback style; consider putting your text in a Material',
);

/// A copy of [MaterialApp] with some M3 defaults used.
@immutable
@experimental
class M3MaterialApp extends StatefulWidget {
  /// Creates a M3 styled [MaterialApp].
  ///
  /// At least one of [home], [routes], [onGenerateRoute], or [builder] must be
  /// non-null. If only [routes] is given, it must include an entry for the
  /// [Navigator.defaultRouteName] (`/`), since that is the route used when the
  /// application is launched with an intent that specifies an otherwise
  /// unsupported route.
  ///
  /// This class creates an instance of [WidgetsApp].
  const M3MaterialApp({
    super.key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.onNavigationNotification,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.themeAnimationStyle,
  });

  /// See [MaterialApp.navigatorKey].
  final GlobalKey<NavigatorState>? navigatorKey;

  /// See [MaterialApp.scaffoldMessengerKey].
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  /// See [MaterialApp.home].
  final Widget? home;

  /// See [MaterialApp.routes].
  final Map<String, WidgetBuilder> routes;

  /// See [MaterialApp.initialRoute].
  final String? initialRoute;

  /// See [MaterialApp.onGenerateRoute].
  final RouteFactory? onGenerateRoute;

  /// See [MaterialApp.onGenerateInitialRoutes].
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// See [MaterialApp.onUnknownRoute].
  final RouteFactory? onUnknownRoute;

  /// See [MaterialApp.onNavigationNotification].
  final NotificationListenerCallback<NavigationNotification>?
  onNavigationNotification;

  /// See [MaterialApp.navigatorObservers].
  final List<NavigatorObserver> navigatorObservers;

  /// See [MaterialApp.builder].
  final TransitionBuilder? builder;

  /// See [MaterialApp.title].
  final String title;

  /// See [MaterialApp.onGenerateTitle].
  final GenerateAppTitle? onGenerateTitle;

  /// See [MaterialApp.theme].
  final ThemeData? theme;

  /// See [MaterialApp.darkTheme].
  final ThemeData? darkTheme;

  /// See [MaterialApp.highContrastTheme].
  final ThemeData? highContrastTheme;

  /// See [MaterialApp.highContrastDarkTheme].
  final ThemeData? highContrastDarkTheme;

  /// See [MaterialApp.themeMode].
  final ThemeMode? themeMode;

  /// See [MaterialApp.themeAnimationDuration].
  final Duration themeAnimationDuration;

  /// See [MaterialApp.themeAnimationCurve].
  final Curve themeAnimationCurve;

  /// See [MaterialApp.color].
  final Color? color;

  /// See [MaterialApp.locale].
  final Locale? locale;

  /// See [MaterialApp.localizationsDelegates].
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// See [MaterialApp.localeListResolutionCallback].
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// See [MaterialApp.localeResolutionCallback].
  final LocaleResolutionCallback? localeResolutionCallback;

  /// See [MaterialApp.supportedLocales].
  final Iterable<Locale> supportedLocales;

  /// See [MaterialApp.showPerformanceOverlay].
  final bool showPerformanceOverlay;

  /// See [MaterialApp.checkerboardRasterCacheImages].
  final bool checkerboardRasterCacheImages;

  /// See [MaterialApp.checkerboardOffscreenLayers].
  final bool checkerboardOffscreenLayers;

  /// See [MaterialApp.showSemanticsDebugger].
  final bool showSemanticsDebugger;

  /// See [MaterialApp.debugShowCheckedModeBanner].
  final bool debugShowCheckedModeBanner;

  /// See [MaterialApp.shortcuts].
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// See [MaterialApp.actions].
  final Map<Type, Action<Intent>>? actions;

  /// See [MaterialApp.restorationScopeId].
  final String? restorationScopeId;

  /// See [MaterialApp.scrollBehavior].
  final ScrollBehavior? scrollBehavior;

  /// See [MaterialApp.debugShowMaterialGrid].
  final bool debugShowMaterialGrid;

  /// See [MaterialApp.themeAnimationStyle].
  final AnimationStyle? themeAnimationStyle;

  @override
  State<M3MaterialApp> createState() => _M3MaterialAppState();

  /// The [HeroController] used for Material page transitions.
  ///
  /// Used by the [M3MaterialApp].
  static HeroController createMaterialHeroController() => HeroController(
    createRectTween:
        (begin, end) => MaterialRectArcTween(begin: begin, end: end),
  );
}

class _M3MaterialAppState extends State<M3MaterialApp> {
  late HeroController _heroController;

  @override
  void initState() {
    super.initState();

    _heroController = M3MaterialApp.createMaterialHeroController();
  }

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  Iterable<LocalizationsDelegate<dynamic>> get _localizationsDelegates =>
      <LocalizationsDelegate<dynamic>>[
        if (widget.localizationsDelegates != null)
          ...widget.localizationsDelegates!,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ];

  ThemeData _themeBuilder(BuildContext context) {
    final Brightness platformBrightness = MediaQuery.platformBrightnessOf(
      context,
    );
    final bool highContrast = MediaQuery.highContrastOf(context);

    final ThemeMode mode = widget.themeMode ?? ThemeMode.system;

    final bool useDarkTheme =
        mode == ThemeMode.dark ||
        (mode == ThemeMode.system && platformBrightness == Brightness.dark);

    ThemeData? theme;

    if (useDarkTheme && highContrast && widget.highContrastDarkTheme != null) {
      theme = widget.highContrastDarkTheme;
    } else if (useDarkTheme && widget.darkTheme != null) {
      theme = widget.darkTheme;
    } else if (highContrast && widget.highContrastTheme != null) {
      theme = widget.highContrastTheme;
    }

    return theme ?? widget.theme ?? ThemeData.light(useMaterial3: true);
  }

  Widget _materialBuilder(BuildContext context, Widget? child) {
    final ThemeData theme = _themeBuilder(context);
    final Color effectiveSelectionColor =
        theme.textSelectionTheme.selectionColor ??
        theme.colorScheme.primary.withValues(alpha: 0.40);
    final Color effectiveCursorColor =
        theme.textSelectionTheme.cursorColor ?? theme.colorScheme.primary;

    Widget childWidget = child ?? const SizedBox.shrink();

    if (widget.themeAnimationStyle != AnimationStyle.noAnimation) {
      if (widget.builder != null) {
        childWidget = Builder(
          builder: (context) => widget.builder!(context, child),
        );
      }
      childWidget = AnimatedTheme(
        data: theme,
        duration:
            widget.themeAnimationStyle?.duration ??
            widget.themeAnimationDuration,
        curve: widget.themeAnimationStyle?.curve ?? widget.themeAnimationCurve,
        child: childWidget,
      );
    } else {
      childWidget = Theme(data: theme, child: childWidget);
    }

    return ScaffoldMessenger(
      key: widget.scaffoldMessengerKey,
      child: DefaultSelectionStyle(
        selectionColor: effectiveSelectionColor,
        cursorColor: effectiveCursorColor,
        child: childWidget,
      ),
    );
  }

  KeyEventResult onKeyEvent(FocusNode node, KeyEvent event) {
    if ((event is! KeyDownEvent && event is! KeyRepeatEvent) ||
        event.logicalKey != LogicalKeyboardKey.escape) {
      return KeyEventResult.ignored;
    }
    return Tooltip.dismissAllToolTips()
        ? KeyEventResult.handled
        : KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final Color materialColor =
        widget.color ?? widget.theme?.primaryColor ?? Colors.blue;

    Widget result = WidgetsApp(
      key: GlobalObjectKey(this),
      navigatorKey: widget.navigatorKey,
      navigatorObservers: widget.navigatorObservers,
      pageRouteBuilder:
          <T>(settings, builder) =>
              M3MaterialPageRoute<T>(settings: settings, builder: builder),
      home: widget.home,
      routes: widget.routes,
      initialRoute: widget.initialRoute,
      onGenerateRoute: widget.onGenerateRoute,
      onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
      onUnknownRoute: widget.onUnknownRoute,
      onNavigationNotification: widget.onNavigationNotification,
      builder: _materialBuilder,
      title: widget.title,
      onGenerateTitle: widget.onGenerateTitle,
      textStyle: _kErrorTextStyle,
      color: materialColor,
      locale: widget.locale,
      localizationsDelegates: _localizationsDelegates,
      localeResolutionCallback: widget.localeResolutionCallback,
      localeListResolutionCallback: widget.localeListResolutionCallback,
      supportedLocales: widget.supportedLocales,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      showSemanticsDebugger: widget.showSemanticsDebugger,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      shortcuts: widget.shortcuts,
      actions: widget.actions,
      restorationScopeId: widget.restorationScopeId,
    );

    result = Focus(
      canRequestFocus: false,
      onKeyEvent: onKeyEvent,
      child: result,
    );

    assert(() {
      if (widget.debugShowMaterialGrid) {
        result = GridPaper(
          color: const Color(0xE0F9BBE0),
          interval: 8,
          subdivisions: 1,
          child: result,
        );
      }
      return true;
    }(), 'Shows material grid in debug mode');

    return ScrollConfiguration(
      behavior: widget.scrollBehavior ?? const MaterialScrollBehavior(),
      child: HeroControllerScope(controller: _heroController, child: result),
    );
  }
}
