import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('category local', () {
    group('get name test', () {
      test('with name not null', () {
        final category = CategoryModel.fromLocal(
            const CategoryLocal(primary: 1, name: 'API'));
        expect(category.getName, 'API');
      });

      test('with name is null', () {
        final category =
            CategoryModel.fromLocal(const CategoryLocal(primary: 1));
        expect(category.getName, '--');
      });
    });
  });
}
