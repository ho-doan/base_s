import 'dart:developer';

import 'package:isar/isar.dart';

import '../../../services/local_database/local_database.dart';
import '../../models/data_models.dart';

class CategoryLocalDataSource extends BaseLocalDatabase<CategoryLocal>
    with LocalDatabase {
  @override
  Future<List<CategoryLocal>> getAll([Isar? isar]) async {
    if (isar != null) {
      return isar.categoryLocals.where().findAll();
    }
    if (instance != null) {
      final result = await instance!.categoryLocals.where().findAll();
      return result;
    }
    throw Exception('isar null');
  }

  @override
  Future<CategoryLocal?> getByKey(Id id) {
    if (instance == null) throw Exception('isar null');
    return instance!.categoryLocals.filter().keyEqualTo(id).findFirst();
  }

  @override
  Future<Id> insert(CategoryLocal model) {
    if (instance == null) throw Exception('isar null');
    return instance!.writeTxn<Id>(() => instance!.categoryLocals.put(model));
  }

  @override
  Future<bool> insertAll(List<CategoryLocal> models, [Isar? isar]) async {
    try {
      if (isar != null) {
        await isar.writeTxn<List<Id>>(
          () => isar.categoryLocals.putAll(models),
        );
        return true;
      }
      if (instance != null) {
        await instance!.writeTxn<List<Id>>(
          () => instance!.categoryLocals.putAll(models),
        );
        return true;
      }
    } on Exception catch (e) {
      log('insert all category local error: $e');
      return false;
    }
    throw Exception('isar null');
  }

  @override
  Future<bool> delete(int id) {
    if (instance == null) throw Exception('isar null');
    return instance!.writeTxn<bool>(() => instance!.categoryLocals.delete(id));
  }
}
