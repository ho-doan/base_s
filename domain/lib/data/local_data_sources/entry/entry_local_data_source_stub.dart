// ignore_for_file: avoid_annotating_with_dynamic

import '../../../services/local_database/local_database.dart';
import '../../models/models.dart';

class EntryLocalDataSource extends BaseLocalDatabase<EntryLocal>
    with LocalDatabase {
  @override
  Future<List<EntryLocal>> getAll([dynamic isar]) async {
    return [];
  }

  @override
  Future<EntryLocal?> getByKey(dynamic id) async {
    return null;
  }

  @override
  Future<int> insert(EntryLocal model) async {
    return -1;
  }

  @override
  Future<bool> insertAll(List<EntryLocal> models, [dynamic isar]) async {
    return true;
  }

  @override
  Future<bool> delete(int id) async {
    return true;
  }
}
