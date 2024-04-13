import 'package:domain/data/models/local/local.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('category local', () {
    group('get name test', () {
      test('with desc not null', () {
        const cate = CategoryLocal(primary: 1, name: 'API');
        expect(cate.name, 'API');
      });
    });
  });
}
