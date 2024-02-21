import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/shared.dart';

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

  static Future<Isar> openIsar([RootIsolateToken? token]) async {
    if (token != null) {
      initIsolateToken(token);
    }

    final appDir = await getApplicationDocumentsDirectory();

    final isarDir = Directory('${appDir.path}/isar');

    if (token == null) {
      await isarDir.create(recursive: true);
    }

    // TODO(everyone): add more schema
    final isar = await Isar.open(
      [
        EntryLocalSchema,
      ],
      directory: isarDir.path,
      inspector: token == null,
    );

    return isar;
  }

  @visibleForTesting
  static Future<Isar> openIsarTest() async {
    // TODO(everyone): add more schema
    final isar = await Isar.open(
      [
        EntryLocalSchema,
      ],
      // ignore: invalid_use_of_visible_for_testing_member
      directory: kDirectory.path,
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

  Future<List<T>> getAllTask([RootIsolateToken? token]) async {
    Isar? isar;
    if (!kTest) {
      isar = await LocalDatabase.openIsar(token);
    }
    final lst = await getAll(isar);
    return lst;
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

  Future<bool> insertAllTask(LocalTaskList<T> model) async {
    if (model.token == null && !kTest) throw Exception('token null');
    if (!kTest) {
      initIsolateToken(model.token!);
    }

    Isar? isar;
    if (!kTest) {
      isar = await LocalDatabase.openIsar(model.token);
    }
    final lst = await insertAll(model.models, isar);
    return lst;
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

class LocalTask<T> {
  LocalTask({required this.model, required this.token});

  final T model;
  final RootIsolateToken? token;
}

class LocalTaskList<T> {
  LocalTaskList({required this.models, required this.token});

  final List<T> models;
  final RootIsolateToken? token;
}
