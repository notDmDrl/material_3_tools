import 'package:material_ui/material_ui.dart'
    show BuildContext, Color, ColorScheme;

/// A scrim can bring focus to specific elements by increasing the visual
/// contrast of a large layered surface. Use the scrim beneath elements
/// like modals and expanded navigation menus.
///
/// Scrims use the *scrim* color role at an opacity of 32%.
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Flwynlv1e-11.png?alt=media&token=a29315d8-497f-4376-8018-f661ea795b3a)
///
/// See also:
///
/// * [M3 guidelines: scrim](https://m3.material.io/styles/elevation/applying-elevation#92b9fb39-f0c4-4829-8e4d-97ac512976aa)
abstract final class Scrim {
  /// Returns the color of scrim container of the current [ColorScheme].
  static Color of(BuildContext context) =>
      ColorScheme.of(context).scrim.withValues(
        alpha: kScrimOpacity,
      );

  /// The *scrim* color role's opacity.
  static const kScrimOpacity = 0.32;
}
