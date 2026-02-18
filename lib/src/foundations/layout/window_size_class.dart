import 'package:flutter/widgets.dart';

import 'spacing.dart';

const double _kCompactMax = 600;
const double _kMediumMax = 840;
const double _kExpandedMax = 1200;
const double _kLargeMax = 1600;

/// A window size class is an opinionated breakpoint, the window size at
/// which a layout needs to change to match available space,
/// device conventions, and ergonomics.
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fly6ugnwf-1.png?alt=media&token=da44385c-ea57-40d1-ac07-6ea0f30c1aec)
///
/// All devices fall into one of five Material Design window size classes:
/// compact, medium, expanded, large, or extra-large. Material window size
/// classes are used on Android and Web.
///
/// Rather than designing for an ever increasing number of display states,
/// focusing on window size classes sizes ensures layouts work across
/// a range of devices.
///
/// See also:
///
/// * [M3 guidelines: layout, window size classes](https://m3.material.io/foundations/layout/applying-layout/window-size-classes)
enum WindowSizeClass {
  /// Layouts for compact window size classes are for screen widths smaller
  /// than **`600dp`**.
  ///
  /// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fly7219l1-1.png?alt=media&token=67ff316b-7515-4e9f-9971-4e580290b1f2)
  ///
  /// See also:
  ///
  /// * [M3 guidelines: layout, compact window size class](https://m3.material.io/foundations/layout/applying-layout/compact)
  compact(0, _kCompactMax, Margins.compact),

  /// Layouts for medium window size classes are for screen widths from
  /// **`600dp`** to **`839dp`**.
  ///
  /// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fly72i40z-1.png?alt=media&token=4bdfcb24-0554-41d4-9f11-5d7562ba718b)
  ///
  /// See also:
  ///
  /// * [M3 guidelines: layout, medium window size class](https://m3.material.io/foundations/layout/applying-layout/medium)
  medium(_kCompactMax, _kMediumMax, Margins.medium),

  /// Layouts for expanded window size classes are for screen widths from
  /// **`840dp`** to **`1199dp`**.
  ///
  /// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fly73sadr-1.png?alt=media&token=96e86f92-c696-4404-bced-fa17c2e8f4cc)
  ///
  /// See also:
  ///
  /// * [M3 guidelines: layout, expanded window size class](https://m3.material.io/foundations/layout/applying-layout/expanded)
  expanded(_kMediumMax, _kExpandedMax, Margins.expanded),

  /// Layouts for large window size classes are for screen widths from
  /// **`1200dp`** to **`1599dp`**.
  ///
  /// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fly749cio-1.png?alt=media&token=88f87a65-e036-40ed-8a96-05bf7a12c488)
  ///
  /// See also:
  ///
  /// * [M3 guidelines: layout, large window size class](https://m3.material.io/foundations/layout/applying-layout/large-extra-large)
  large(_kExpandedMax, _kLargeMax, Margins.large),

  /// Layouts for extra-large window size classes are for screen widths of
  /// **`1600dp`** and **`larger`**.
  ///
  /// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fly749cio-1.png?alt=media&token=88f87a65-e036-40ed-8a96-05bf7a12c488)
  ///
  /// See also:
  ///
  /// * [M3 guidelines: layout, extra-large window size class](https://m3.material.io/foundations/layout/applying-layout/large-extra-large)
  extraLarge(_kLargeMax, 9999, Margins.extraLarge);

  /// Creates [WindowSizeClass].
  const WindowSizeClass(
    this.minimumBreakpoint,
    this.maximumBreakpoint,
    this.margin,
  );

  /// A minimum windows space for this window size class.
  final double minimumBreakpoint;

  /// A limit for a maximum windows space for this window size class.
  final double maximumBreakpoint;

  /// Space between the edge of a window area and the elements within that
  /// window area.
  ///
  /// See also:
  ///
  /// * [Margins]
  final double margin;

  /// The [WindowSizeClass] from the closest [MediaQuery] instance that
  /// encloses the given context.
  static WindowSizeClass of(BuildContext context) =>
      switch (MediaQuery.widthOf(context)) {
        < _kCompactMax => compact,
        <= _kCompactMax && < _kMediumMax => medium,
        <= _kMediumMax && < _kExpandedMax => expanded,
        <= _kExpandedMax && < _kLargeMax => large,
        _ => extraLarge,
      };
}
