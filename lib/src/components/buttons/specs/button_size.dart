import 'package:flutter/material.dart';

import '/src/styles/motion/physics/curves.dart';
import '/src/styles/motion/physics/spring.dart';
import '/src/styles/shape/corner_radius_scale.dart';

typedef TextStyleResolver = TextStyle Function(TextTheme textTheme);

TextStyle _titleSmallLabel(TextTheme textTheme) => textTheme.titleSmall!;

TextStyle _titleMediumLabel(TextTheme textTheme) => textTheme.titleMedium!;

TextStyle _headlineSmallLabel(TextTheme textTheme) => textTheme.headlineSmall!;

TextStyle _headlineLargeLabel(TextTheme textTheme) => textTheme.headlineLarge!;

// https://m3.material.io/components/buttons/specs#c75be779-5a59-4748-98d4-e47fc888d0b1
@immutable
final class ButtonSize {
  const ButtonSize({
    required this.containerHeight,
    required this.outlineWidth,
    required this.labelStyle,
    required this.iconSize,
    required this.leadingSpace,
    required this.betweenIconLabelSpace,
    required this.trailingSpace,
    required this.shapeResolverRound,
    required this.shapeResolverSquare,
  });

  static const extraSmall = ButtonSize(
    containerHeight: 32,
    outlineWidth: 1,
    labelStyle: _titleSmallLabel,
    iconSize: 20,
    leadingSpace: 12,
    betweenIconLabelSpace: 4,
    trailingSpace: 12,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.small,
      WidgetState.selected: CornerRadiusScale.medium,
      WidgetState.any: CornerRadiusScale.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.small,
      WidgetState.selected: CornerRadiusScale.full,
      WidgetState.any: CornerRadiusScale.medium,
    }),
  );

  static const small = ButtonSize(
    containerHeight: 40,
    outlineWidth: 1,
    labelStyle: _titleSmallLabel,
    iconSize: 20,
    leadingSpace: 16,
    betweenIconLabelSpace: 8,
    trailingSpace: 16,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.small,
      WidgetState.selected: CornerRadiusScale.medium,
      WidgetState.any: CornerRadiusScale.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.small,
      WidgetState.selected: CornerRadiusScale.full,
      WidgetState.any: CornerRadiusScale.medium,
    }),
  );

  // custom variant
  static const smallIncreased = ButtonSize(
    containerHeight: 48,
    outlineWidth: 1,
    labelStyle: _titleMediumLabel,
    iconSize: 20,
    leadingSpace: 20,
    betweenIconLabelSpace: 8,
    trailingSpace: 20,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.medium,
      WidgetState.selected: CornerRadiusScale.large,
      WidgetState.any: CornerRadiusScale.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.medium,
      WidgetState.selected: CornerRadiusScale.full,
      WidgetState.any: CornerRadiusScale.large,
    }),
  );

  static const medium = ButtonSize(
    containerHeight: 56,
    outlineWidth: 1,
    labelStyle: _titleMediumLabel,
    iconSize: 24,
    leadingSpace: 24,
    betweenIconLabelSpace: 8,
    trailingSpace: 24,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.medium,
      WidgetState.selected: CornerRadiusScale.large,
      WidgetState.any: CornerRadiusScale.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.medium,
      WidgetState.selected: CornerRadiusScale.full,
      WidgetState.any: CornerRadiusScale.large,
    }),
  );

  static const large = ButtonSize(
    containerHeight: 96,
    outlineWidth: 2,
    labelStyle: _headlineSmallLabel,
    iconSize: 32,
    leadingSpace: 48,
    betweenIconLabelSpace: 12,
    trailingSpace: 48,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.large,
      WidgetState.selected: CornerRadiusScale.extraLarge,
      WidgetState.any: CornerRadiusScale.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.large,
      WidgetState.selected: CornerRadiusScale.full,
      WidgetState.any: CornerRadiusScale.extraLarge,
    }),
  );

  static const extraLarge = ButtonSize(
    containerHeight: 136,
    outlineWidth: 3,
    labelStyle: _headlineLargeLabel,
    iconSize: 40,
    leadingSpace: 64,
    betweenIconLabelSpace: 16,
    trailingSpace: 64,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.large,
      WidgetState.selected: CornerRadiusScale.extraLarge,
      WidgetState.any: CornerRadiusScale.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: CornerRadiusScale.large,
      WidgetState.selected: CornerRadiusScale.full,
      WidgetState.any: CornerRadiusScale.extraLarge,
    }),
  );

  final double containerHeight;
  final double outlineWidth;
  final TextStyleResolver labelStyle;
  final double iconSize;
  final double leadingSpace;
  final double betweenIconLabelSpace;
  final double trailingSpace;
  final WidgetStateMapper<BorderRadius> shapeResolverRound;
  final WidgetStateMapper<BorderRadius> shapeResolverSquare;

  // are the same for every size
  static const SpringDescription spring = MotionPhysicsSpring.standardFast;
  static const MotionPhysicsCurvePair curve = MotionPhysicsCurve.standardFast;

  ButtonSize copyWith({
    double? containerHeight,
    double? outlineWidth,
    TextStyleResolver? labelStyle,
    double? iconSize,
    double? leadingSpace,
    double? betweenIconLabelSpace,
    double? trailingSpace,
    WidgetStateMapper<BorderRadius>? shapeResolverRound,
    WidgetStateMapper<BorderRadius>? shapeResolverSquare,
  }) => ButtonSize(
    containerHeight: containerHeight ?? this.containerHeight,
    outlineWidth: outlineWidth ?? this.outlineWidth,
    labelStyle: labelStyle ?? this.labelStyle,
    iconSize: iconSize ?? this.iconSize,
    leadingSpace: leadingSpace ?? this.leadingSpace,
    betweenIconLabelSpace: betweenIconLabelSpace ?? this.betweenIconLabelSpace,
    trailingSpace: trailingSpace ?? this.trailingSpace,
    shapeResolverRound: shapeResolverRound ?? this.shapeResolverRound,
    shapeResolverSquare: shapeResolverSquare ?? this.shapeResolverSquare,
  );

  @override
  int get hashCode => Object.hash(
    containerHeight,
    outlineWidth,
    labelStyle,
    iconSize,
    leadingSpace,
    betweenIconLabelSpace,
    trailingSpace,
    shapeResolverRound,
    shapeResolverSquare,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! ButtonSize) {
      return false;
    }

    return other.containerHeight == containerHeight &&
        other.outlineWidth == outlineWidth &&
        other.labelStyle == labelStyle &&
        other.iconSize == iconSize &&
        other.leadingSpace == leadingSpace &&
        other.betweenIconLabelSpace == betweenIconLabelSpace &&
        other.trailingSpace == trailingSpace &&
        other.shapeResolverRound == other.shapeResolverRound &&
        other.shapeResolverSquare == other.shapeResolverSquare;
  }
}
