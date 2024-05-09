import 'package:flutter/material.dart';

class UtilityScrolling {
  static void scrollingTo(ScrollController controller, int index) {
    double targetOffset = index * 42;

    controller.animateTo(
      targetOffset,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
    );
  }
}
