class GenFibonacci {
  static List<int> generateFibonacci(int amount) {
    final fibonacciList = <int>[];

    for (var i = 0; i < amount; i++) {
      if (i == 0 || i == 1) {
        fibonacciList.add(i);
      } else {
        final length = fibonacciList.length;

        fibonacciList.add(fibonacciList[length - 1] + fibonacciList[length - 2]);
      }
    }
    return fibonacciList;
  }
}
