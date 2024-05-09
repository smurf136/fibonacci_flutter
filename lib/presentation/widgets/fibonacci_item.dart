import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/fibonacci_group.dart';

class FibonacciItem extends StatelessWidget {
  const FibonacciItem({
    super.key,
    required this.index,
    required this.fibonacci,
    required this.group,
    required this.onPressed,
    required this.bgColor,
  });

  final int index;
  final int fibonacci;
  final FibonacciGroup group;
  final VoidCallback onPressed;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: CupertinoButton(
        onPressed: onPressed,
        borderRadius: BorderRadius.zero,
        color: bgColor,
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Row(
          children: [
            Expanded(
              child: Text('index: $index, Number: $fibonacci', overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(width: 4),
            group.icon,
          ],
        ),
      ),
    );
  }
}
