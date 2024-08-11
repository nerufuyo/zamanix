import 'package:flutter/material.dart';

extension SpacingList on List<Widget> {
  List<Widget> withSpacing(
    double spacing, {
    bool isVertical = true,
  }) {
    if (isEmpty) return this;

    final spaceWidgets = <Widget>[];
    final spacer =
        isVertical ? SizedBox(height: spacing) : SizedBox(width: spacing);

    final itemsExceptLast = take(length - 1);

    for (final item in itemsExceptLast) {
      spaceWidgets.add(item);
      spaceWidgets.add(spacer);
    }
    spaceWidgets.add(last);

    return spaceWidgets;
  }
}
