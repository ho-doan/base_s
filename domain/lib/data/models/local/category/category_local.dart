import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';

import '../../remote/category.dart';
import 'i_category_local.dart';

part 'category_local.g.dart';

@CopyWith()
@collection
class CategoryLocal extends ICategoryLocal {
  const CategoryLocal({
    super.id,
    super.name,
    this.key = Isar.autoIncrement,
  });
  factory CategoryLocal.fromRemote(CategoryRemote model) => CategoryLocal(
        id: model.id,
        name: model.name,
      );

  final Id? key;
}
