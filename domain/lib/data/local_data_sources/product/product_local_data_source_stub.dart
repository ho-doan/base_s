// ignore_for_file: avoid_annotating_with_dynamic

import '../../../services/local_database/local_database.dart';
import '../../models/models.dart';

class ProductLocalDataSource extends BaseLocalDatabase<ProductLocal>
    with LocalDatabase {
  @override
  Future<List<ProductLocal>> getAll([dynamic isar]) async {
    return [];
  }

  @override
  Future<ProductLocal?> getByKey(dynamic id) async {
    return null;
  }

  @override
  Future<int> insert(ProductLocal model) async {
    return -1;
  }

  @override
  Future<bool> insertAll(List<ProductLocal> models, [dynamic isar]) async {
    return true;
  }

  @override
  Future<bool> delete(int id) async {
    return true;
  }
}
