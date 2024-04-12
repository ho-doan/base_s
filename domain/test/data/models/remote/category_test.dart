import 'package:domain/data/models/remote/remote.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/dummy/category_dummy.dart';

void main() {
  group('entry model remote test', () {
    test('success from json test', () {
      final entry = CategoryRemote.fromJson(dummyCategory);
      expect(entry, isA<CategoryRemote>());
    });
    test('fail from json test', () {
      expect(
        () => CategoryRemote.fromJson({
          ...dummyCategory,
          'id': '1',
        }),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
