import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/models.dart';

mixin LocalDatabase {
  static late Isar? _isar;
  Isar? get instance => _isar;

  static Future<void> init([@visibleForTesting Isar? isarTesting]) async {
    try {
      if (isarTesting != null) {
        _isar = isarTesting;
        return;
      }
      if (Isar.instanceNames.isNotEmpty) return;

      _isar = await openIsar();
    } on Exception catch (e, stacktrace) {
      log('Init local failed: $e', stackTrace: stacktrace);
    }
  }

  static Future<Isar> openIsar([Directory? dir]) async {
    Directory isarDir;
    if (dir != null) {
      isarDir = Directory('${dir.path}/isar');
    } else {
      final appDir = await getApplicationDocumentsDirectory();
      isarDir = Directory('${appDir.path}/isar');
      await isarDir.create(recursive: true);
    }

    // TODO(everyone): add more schema
    final isar = await Isar.open(
      [
        EntryLocalSchema,
      ],
      directory: isarDir.path,
      inspector: dir == null,
    );

    return isar;
  }

  static Future clearDatabase() async {
    // TODO(everyone): add more delete calls for other collections as needed
    await _isar?.writeTxn<void>(() async {
      await _isar?.entryLocals.clear();
    });
  }

  static Future<bool?> dispose() async => _isar?.close();
}

abstract class BaseLocalDatabase<T> {
  Stream<List<T>> listenDb() {
    throw UnimplementedError('listenDb $T');
  }

  Future<List<T>> getAll([Isar? isar]) {
    throw UnimplementedError('getAll $T');
  }

  Future<List<T>> getAllTask([Directory? dir]) async {
    throw UnimplementedError('getAll $T');
  }

  Future<List<T>> gets({required int limit, required int offset}) {
    throw UnimplementedError('gets $T');
  }

  Future<T?> get(String id) {
    throw UnimplementedError('get $T');
  }

  Future<T?> getByKey(Id id) {
    throw UnimplementedError('getByKey $T');
  }

  Future<List<T>> filter() {
    throw UnimplementedError('filter $T');
  }

  Future<Id> insert(T model) {
    throw UnimplementedError('insert $T');
  }

  Future<T> insertModel(T model) async {
    throw UnimplementedError('insert $T');
  }

  Future<bool> insertAll(List<T> models, [Isar? isar]) {
    throw UnimplementedError('insertAll $T');
  }

  Future<bool> insertAllTask(List<T> models) async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await LocalDatabase.openIsar(dir);
    final lst = await insertAll(models, isar);
    return lst;
  }

  Future<List<T>> insertAllModel(List<T> models) async {
    throw UnimplementedError('insert $T');
  }

  Future<Id> update(T model) {
    throw UnimplementedError('update $T');
  }

  Future<List<Id>> updateAll(List<T> models) {
    throw UnimplementedError('update $T');
  }

  ///Delete by key
  Future<bool> delete(int id) {
    throw UnimplementedError('delete $T');
  }
}
