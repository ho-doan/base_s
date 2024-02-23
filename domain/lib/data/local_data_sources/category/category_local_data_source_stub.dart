// ignore_for_file: avoid_annotating_with_dynamic

import '../../../services/local_database/local_database.dart';
import '../../models/models.dart';

class CategoryLocalDataSource extends BaseLocalDatabase<CategoryLocal>
    with LocalDatabase {
  @override
  Future<List<CategoryLocal>> getAll([dynamic isar]) async {
    return [];
  }

  @override
  Future<CategoryLocal?> getByKey(dynamic id) async {
    return null;
  }

  @override
  Future<int> insert(CategoryLocal model) async {
    return -1;
  }

  @override
  Future<bool> insertAll(List<CategoryLocal> models, [dynamic isar]) async {
    return true;
  }

  @override
  Future<bool> delete(int id) async {
    return true;
  }
}
