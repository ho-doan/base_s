import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';

import '../models.dart';

part 'category_local.g.dart';

@CopyWith()
@collection
class CategoryLocal {
  const CategoryLocal({
    this.id,
    this.name,
    this.key = Isar.autoIncrement,
  });
  factory CategoryLocal.fromRemote(CategoryRemote model) => CategoryLocal(
        id: model.id,
        name: model.name,
      );

  final Id? key;

  final int? id;
  final String? name;
}
