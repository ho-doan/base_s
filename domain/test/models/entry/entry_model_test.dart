import 'package:domain/data/models/local/local.dart';
import 'package:domain/models/entry_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('entry local', () {
    group('get name test', () {
      test('with desc not null', () {
        final dummyEntry1 =
            EntryModel.fromEntryLocal(const EntryLocal(description: 'API'));
        expect(dummyEntry1.getName(), 'API');
      });
      test('with API not null', () {
        final EntryModel dummyEntry1 = EntryModel.fromEntryLocal(
          const EntryLocal(aPI: 'API'),
        );
        expect(dummyEntry1.getName(), 'API');
      });
      test('with API is null and desc is null', () {
        final EntryModel dummyEntry1 =
            EntryModel.fromEntryLocal(const EntryLocal());
        expect(dummyEntry1.getName(), '--');
      });
    });
  });
}
