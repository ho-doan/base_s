import 'package:freezed_annotation/freezed_annotation.dart';

import 'entry.dart';

part 'entries.freezed.dart';
part 'entries.g.dart';

@freezed
class Entries with _$Entries {
  @JsonSerializable(explicitToJson: true)
  const factory Entries({
    @Default(0) int count,
    @Default([]) List<Entry> entries,
  }) = _Entries;

  factory Entries.fromJson(Map<String, dynamic> json) =>
      _$EntriesFromJson(json);
}
