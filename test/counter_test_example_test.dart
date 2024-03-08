import 'package:lamna/counter_test_example.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = CounterTestExample();
    counter.increment();
    expect(counter.value, 1);
  });
}
