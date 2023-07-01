import 'package:flutter/material.dart';

class MySpecialMagicGridView extends StatelessWidget {
  final int listCount;
  final Widget Function(int) generatedWidget;
  final WrapAlignment alignment;
  final double spacing;
  final double runSpacing;
  final Axis direction;

  const MySpecialMagicGridView({
    super.key,
    required this.listCount,
    required this.generatedWidget,
    this.alignment = WrapAlignment.center,
    this.spacing = 10,
    this.runSpacing = 10,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      spacing: spacing,
      runSpacing: runSpacing,
      direction: direction,
      children: List.generate(
        listCount,
        generatedWidget,
      ),
    );
  }
}
