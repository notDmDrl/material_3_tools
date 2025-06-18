/// Opacity and alpha constants which represent Material 3 [state layer system](https://m3.material.io/foundations/interaction/states/state-layers).
///
/// ![](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Fly2qh1yi-1p_State%20Layers_1.png?alt=media&token=40e0a636-b5f9-4547-a0ad-90cccc333d70)
///
/// The state layer uses a fixed percentage for the opacity for each state.
/// A state layer uses the color used by content (usually the [on color](https://m3.material.io/foundations/interaction/states/state-layers#9514691a-23ca-46a9-a544-36f8bcb2e260))
/// and the percentage opacity for its respective state.
///
/// See also:
///
/// * [M3 guidelines: state layer tokens](https://m3.material.io/foundations/interaction/states/state-layers#bf9b84b2-690c-44b2-8429-8c42dc012d43)
abstract final class StateLayerToken {
  /// Baseline on-hover opacity that should be applied to the "on" container
  /// color role.
  ///
  /// See also:
  ///
  /// [hoverAlpha], the same value, but in alpha instead.
  static const hoverOpacity = 0.08;

  /// Baseline on-hover alpha that should be applied to the "on" container
  /// color role.
  ///
  /// See also:
  ///
  /// [hoverOpacity], the same value, but in opacity percentage instead.
  static const hoverAlpha = 0x14;

  /// Baseline on-focus opacity that should be applied to the "on" container
  /// color role.
  ///
  /// See also:
  ///
  /// [focusAlpha], the same value, but in alpha instead.
  static const focusOpacity = 0.1;

  /// Baseline on-focus alpha that should be applied to the "on" container
  /// color role.
  ///
  /// See also:
  ///
  /// [focusOpacity], the same value, but in opacity percentage instead.
  static const focusAlpha = 0x1A;

  /// Baseline on-press opacity that should be applied to the "on" container
  /// color role.
  ///
  /// See also:
  ///
  /// [pressAlpha], the same value, but in alpha instead.
  static const pressOpacity = 0.1;

  /// Baseline on-press alpha that should be applied to the "on" container
  /// color role.
  ///
  /// See also:
  ///
  /// [pressOpacity], the same value, but in opacity percentage instead.
  static const pressAlpha = 0x1A;

  /// Baseline on-drag opacity that should be applied to the "on" container
  /// color role.
  ///
  /// See also:
  ///
  /// [dragAlpha], the same value, but in alpha instead.
  static const dragOpacity = 0.16;

  /// Baseline on-drag alpha that should be applied to the "on" container
  /// color role.
  ///
  /// See also:
  ///
  /// [dragOpacity], the same value, but in opacity percentage instead.
  static const dragAlpha = 0x29;
}
