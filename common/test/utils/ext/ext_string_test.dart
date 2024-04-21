import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String ext', () {
    group('hardcode', () {
      test('with empty', () {
        final mock = 'a';
        expect(mock.hardcode, mock);
      });
    });
  });
}
