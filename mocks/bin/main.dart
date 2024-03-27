import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import 'categories/categories.controller.dart';
import 'entries/entries.controller.dart';
import 'product/product.controller.dart';

void main(List<String> args) async {
  final app = Router()
    ..mount('/categories', CategoriesController().router.call)
    ..mount('/entries', EntriesController().router.call)
    ..mount('/product', ProductController().router.call)
    ..get('/', (req) {
      return Response.ok('Mocks server');
    });

  await io.serve(app.call, 'localhost', 8080);
}
