import 'package:domain/data/models/remote/entry.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/dummy/entry_dummy.dart';

void main() {
  group('entry model remote test', () {
    test('success from json test', () {
      final entry = EntryRemote.fromJson(dummyEntry);
      expect(entry, isA<EntryRemote>());
    });
    test('fail from json test', () {
      expect(
        () => EntryRemote.fromJson({
          ...dummyEntry,
          'HTTPS': 1,
        }),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
