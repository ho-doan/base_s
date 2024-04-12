import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';
import '../../remote/remote.dart';
import 'i_product.dart';
part 'product_local.g.dart';

@CopyWith()
@collection
class ProductLocal extends IProduct {
  const ProductLocal({
    required this.primary,
    super.id,
    super.categoryId,
    super.image,
    super.name,
    this.key = Isar.autoIncrement,
  });

  factory ProductLocal.fromRemote(ProductRemote model) => ProductLocal(
        id: model.id,
        primary: model.id,
        categoryId: model.categoryId,
        image: model.image,
        name: model.name,
      );

  final Id? key;

  @Index(unique: true)
  final int? primary;
}
