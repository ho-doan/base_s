import 'package:flutter_test/flutter_test.dart';
import 'package:template/feature/home/home_screen.dart';

void main() {
  group('counter unit', () {
    test('counter initial', () {
      final counter = Counter();
      expect(counter.value, 0);
    });
    test('counter increment', () {
      final counter = Counter();
      expect(counter.value, 0);
      for (int i = 1; i < 10; i++) {
        counter.increment();
        expect(counter.value, i);
      }
    });
    test('counter decrement', () {
      final counter = Counter();
      expect(counter.value, 0);
      for (int i = 1; i < 10; i++) {
        counter.decrement();
        expect(counter.value, 0);
      }
    });
  });
}
