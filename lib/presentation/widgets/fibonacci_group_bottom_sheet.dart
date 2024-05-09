import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/fibonacci_group.dart';
import '../../models/fibonacci_model.dart';

class FibonacciGroupBottomSheet extends StatelessWidget {
  const FibonacciGroupBottomSheet({
    super.key,
    required this.onSelect,
    required this.fibonacciList,
    required this.initIndex,
  });

  final void Function(int targetIndex) onSelect;
  final List<FibonacciModel> fibonacciList;
  final int initIndex;

  static Future<void> show(
    BuildContext context, {
    required void Function(int targetIndex) onSelect,
    required List<FibonacciModel> fibonacciList,
    required int initIndex,
  }) async {
    await showModalBottomSheet(
      context: context,
      builder: (_) {
        return FibonacciGroupBottomSheet(
          onSelect: onSelect,
          fibonacciList: fibonacciList,
          initIndex: initIndex,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: fibonacciList.map((e) {
              return CupertinoButton(
                onPressed: () {
                  onSelect(e.index);

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                borderRadius: BorderRadius.zero,
                color: initIndex == e.index ? Colors.green : null,
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                child: _Item(
                  index: e.index,
                  fibonacci: e.fibonacci,
                  group: e.group,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.index,
    required this.fibonacci,
    required this.group,
  });

  final int index;
  final int fibonacci;
  final FibonacciGroup group;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Number: $fibonacci',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'index: $index',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey[400]),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 4),
        group.icon,
      ],
    );
  }
}
