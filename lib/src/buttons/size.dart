import 'package:flutter/material.dart'
    show
        BorderRadius,
        SpringDescription,
        TextStyle,
        TextTheme,
        WidgetState,
        WidgetStateMapper,
        immutable;

import '/src/motion/curves.dart';
import '/src/motion/spring.dart';
import '/src/shape/shape.dart';

typedef TextStyleResolver = TextStyle Function(TextTheme textTheme);

TextStyle _titleSmallLabel(TextTheme textTheme) => textTheme.titleSmall!;

TextStyle _titleMediumLabel(TextTheme textTheme) => textTheme.titleMedium!;

TextStyle _headlineSmallLabel(TextTheme textTheme) => textTheme.headlineSmall!;

TextStyle _headlineLargeLabel(TextTheme textTheme) => textTheme.headlineLarge!;

// https://m3.material.io/components/buttons/specs#c75be779-5a59-4748-98d4-e47fc888d0b1
@immutable
final class ExpressiveButtonSize {
  const ExpressiveButtonSize({
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

  static const extraSmall = ExpressiveButtonSize(
    containerHeight: 32,
    outlineWidth: 1,
    labelStyle: _titleSmallLabel,
    iconSize: 20,
    leadingSpace: 12,
    betweenIconLabelSpace: 8,
    trailingSpace: 12,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: Shape.small,
      WidgetState.selected: Shape.medium,
      WidgetState.any: Shape.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: Shape.small,
      WidgetState.selected: Shape.full,
      WidgetState.any: Shape.medium,
    }),
  );

  static const small = ExpressiveButtonSize(
    containerHeight: 40,
    outlineWidth: 1,
    labelStyle: _titleSmallLabel,
    iconSize: 20,
    leadingSpace: 16,
    betweenIconLabelSpace: 8,
    trailingSpace: 16,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: Shape.small,
      WidgetState.selected: Shape.medium,
      WidgetState.any: Shape.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: Shape.small,
      WidgetState.selected: Shape.full,
      WidgetState.any: Shape.medium,
    }),
  );

  // custom variant
  static const smallIncreased = ExpressiveButtonSize(
    containerHeight: 48,
    outlineWidth: 1,
    labelStyle: _titleMediumLabel,
    iconSize: 20,
    leadingSpace: 20,
    betweenIconLabelSpace: 8,
    trailingSpace: 20,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: Shape.medium,
      WidgetState.selected: Shape.large,
      WidgetState.any: Shape.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: Shape.medium,
      WidgetState.selected: Shape.full,
      WidgetState.any: Shape.large,
    }),
  );

  static const medium = ExpressiveButtonSize(
    containerHeight: 56,
    outlineWidth: 1,
    labelStyle: _titleMediumLabel,
    iconSize: 24,
    leadingSpace: 24,
    betweenIconLabelSpace: 8,
    trailingSpace: 24,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: Shape.medium,
      WidgetState.selected: Shape.large,
      WidgetState.any: Shape.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: Shape.medium,
      WidgetState.selected: Shape.full,
      WidgetState.any: Shape.large,
    }),
  );

  static const large = ExpressiveButtonSize(
    containerHeight: 96,
    outlineWidth: 2,
    labelStyle: _headlineSmallLabel,
    iconSize: 32,
    leadingSpace: 48,
    betweenIconLabelSpace: 12,
    trailingSpace: 48,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: Shape.large,
      WidgetState.selected: Shape.extraLarge,
      WidgetState.any: Shape.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: Shape.large,
      WidgetState.selected: Shape.full,
      WidgetState.any: Shape.extraLarge,
    }),
  );

  static const extraLarge = ExpressiveButtonSize(
    containerHeight: 136,
    outlineWidth: 3,
    labelStyle: _headlineLargeLabel,
    iconSize: 40,
    leadingSpace: 64,
    betweenIconLabelSpace: 16,
    trailingSpace: 64,
    shapeResolverRound: WidgetStateMapper({
      WidgetState.pressed: Shape.large,
      WidgetState.selected: Shape.extraLarge,
      WidgetState.any: Shape.full,
    }),
    shapeResolverSquare: WidgetStateMapper({
      WidgetState.pressed: Shape.large,
      WidgetState.selected: Shape.full,
      WidgetState.any: Shape.extraLarge,
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
  static const SpringDescription spring = ExpressiveSpring.standardSpatialFast;
  static const ExCurve curve = ExpressiveCurve.standardSpatialFast;

  ExpressiveButtonSize copyWith({
    double? containerHeight,
    double? outlineWidth,
    TextStyleResolver? labelStyle,
    double? iconSize,
    double? leadingSpace,
    double? betweenIconLabelSpace,
    double? trailingSpace,
    WidgetStateMapper<BorderRadius>? shapeResolverRound,
    WidgetStateMapper<BorderRadius>? shapeResolverSquare,
  }) => ExpressiveButtonSize(
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
    if (other is! ExpressiveButtonSize) {
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
