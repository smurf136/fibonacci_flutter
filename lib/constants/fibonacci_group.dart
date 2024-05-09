import 'package:flutter/material.dart';

enum FibonacciGroup { square, circle, xMark }

extension FibonacciGroupX on FibonacciGroup {
  Widget get icon {
    switch (this) {
      case FibonacciGroup.square:
        return const Icon(Icons.square);
      case FibonacciGroup.circle:
        return const Icon(Icons.circle);
      default:
        return const Icon(Icons.close);
    }
  }
}
