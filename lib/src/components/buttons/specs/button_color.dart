import 'package:flutter/material.dart';

final class ButtonColor {
  const ButtonColor({
    required this.container,
    required this.shadow,
    required this.elevation,
    required this.label,
    required this.icon,
  });

  final WidgetStateProperty<Color?> container;
  final WidgetStateProperty<Color?> shadow;
  final WidgetStateProperty<double> elevation;
  final WidgetStateProperty<Color?> label;
  final WidgetStateProperty<Color?> icon;
}
