import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.pascal)
class Entry with _$Entry {
  const factory Entry({
    @JsonKey(name: 'API') String? aPI,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Auth') String? auth,
    @JsonKey(name: 'HTTPS') bool? hTTPS,
    @JsonKey(name: 'Cors') String? cors,
    @JsonKey(name: 'Link') String? link,
    @JsonKey(name: 'Category') String? category,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
