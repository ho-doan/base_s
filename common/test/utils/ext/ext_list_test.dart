import 'package:common/utils/extensions/list_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('List ext', () {
    group('isNullOrEmpty', () {
      test('with null', () {
        final List<String>? lst = null;
        expect(lst.isNullOrEmpty, true);
      });
      test('with empty', () {
        final List<String>? lst = [];
        expect(lst.isNullOrEmpty, true);
      });
    });
    group('lst', () {
      test('with null', () {
        final List<String>? lst = null;
        expect(lst.lst, isA<List<String>>());
        expect(lst.lst, isNotNull);
        expect(lst.lst.length, 0);
      });
      test('with empty', () {
        final List<String>? lst = [];
        expect(lst.lst, isA<List<String>>());
        expect(lst.lst, isNotNull);
        expect(lst.lst.length, 0);
      });
      test('with not empty', () {
        final List<String>? lst = ['a'];
        expect(lst.lst, isA<List<String>>());
        expect(lst.lst, isNotNull);
        expect(lst.lst.length, 1);
      });
    });
  });
}
