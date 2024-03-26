import 'package:isar/isar.dart';
import '../../../services/local_database/local_database.dart';
import '../../models/data_models.dart';

class HihiLocalDataSource extends BaseLocalDatabase<HihiLocal>
    with LocalDatabase {
  @override
  Future<List<HihiLocal>> getAll([covariant Isar? isar]) {
    if (isar != null) {
      return isar.hihiLocals.where().findAll();
    }
    if (instance != null) {
      return instance!.hihiLocals.where().findAll();
    }
    throw Exception('isar null');
  }
}
