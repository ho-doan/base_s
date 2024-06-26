import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ProductController {
  List<ProductRemote> data = (json.decode(
    File('publish/product/product.json').readAsStringSync(),
  ) as List<Map<String, dynamic>>)
      .map(ProductRemote.fromJson)
      .toList();
  Router get router {
    final router = Router()
      ..get('/', (Request req) {
        final s = {
          'data': data,
        };
        return Response.ok(
          json.encode(s),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      })
      ..get('/<id>', (Request req, String id) {
        final item = data.firstWhereOrNull((e) => e.id == int.parse(id));
        if (item != null) {
          return Response.ok(
            json.encode(item),
            headers: {
              'Content-Type': 'application/json',
            },
          );
        }
        return Response.notFound('Category not found');
      })
      ..post(
        '/',
        (Request req) async {
          final payload = await req.readAsString();
          if (payload.isEmpty) return Response.badRequest(body: 'data empty');
          data.add(json.decode(payload));
          return Response.ok('Created');
        },
      )
      ..patch(
        '/<id>',
        (Request req, String id) async {
          final item = data.firstWhereOrNull((e) => e.id == int.parse(id));
          if (item == null) {
            return Response.notFound('Category not found');
          }
          final index = data.indexOf(item);
          final payload = await req.readAsString();
          data[index] = json.decode(payload);
          return Response.ok(
            json.encode(data[index]),
            headers: {
              'Content-Type': 'application/json',
            },
          );
        },
      )
      ..delete(
        '/<id>',
        (Request req, String id) {
          stdout.writeln('delete');
          data = List<ProductRemote>.from(data)
            ..removeWhere(
              (e) => e.id == int.parse(id),
            );
          return Response.ok('');
        },
      );

    return router;
  }
}
