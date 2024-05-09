import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/fibonacci_group.dart';
import '../../models/fibonacci_model.dart';
import '../../utils/gen_fibonacci.dart';
import '../../utils/scolling.dart';
import '../widgets/fibonacci_group_bottom_sheet.dart';
import '../widgets/fibonacci_item.dart';

class FibonacciPage extends StatefulWidget {
  FibonacciPage({
    super.key,
    this.initialScrollController,
    this.amountOfGenerateFibonacc,
  });

  ScrollController? initialScrollController;
  int? amountOfGenerateFibonacc;

  @override
  State<FibonacciPage> createState() => _FibonacciPageState();
}

class _FibonacciPageState extends State<FibonacciPage> {
  late ScrollController scrollController;

  List<FibonacciModel> fibonacciList = [];

  int targetIndex = -1;

  @override
  void initState() {
    scrollController = widget.initialScrollController ?? ScrollController();
    final _listFibonacci = GenFibonacci.generateFibonacci(widget.amountOfGenerateFibonacc ?? 40);

    for (var i = 0; i < _listFibonacci.length; i++) {
      fibonacciList.add(FibonacciModel(
        index: i,
        fibonacci: _listFibonacci[i],
        group: FibonacciGroup.values[Random().nextInt(3)],
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fibonacci', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
            children: fibonacciList.isEmpty
                ? [const Center(child: Text('no fibonacci'))]
                : fibonacciList.map((e) {
                    return FibonacciItem(
                      onPressed: () {
                        FibonacciGroupBottomSheet.show(
                          context,
                          onSelect: (index) {
                            UtilityScrolling.scrollingTo(
                              scrollController,
                              index,
                            );
                            setState(() {
                              targetIndex = index;
                            });
                          },
                          initIndex: e.index,
                          fibonacciList: fibonacciList.where((condition) => condition.group == e.group).toList(),
                        );
                      },
                      bgColor: targetIndex == e.index ? Colors.red : null,
                      index: e.index,
                      fibonacci: e.fibonacci,
                      group: e.group,
                    );
                  }).toList()),
      ),
    );
  }
}
