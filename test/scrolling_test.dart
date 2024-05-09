import 'package:fibonacci_flutter/main.dart';
import 'package:fibonacci_flutter/presentation/pages/fibonacci_page.dart';
import 'package:fibonacci_flutter/utils/scolling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Scrolling scrollingTo', (tester) async {
    final scrollController = ScrollController();

    await tester.pumpWidget(MaterialApp(
        home: FibonacciPage(
      initialScrollController: scrollController,
      amountOfGenerateFibonacc: 40,
    )));

    expect(find.text('index: 0, Number: 0'), findsOneWidget);

    UtilityScrolling.scrollingTo(scrollController, 28);

    expect(find.text('index: 28, Number: 317811'), findsOneWidget);
  });
}
