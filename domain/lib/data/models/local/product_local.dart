import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';

import '../data_models.dart';

part 'product_local.g.dart';

@CopyWith()
@collection
class ProductLocal {
  const ProductLocal({
    this.id,
    this.name,
    this.key = Isar.autoIncrement,
    this.categoryId,
    this.image,
  });
  factory ProductLocal.fromRemote(ProductRemote model) => ProductLocal(
        id: model.id,
        name: model.name,
        categoryId: model.categoryId,
        image: model.image,
      );

  final Id? key;

  final int? id;
  final String? name;
  final String? image;
  final int? categoryId;
}
