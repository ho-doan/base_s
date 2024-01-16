import 'package:domain/data/models/remote/entry.dart';
import 'package:flutter_test/flutter_test.dart';

/// data test pass date: 16/01/2024
final _dummyEntry = {
  'API': 'AdoptAPet',
  'Description': 'Resource to help get pets adopted',
  'Auth': 'apiKey',
  'HTTPS': true,
  'Cors': 'yes',
  'Link': 'https://www.adoptapet.com/public/apis/pet_list.html',
  'Category': 'Animals',
};
void main() {
  group('entry model remote test', () {
    test('success from json test', () {
      final entry = Entry.fromJson(_dummyEntry);
      expect(entry, isA<Entry>());
    });
    test('fail from json test', () {
      expect(
        () => Entry.fromJson({
          ..._dummyEntry,
          'HTTPS': 1,
        }),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
