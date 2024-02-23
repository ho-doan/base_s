import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/models.dart';

part 'product_model.freezed.dart';

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.pascal,
  fromJson: false,
  toJson: false,
)
class ProductModel with _$ProductModel {
  const factory ProductModel({
    int? id,
    String? name,
    String? image,
    int? categoryId,
  }) = _ProductModel;

  factory ProductModel.fromLocal(ProductLocal model) => ProductModel(
        id: model.id,
        name: model.name,
        categoryId: model.categoryId,
        image: model.image,
      );
  factory ProductModel.fromRemote(ProductRemote model) => ProductModel(
        id: model.id,
        name: model.name,
        categoryId: model.categoryId,
        image: model.image,
      );
}

extension ProductModelX on ProductModel {}
