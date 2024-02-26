import '../../remote/category.dart';
import 'i_category_local.dart';

class CategoryLocal extends ICategoryLocal {
  const CategoryLocal({
    super.id,
    super.name,
    this.key = -1,
  });
  factory CategoryLocal.fromRemote(CategoryRemote model) => CategoryLocal(
        id: model.id,
        name: model.name,
      );

  final int? key;
}
