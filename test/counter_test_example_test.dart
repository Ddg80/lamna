import 'package:lamna/counter_test_example.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = CounterTestExample();
    counter.increment();
    expect(counter.value, 1);
  });
}
