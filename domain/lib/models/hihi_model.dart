import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/data_models.dart';
part 'hihi_model.freezed.dart';

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.pascal,
  fromJson: false,
  toJson: false,
)
class HihiModel with _$HihiModel {
  const factory HihiModel({int? id}) = _HihiModel;

  factory HihiModel.fromLocal(HihiLocal model) => HihiModel(id: model.id);

  factory HihiModel.fromRemote(HihiRemote model) => HihiModel(id: model.id);
}
