import 'dart:developer';

import 'package:isar/isar.dart';

import '../../../services/local_database/local_database.dart';
import '../../models/models.dart';

class EntryLocalDataSource extends BaseLocalDatabase<EntryLocal>
    with LocalDatabase {
  @override
  Future<List<EntryLocal>> getAll() {
    if (instance == null) throw Exception('isar null');
    return instance!.entryLocals.where().findAll();
  }

  @override
  Future<EntryLocal?> getByKey(Id id) {
    if (instance == null) throw Exception('isar null');
    return instance!.entryLocals.filter().keyEqualTo(id).findFirst();
  }

  @override
  Future<Id> insert(EntryLocal model) {
    if (instance == null) throw Exception('isar null');
    // TODO(everyone): Put by index
    return instance!.writeTxn<Id>(() => instance!.entryLocals.put(model));
  }

  @override
  Future<bool> insertAll(List<EntryLocal> models) async {
    if (instance == null) throw Exception('isar null');
    try {
      // TODO(everyone): Put by index
      await instance!
          .writeTxn<List<Id>>(() => instance!.entryLocals.putAll(models));
      return true;
    } on Exception catch (e) {
      log('insert all entry local error: $e');
      return false;
    }
  }

  @override
  Future<bool> delete(int id) {
    if (instance == null) throw Exception('isar null');
    return instance!.writeTxn<bool>(() => instance!.entryLocals.delete(id));
  }
}
