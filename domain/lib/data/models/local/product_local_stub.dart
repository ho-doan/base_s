import '../models.dart';

class ProductLocal {
  const ProductLocal({
    this.id,
    this.name,
    this.key = -1,
    this.categoryId,
    this.image,
  });
  factory ProductLocal.fromRemote(ProductRemote model) => ProductLocal(
        id: model.id,
        name: model.name,
        categoryId: model.categoryId,
        image: model.image,
      );

  final int? key;

  final int? id;
  final String? name;
  final String? image;
  final int? categoryId;
}
