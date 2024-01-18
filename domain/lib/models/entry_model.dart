import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/local/entry_local.dart';
import '../data/models/remote/entry.dart';

part 'entry_model.freezed.dart';

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.pascal,
  fromJson: false,
  toJson: false,
)
class EntryModel with _$EntryModel {
  const factory EntryModel({
    String? aPI,
    String? description,
    String? auth,
    bool? hTTPS,
    String? cors,
    String? link,
    String? category,
  }) = _EntryModel;

  factory EntryModel.fromEntryLocal(EntryLocal entry) => EntryModel(
        aPI: entry.aPI,
        auth: entry.auth,
        category: entry.category,
        cors: entry.cors,
        description: entry.description,
        hTTPS: entry.hTTPS,
        link: entry.link,
      );
  factory EntryModel.fromEntryRemote(EntryRemote entry) => EntryModel(
        aPI: entry.aPI,
        auth: entry.auth,
        category: entry.category,
        cors: entry.cors,
        description: entry.description,
        hTTPS: entry.hTTPS,
        link: entry.link,
      );
}

extension EntryModelX on EntryModel {
  String getName() {
    return aPI ?? description ?? '--';
  }
}
