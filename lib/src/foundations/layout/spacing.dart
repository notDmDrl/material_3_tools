/// @docImport 'window_size_class.dart';
library;

/// Margins are the spaces between the edge of a window area and the elements
/// within that window area.
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Flxwx04xw-1.png?alt=media&token=3a716354-4106-42c6-920c-3692da759a86)
///
/// Margin widths are defined using fixed or scaling values for each window
/// size class. To better adapt to the window, the margin width can change
/// at different breakpoints. Wider margins are more appropriate for
/// larger screens, as they create more open space around the perimeter
/// of content.
///
/// See also:
/// * [WindowSizeClass]
/// * [M3 guidelines: layout, margins](https://m3.material.io/foundations/layout/understanding-layout/spacing#0678ba2e-1bce-49b8-8591-e471d6417011)
abstract final class Margins {
  /// Baseline space between the edge of a window area and the elements
  /// within that window area for compact window class.
  ///
  /// See also:
  ///
  /// * [WindowSizeClass.compact]
  static const compact = 16;

  /// Baseline space between the edge of a window area and the elements
  /// within that window area for medium window class.
  ///
  /// See also:
  ///
  /// * [WindowSizeClass.medium]
  static const medium = 24;

  /// Baseline space between the edge of a window area and the elements
  /// within that window area for expanded window class.
  ///
  /// See also:
  ///
  /// * [WindowSizeClass.expanded]
  static const expanded = 24;

  /// Baseline space between the edge of a window area and the elements
  /// within that window area for large window class.
  ///
  /// See also:
  ///
  /// * [WindowSizeClass.large]
  static const large = 24;

  /// Baseline space between the edge of a window area and the elements
  /// within that window area for extra-large window class.
  ///
  /// See also:
  ///
  /// * [WindowSizeClass.extraLarge]
  static const extraLarge = 24;
}

/// A spacer refers to the space between two panes in a layout.
///
/// Spacers measure 24dp wide.
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Flxwx1ijr-5.png?alt=media&token=ab82125d-28cd-4500-a322-fd4c9606dd3c)
///
/// See also
///
/// * [M3 guidelines: layout, spacers](https://m3.material.io/foundations/layout/understanding-layout/spacing#cd66a766-1835-4b82-ae48-e70634fd9e6d)
abstract final class Spacers {
  /// Baseline pane spacer width.
  static const paneSpacer = 24;
}
