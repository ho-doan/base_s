import 'package:flutter/material.dart';

class RootIsolateToken {
  RootIsolateToken._();
  static final instance = RootIsolateToken._();
}

class Isar {}

mixin LocalDatabase {
  static late Isar? _isar;
  Isar? get instance => _isar;

  static Future<void> init([@visibleForTesting Isar? isarTesting]) async {
    _isar = await openIsar();
  }

  static Future<Isar> openIsar([RootIsolateToken? token]) async {
    return Isar();
  }

  static Future clearDatabase() async {}

  static Future<bool?> dispose() async => true;
}

abstract class BaseLocalDatabase<T> {
  Stream<List<T>> listenDb() => const Stream.empty();

  Future<List<T>> getAll([Isar? isar]) async => [];

  Future<List<T>> getAllTask([RootIsolateToken? token]) async => [];

  Future<List<T>> gets({required int limit, required int offset}) async => [];

  Future<T?> get(String id) async => null;

  Future<T?> getByKey(int id) async => null;

  Future<List<T>> filter() async => [];

  Future<int> insert(T model) async => -1;

  Future<bool> insertAll(List<T> models, [Isar? isar]) async => true;

  Future<bool> insertAllTask(LocalTaskList<T> model) async => true;

  Future<int> update(T model) async => -1;

  Future<List<int>> updateAll(List<T> models) async => [];

  /// Delete by key
  Future<bool> delete(int id) async => true;
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
