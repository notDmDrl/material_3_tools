import 'package:flutter/material.dart';

import '/src/styles/motion/easing_and_duration.dart';

/// Signature for the callback invoked when [SelectableIcon]s selection state
/// changes.
///
/// Used by [SelectableIcon.icon].
typedef SelectableIconBuilder =
    Widget Function(BuildContext context, double fill);

/// An [Icon] that animates its [Icon.fill] value.
///
/// For the [Icon] to animate its *fill* value, the icons font should support
/// customisation of the *fill* value.
///
/// To indicate that [SelectableIcon] is selected, set [selected] value to
/// `true`.
///
/// Some properties, such as [duration] and [curve] have default animation
/// values of [NavigationBar] and [TopLevelTransition].
///
/// See also:
///
/// Selectable icon inside of [NavigationBar] in M3 docs:
/// <https://m3.material.io/styles/icons/applying-icons#750a6f13-39d8-4fe5-a035-047b88a16514>
@immutable
final class SelectableIcon extends StatefulWidget {
  /// Creates [SelectableIcon].
  const SelectableIcon({
    super.key,
    required this.icon,
    required this.selected,
    this.duration = Durations.medium2,
    this.curve = MaterialEasing.emphasized,
    this.animateReverse = true,
  });

  /// Builder that provides [BuildContext] as well as *fill* value to pass to
  /// any custom icon widget.
  final SelectableIconBuilder icon;

  /// Whether this icon is selected and should be fully filled.
  final bool selected;

  /// The duration of icon's fill animation.
  ///
  /// Defaults to [Durations.medium2].
  final Duration duration;

  /// The curve of icon's fill animation.
  ///
  /// Defaults to [Curves.easeInOutCubicEmphasized] ([NavigationBar]s curve).
  final Curve curve;

  /// Whether to animate an icon's fill value if [selected] was set to `false`.
  ///
  /// If `false`, the icon's fill will immediately "jump" to fill value of 0
  /// upon [selected] being set to `false`.
  ///
  /// Defaults to `true`.
  final bool animateReverse;

  @override
  State<SelectableIcon> createState() => _SelectableIconState();
}

class _SelectableIconState extends State<SelectableIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: widget.selected ? 1 : 0,
    );
  }

  @override
  void didUpdateWidget(SelectableIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      if (widget.selected) {
        controller.forward();
      } else {
        if (widget.animateReverse) {
          controller.reverse();
        } else {
          controller.reset();
        }
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: CurvedAnimation(
      parent: controller,
      curve: widget.curve,
      reverseCurve: widget.curve.flipped,
    ),
    builder: (context, _) => widget.icon(context, controller.value),
  );
}
