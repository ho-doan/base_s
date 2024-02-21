import 'package:flutter/foundation.dart';

import '../../core/isolator/isolator.dart';

mixin LocalDatabase {
  static late dynamic _isar;
  dynamic get instance => _isar;

  // ignore: avoid_annotating_with_dynamic
  static Future<void> init([@visibleForTesting dynamic isarTesting]) async {
    _isar = await openIsar();
  }

  // ignore: avoid_annotating_with_dynamic
  static Future<dynamic> openIsar([dynamic token]) async {
    if (token != null) {
      initIsolateToken(token);
    }

    return null;
  }

  @visibleForTesting
  static Future<dynamic> openIsarTest() async {
    return null;
  }

  static Future clearDatabase() async {}

  static Future<bool?> dispose() async => true;
}

abstract class BaseLocalDatabase<T> {
  Stream<List<T>> listenDb() {
    throw UnimplementedError('listenDb $T');
  }

  // ignore: avoid_annotating_with_dynamic
  Future<List<T>> getAll([dynamic isar]) {
    throw UnimplementedError('getAll $T');
  }

  // ignore: avoid_annotating_with_dynamic
  Future<List<T>> getAllTask([dynamic token]) async {
    return [];
  }

  Future<List<T>> gets({required int limit, required int offset}) {
    throw UnimplementedError('gets $T');
  }

  Future<T?> get(String id) {
    throw UnimplementedError('get $T');
  }

  // ignore: avoid_annotating_with_dynamic
  Future<T?> getByKey(dynamic id) {
    throw UnimplementedError('getByKey $T');
  }

  Future<List<T>> filter() {
    throw UnimplementedError('filter $T');
  }

  Future<int> insert(T model) {
    throw UnimplementedError('insert $T');
  }

  Future<T> insertModel(T model) async {
    throw UnimplementedError('insert $T');
  }

  // ignore: avoid_annotating_with_dynamic
  Future<bool> insertAll(List<T> models, [dynamic isar]) {
    throw UnimplementedError('insertAll $T');
  }

  // ignore: avoid_annotating_with_dynamic
  Future<bool> insertAllTask(dynamic model) async {
    return true;
  }

  Future<int> update(T model) {
    throw UnimplementedError('update $T');
  }

  Future<List<int>> updateAll(List<T> models) {
    throw UnimplementedError('update $T');
  }

  ///Delete by key
  Future<bool> delete(int id) {
    throw UnimplementedError('delete $T');
  }
}

class LocalTask<T> {
  LocalTask({required this.model, required this.token});

  final T model;
  final dynamic token;
}

class LocalTaskList<T> {
  LocalTaskList({required this.models, required this.token});

  final List<T> models;
  final dynamic token;
}
