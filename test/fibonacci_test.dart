// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fibonacci_flutter/utils/gen_fibonacci.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Fibonacci Generate', () {
    final response = GenFibonacci.generateFibonacci(5);

    expect(response.length, 5);
    expect(response, [0, 1, 1, 2, 3]);
  });
}
