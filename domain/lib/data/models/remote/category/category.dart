import 'package:freezed_annotation/freezed_annotation.dart';
import '../../local/local.dart';
part 'category.freezed.dart';
part 'category.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.none)
class CategoryRemote with _$CategoryRemote {
  const factory CategoryRemote({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _CategoryRemote;

  factory CategoryRemote.fromJson(Map<String, dynamic> json) =>
      _$CategoryRemoteFromJson(json);

  factory CategoryRemote.fromLocal(CategoryLocal model) =>
      CategoryRemote(id: model.id);
}
