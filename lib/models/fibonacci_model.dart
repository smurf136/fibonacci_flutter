import '../constants/fibonacci_group.dart';

class FibonacciModel {
  FibonacciModel({
    required this.index,
    required this.fibonacci,
    required this.group,
  });

  final int index;
  final int fibonacci;
  final FibonacciGroup group;

  @override
  String toString() => '{index: $index, fibonacci: $fibonacci, group: $group}';
}
