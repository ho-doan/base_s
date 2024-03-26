import 'package:freezed_annotation/freezed_annotation.dart';
import '../../local/local.dart';
part 'hihi.freezed.dart';
part 'hihi.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.none)
class HihiRemote with _$HihiRemote {
  const factory HihiRemote({@JsonKey(name: 'id') int? id}) = _HihiRemote;

  factory HihiRemote.fromJson(Map<String, dynamic> json) =>
      _$HihiRemoteFromJson(json);

  factory HihiRemote.fromLocal(HihiLocal model) => HihiRemote(id: model.id);
}
