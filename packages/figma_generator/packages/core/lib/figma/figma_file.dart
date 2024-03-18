import 'package:json_annotation/json_annotation.dart';

import 'figma_document.dart';

part 'figma_file.g.dart';

@JsonSerializable()
class FigmaFile {
  final FigmaDocument? document;

  FigmaFile({
    this.components,
    this.document,
    this.componentSets,
    this.schemaVersion,
    this.styles,
    this.name,
    this.lastModified,
    this.thumbnailUrl,
    this.version,
    this.role,
    this.editorType,
    this.linkAccess,
  });
  final Map<String, Component>? components;
  final StyleOverrideTable? componentSets;
  final int? schemaVersion;
  final StyleOverrideTable? styles;
  final String? name;
  final String? lastModified;
  final String? thumbnailUrl;
  final String? version;
  final String? role;
  final String? editorType;
  final String? linkAccess;
  factory FigmaFile.fromJson(Map<String, dynamic> json) =>
      _$FigmaFileFromJson(json);
}

@JsonSerializable()
class Component {
  final String? key;
  final String? name;
  final String? description;
  final bool? remote;
  final List<dynamic>? documentationLinks;
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  Component({
    this.key,
    this.name,
    this.description,
    this.remote,
    this.documentationLinks,
  });
}
