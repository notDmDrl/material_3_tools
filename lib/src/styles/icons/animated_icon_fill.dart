import 'dart:async';

import 'package:flutter/material.dart';

/// Signature for the callback invoked when [AnimatedIconFill]s selection state
/// changes.
///
/// Used by [AnimatedIconFill.builder].
typedef AnimatedIconFillBuilder =
    Widget Function(
      BuildContext context,
      double fill,
    );

/// An [Icon] that animates its [Icon.fill] value.
///
/// For the [Icon] to animate its *fill* value, the icons font should support
/// customisation of the *fill* value.
///
/// To indicate that [AnimatedIconFill] is selected, set [isSelected] value to
/// `true`.
///
/// See also:
///
/// Selectable icon inside of [NavigationBar] in M3 docs:
/// <https://m3.material.io/styles/icons/applying-icons#750a6f13-39d8-4fe5-a035-047b88a16514>
class AnimatedIconFill extends StatefulWidget {
  const AnimatedIconFill({
    super.key,
    required this.builder,
    required this.isSelected,
    required this.duration,
    this.reverseDuration,
    required this.curve,
    this.reverseCurve,
    this.animateReverse = true,
  });

  /// Builder that provides [BuildContext] as well as *fill* value to pass to
  /// any custom icon widget.
  final AnimatedIconFillBuilder builder;

  /// Whether this icon is selected and should be fully filled.
  final bool isSelected;

  /// The duration of icon's fill animation.
  final Duration duration;

  /// The duration of icon's reverse fill animation.
  ///
  /// If null, [duration] is used instead.
  ///
  /// Defaults to `null`.
  final Duration? reverseDuration;

  /// The curve of icon's fill animation.
  final Curve curve;

  /// The curve of icon's reverse fill animation.
  ///
  /// If null, [Curve.flipped] of [curve] is used instead.
  ///
  /// Defaults to `null`.
  final Curve? reverseCurve;

  /// Whether to animate an icon's fill value if [isSelected] was set to `false`.
  ///
  /// If `false`, the icon's fill will immediately "jump" to fill value of 0
  /// upon [isSelected] being set to `false`.
  ///
  /// Defaults to `true`.
  final bool animateReverse;

  @override
  State<AnimatedIconFill> createState() => _AnimatedIconFillState();
}

class _AnimatedIconFillState extends State<AnimatedIconFill>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  CurvedAnimation? animation;

  @override
  void initState() {
    super.initState();

    final Duration duration = widget.duration;
    controller = AnimationController(
      vsync: this,
      duration: duration,
      reverseDuration: widget.reverseDuration ?? duration,
      value: widget.isSelected ? 1 : 0,
    );

    final Curve curve = widget.curve;
    animation = CurvedAnimation(
      parent: controller!,
      curve: curve,
      reverseCurve: widget.reverseCurve ?? curve.flipped,
    );
  }

  @override
  void didUpdateWidget(AnimatedIconFill oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        unawaited(controller?.forward());
      } else {
        if (widget.animateReverse) {
          unawaited(controller?.reverse());
        } else {
          controller?.reset();
        }
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    controller = null;

    animation?.dispose();
    animation = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: animation!,
    builder: (context, _) => widget.builder(
      context,
      animation!.value,
    ),
  );
}
