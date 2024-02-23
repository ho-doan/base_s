import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/models.dart';

part 'category_model.freezed.dart';

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.pascal,
  fromJson: false,
  toJson: false,
)
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    int? id,
    String? name,
  }) = _CategoryModel;

  factory CategoryModel.fromLocal(CategoryLocal model) => CategoryModel(
        id: model.id,
        name: model.name,
      );
  factory CategoryModel.fromRemote(CategoryRemote model) => CategoryModel(
        id: model.id,
        name: model.name,
      );
}

extension CategoryModelX on CategoryModel {}
