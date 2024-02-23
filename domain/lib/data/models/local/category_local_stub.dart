import '../models.dart';

class CategoryLocal {
  const CategoryLocal({
    this.id,
    this.name,
    this.key = -1,
  });
  factory CategoryLocal.fromRemote(CategoryRemote model) => CategoryLocal(
        id: model.id,
        name: model.name,
      );

  final int? key;

  final int? id;
  final String? name;
}
