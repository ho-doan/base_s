import 'package:domain/data/models/local/local.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('entry local', () {
    group('get name test', () {
      test('with desc not null', () {
        const dummyEntry1 = EntryLocal(description: 'API');
        expect(dummyEntry1.getName(), 'API');
      });
      test('with API not null', () {
        const dummyEntry1 = EntryLocal(aPI: 'API');
        expect(dummyEntry1.getName(), 'API');
      });
      test('with API is null and desc is null', () {
        const dummyEntry1 = EntryLocal();
        expect(dummyEntry1.getName(), '--');
      });
    });
  });
}
