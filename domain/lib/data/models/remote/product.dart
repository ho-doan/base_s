import 'package:freezed_annotation/freezed_annotation.dart';

import '../local/local.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.pascal)
class ProductRemote with _$ProductRemote {
  const factory ProductRemote({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'categoryId') int? categoryId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'image') String? image,
  }) = _ProductRemote;

  factory ProductRemote.fromJson(Map<String, dynamic> json) =>
      _$ProductRemoteFromJson(json);

  factory ProductRemote.fromEntryLocal(ProductLocal model) => ProductRemote(
        id: model.id,
        name: model.name,
        categoryId: model.categoryId,
        image: model.image,
      );
}
