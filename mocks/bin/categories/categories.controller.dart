// ignore_for_file: avoid_dynamic_calls,
// ignore_for_file: always_specify_types, unused_local_variable,
// ignore_for_file: inference_failure_on_instance_creation

import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class CategoriesController {
  final List data = json.decode(
    File('publish/categories/categories.json').readAsStringSync(),
  );
  final List products = json.decode(
    File('publish/product/product.json').readAsStringSync(),
  );
  Router get router {
    final router = Router()
      ..get('/', (Request req) {
        stdout.writeln('get all');
        return Response.ok(
          json.encode(data),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      })
      ..get('/<id>', (Request req, String id) {
        final item = data.firstWhere(
          (e) => e['id'] == int.parse(id),
          orElse: () => null,
        );
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
      ..get('/<id>/products', (Request req, String id) {
        final lst = products
            .where(
              (e) => e['categoryId'] == int.parse(id),
            )
            .toList();
        if (lst.isNotEmpty) {
          return Response.ok(
            json.encode(lst),
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
          final item = data.firstWhere(
            (e) => e['id'] == int.parse(id),
            orElse: () => null,
          );
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
          final dataCP = List.from(data)
            ..removeWhere(
              (e) => e['id'] == int.parse(id),
            );
          return Response.ok('');
        },
      );

    return router;
  }
}
