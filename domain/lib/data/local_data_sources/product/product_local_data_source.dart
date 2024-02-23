import 'dart:developer';

import 'package:isar/isar.dart';

import '../../../services/local_database/local_database.dart';
import '../../models/models.dart';

class ProductLocalDataSource extends BaseLocalDatabase<ProductLocal>
    with LocalDatabase {
  @override
  Future<List<ProductLocal>> getAll([Isar? isar]) {
    if (isar != null) {
      return isar.productLocals.where().findAll();
    }
    if (instance != null) {
      return instance!.productLocals.where().findAll();
    }
    throw Exception('isar null');
  }

  @override
  Future<ProductLocal?> getByKey(Id id) {
    if (instance == null) throw Exception('isar null');
    return instance!.productLocals.filter().keyEqualTo(id).findFirst();
  }

  @override
  Future<Id> insert(ProductLocal model) {
    if (instance == null) throw Exception('isar null');
    return instance!.writeTxn<Id>(() => instance!.productLocals.put(model));
  }

  @override
  Future<bool> insertAll(List<ProductLocal> models, [Isar? isar]) async {
    try {
      if (isar != null) {
        await isar.writeTxn<List<Id>>(
          () => isar.productLocals.putAll(models),
        );
        return true;
      }
      if (instance != null) {
        await instance!.writeTxn<List<Id>>(
          () => instance!.productLocals.putAll(models),
        );
        return true;
      }
    } on Exception catch (e) {
      log('insert all Product local error: $e');
      return false;
    }
    throw Exception('isar null');
  }

  @override
  Future<bool> delete(int id) {
    if (instance == null) throw Exception('isar null');
    return instance!.writeTxn<bool>(() => instance!.productLocals.delete(id));
  }
}
