import 'package:json_annotation/json_annotation.dart';

part 'figma_document.g.dart';

@JsonSerializable()
class FigmaDocument {
  FigmaDocument({
    this.id,
    this.name,
    this.type,
    this.scrollBehavior,
    this.children,
    this.backgroundColor,
    this.prototypeStartNodeID,
    this.flowStartingPoints,
    this.prototypeDevice,
    this.exportSettings,
    this.blendMode,
    this.absoluteBoundingBox,
    this.absoluteRenderBounds,
    this.constraints,
    this.fills,
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.effects,
    this.characters,
    this.style,
    this.characterStyleOverrides,
    this.styleOverrideTable,
    this.lineTypes,
    this.lineIndentations,
    this.clipsContent,
    this.background,
    this.strokeJoin,
    this.strokeMiterAngle,
  });
  factory FigmaDocument.fromJson(Map<String, dynamic> json) =>
      _$FigmaDocumentFromJson(json);
  final String? id;
  final String? name;
  final String? type;
  final String? scrollBehavior;
  final List<FigmaDocument>? children;
  final Color? backgroundColor;
  final dynamic prototypeStartNodeID;
  final List<dynamic>? flowStartingPoints;
  final PrototypeDevice? prototypeDevice;
  final List<ExportSettings>? exportSettings;
  final String? blendMode;
  final AbsoluteBoundingBox? absoluteBoundingBox;
  final AbsoluteBoundingBox? absoluteRenderBounds;
  final Constraints? constraints;
  final List<Fills>? fills;
  final List<dynamic>? strokes;
  final double? strokeWeight;
  final String? strokeAlign;
  final List<dynamic>? effects;
  final String? characters;
  final Style? style;
  final List<dynamic>? characterStyleOverrides;
  final StyleOverrideTable? styleOverrideTable;
  final List<String>? lineTypes;
  final List<int>? lineIndentations;
  final bool? clipsContent;
  final List<Background>? background;
  final String? strokeJoin;
  final dynamic strokeMiterAngle;
}

@JsonSerializable()
class AbsoluteBoundingBox {
  AbsoluteBoundingBox({
    this.x,
    this.y,
    this.width,
    this.height,
  });
  factory AbsoluteBoundingBox.fromJson(Map<String, dynamic> json) =>
      _$AbsoluteBoundingBoxFromJson(json);
  final double? x;
  final double? y;
  final double? width;
  final double? height;
}

@JsonSerializable()
class Constraints {
  Constraints({this.vertical, this.horizontal});
  factory Constraints.fromJson(Map<String, dynamic> json) =>
      _$ConstraintsFromJson(json);
  final String? vertical;
  final String? horizontal;
}

@JsonSerializable()
class Fills {
  Fills({this.blendMode, this.type, this.color});
  factory Fills.fromJson(Map<String, dynamic> json) => _$FillsFromJson(json);
  final String? blendMode;
  final String? type;
  final Color? color;
}

@JsonSerializable()
class Color {
  Color({this.r, this.g, this.b, this.a});
  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
  final double? r;
  final double? g;
  final double? b;
  final double? a;
}

@JsonSerializable()
class Style {
  Style({
    this.fontFamily,
    this.fontPostScriptName,
    this.fontWeight,
    this.textAutoResize,
    this.fontSize,
    this.textAlignHorizontal,
    this.textAlignVertical,
    this.letterSpacing,
    this.lineHeightPx,
    this.lineHeightPercent,
    this.lineHeightUnit,
  });
  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);
  final String? fontFamily;
  final String? fontPostScriptName;
  final int? fontWeight;
  final String? textAutoResize;
  final double? fontSize;
  final String? textAlignHorizontal;
  final String? textAlignVertical;
  final double? letterSpacing;
  final double? lineHeightPx;
  final double? lineHeightPercent;
  final String? lineHeightUnit;
}

@JsonSerializable()
class StyleOverrideTable {
  StyleOverrideTable({this.mm});
  factory StyleOverrideTable.fromJson(Map<String, dynamic> json) =>
      _$StyleOverrideTableFromJson(json);
  // TODO(hodoan): any?
  final dynamic mm;
}

@JsonSerializable()
class Background {
  Background({this.blendMode, this.visible, this.type, this.color});
  factory Background.fromJson(Map<String, dynamic> json) =>
      _$BackgroundFromJson(json);
  final String? blendMode;
  final bool? visible;
  final String? type;
  final Color? color;
}

@JsonSerializable()
class PrototypeDevice {
  PrototypeDevice({this.type, this.rotation});
  factory PrototypeDevice.fromJson(Map<String, dynamic> json) =>
      _$PrototypeDeviceFromJson(json);
  final String? type;
  final String? rotation;
}

@JsonSerializable()
class ExportSettings {
  ExportSettings({
    required this.suffix,
    required this.format,
    required this.constraint,
  });
  factory ExportSettings.fromJson(Map<String, dynamic> json) =>
      _$ExportSettingsFromJson(json);
  final String? suffix;
  final String? format;
  final Constraint? constraint;
}

@JsonSerializable()
class Constraint {
  Constraint({this.type, this.value});
  factory Constraint.fromJson(Map<String, dynamic> json) =>
      _$ConstraintFromJson(json);
  final String? type;
  final double? value;
}
