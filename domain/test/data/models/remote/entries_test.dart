import 'package:domain/data/models/remote/entries.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/dummy/entries_dummy.dart';

void main() {
  group('entry model remote test', () {
    test('success from json test', () {
      final entry = Entries.fromJson(dummyEntries);
      expect(entry, isA<Entries>());
    });
    test('fail from json test', () {
      expect(
        () => Entries.fromJson({
          ...dummyEntries,
          'count': '2',
        }),
        throwsA(isA<TypeError>()),
      );
    });
    test('fail from count not equal length entries', () {
      expect(
        () => Entries.fromJson({
          ...dummyEntries,
          'count': 2,
        }),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
