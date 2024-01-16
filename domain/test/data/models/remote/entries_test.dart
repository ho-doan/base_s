import 'package:domain/data/models/remote/entries.dart';
import 'package:flutter_test/flutter_test.dart';

/// data test pass date: 16/01/2024
final _dummyEntries = {
  'count': 1,
  'entries': [
    {
      'API': 'AdoptAPet',
      'Description': 'Resource to help get pets adopted',
      'Auth': 'apiKey',
      'HTTPS': true,
      'Cors': 'yes',
      'Link': 'https://www.adoptapet.com/public/apis/pet_list.html',
      'Category': 'Animals',
    }
  ],
};
void main() {
  group('entry model remote test', () {
    test('success from json test', () {
      final entry = Entries.fromJson(_dummyEntries);
      expect(entry, isA<Entries>());
    });
    test('fail from json test', () {
      expect(
        () => Entries.fromJson({
          ..._dummyEntries,
          'count': '2',
        }),
        throwsA(isA<TypeError>()),
      );
    });
    test('fail from count not equal length entries', () {
      expect(
        () => Entries.fromJson({
          ..._dummyEntries,
          'count': 2,
        }),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
