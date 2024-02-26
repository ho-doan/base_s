// ignore_for_file: avoid_annotating_with_dynamic

import '../../../services/local_database/local_database.dart';
import '../../models/models.dart';

class ProductLocalDataSource extends BaseLocalDatabase<ProductLocal>
    with LocalDatabase {}
