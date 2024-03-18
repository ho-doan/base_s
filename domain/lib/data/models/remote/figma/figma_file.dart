import 'package:domain/data/models/data_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'figma_file.freezed.dart';
part 'figma_file.g.dart';

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class FigmaFile with _$FigmaFile {
  const factory FigmaFile({
    FigmaDocument? document,
    Map<String, Component>? components,
    StyleOverrideTable? componentSets,
    int? schemaVersion,
    StyleOverrideTable? styles,
    String? name,
    String? lastModified,
    String? thumbnailUrl,
    String? version,
    String? role,
    String? editorType,
    String? linkAccess,
  }) = _FigmaFile;
  factory FigmaFile.fromJson(Map<String, dynamic> json) =>
      _$FigmaFileFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.pascal,
)
class Component with _$Component {
  const factory Component({
    String? key,
    String? name,
    String? description,
    bool? remote,
    List<dynamic>? documentationLinks,
  }) = _Component;
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
}
