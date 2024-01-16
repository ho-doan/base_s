import 'dart:developer';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/models.dart';

mixin LocalDatabase {
  static late Isar? isar;
  Isar? get instance => isar;

  static Future<void> init() async {
    try {
      if (Isar.instanceNames.isNotEmpty) return;

      isar = await openIsar();
    } on Exception catch (e, stacktrace) {
      log('Init local failed: $e', stackTrace: stacktrace);
    }
  }

  static Future<Isar> openIsar() async {
    final appDir = await getApplicationDocumentsDirectory();
    final isarDir = Directory('${appDir.path}/isar');
    await isarDir.create(recursive: true);

    final isar = await Isar.open(
      [
        EntryLocalSchema,
      ],
      directory: isarDir.path,
    );

    return isar;
  }

  static Future clearDatabase() async {
    //TODO (everyone): add more delete calls for other collections as needed

    await isar?.writeTxn<void>(() async {
      await isar?.entryLocals.clear();
    });
  }

  static Future<bool?> dispose() async => isar?.close();
}

abstract class BaseLocalDatabase<T> {
  Stream<List<T>> listenDb() {
    throw UnimplementedError('listenDb $T');
  }

  Future<List<T>> getAll() {
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

  Future<bool> insertAll(List<T> models) {
    throw UnimplementedError('insert $T');
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
