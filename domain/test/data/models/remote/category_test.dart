import 'package:domain/data/models/remote/remote.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/dummy/category_dummy.dart';

void main() {
  group('category model remote test', () {
    test('success from json test', () {
      final mock = CategoryRemote.fromJson(dummyCategory);
      expect(mock, isA<CategoryRemote>());
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
