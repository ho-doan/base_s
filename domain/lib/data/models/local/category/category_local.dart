import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';

import '../../remote/remote.dart';
import 'i_category.dart';

part 'category_local.g.dart';

@CopyWith()
@collection
class CategoryLocal extends ICategory {
  const CategoryLocal({
    required this.primary,
    super.id,
    super.name,
    this.key = Isar.autoIncrement,
  });
  factory CategoryLocal.fromRemote(CategoryRemote model) => CategoryLocal(
        primary: model.id,
        id: model.id,
        name: model.name,
      );

  final Id? key;

  @Index(unique: true)
  final int? primary;
}
