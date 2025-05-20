import 'package:flutter/material.dart'
    show Brightness, BuildContext, Theme, ThemeData;

/// Weight and grade affect a symbol’s thickness. Adjustments to grade are
/// more granular than adjustments to weight and have a smaller impact on the
/// size of the symbol.
///
/// ![](https://lh3.googleusercontent.com/Xu5xm1YUIWBAPyIHTMEHPTIpC2TeQy3ZP7dWd-8xCMJemBZpqRy9lTKhYBRuSHtmgSFPhzMuKKvbp-UdtZ50F21PO3QmqmCayv0NWoChklNCrg)
///
/// Grade is also available in some text fonts. Grade levels between text
/// and symbols can be matched for a harmonious visual effect. For example,
/// if the text font has a -25 grade value, the symbols can match it
/// with a suitable value of -25.
///
/// Grade can also compensate for visual bleed, which is when images can look
/// bigger or smaller depending on the color contrast.
/// To match the apparent icon size, the default grade for a dark icon on
/// a light background is 0, and -25 for a light icon on a dark background.
///
/// See also:
///
/// * [M3 guidelines: icon grade](https://m3.material.io/styles/icons/applying-icons#3ad55207-1cb0-43af-8092-fad2762f69f7)
abstract final class IconGrade {
  /// Returns the default grade for an icon for current [ThemeData]'s
  /// *brightness*:
  ///
  /// * 0 - for [Brightness.light];
  /// * -25 - for [Brightness.dark];
  static double of(BuildContext context) =>
      switch (Theme.brightnessOf(context)) {
        Brightness.light => kLightGrade,
        Brightness.dark => kDarkGrade,
      };

  /// The default grade for a dark icon on a light background.
  ///
  /// ![](https://lh3.googleusercontent.com/TOc_EXvnq9zoTjhR2nnjX55RX9ouKkIml5ztilwXzW-y5_IHmQ5RM9O_Nsl3YB85YA8NA0JwQ0I4ZQpJea1GwQnUSVsKXARMoYanSwGfrg4W)
  static const double kLightGrade = 0;

  /// The default grade for a light icon on a dark background.
  ///
  /// ![](https://lh3.googleusercontent.com/nuIiJpJKWF0DcAGj8YqnljdLe_aB3i7Uv1GpK4a5Qq8itZjmDtiAcJS_N1_BJMtN11rgAb9wvFWw7XH-pivtfiYW1-PvSHGZJMXfamINzTdI)
  static const double kDarkGrade = -25;
}
