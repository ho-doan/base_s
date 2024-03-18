import 'package:json_annotation/json_annotation.dart';

part 'figma_document.g.dart';

@JsonSerializable()
class FigmaDocument {
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

  factory FigmaDocument.fromJson(Map<String, dynamic> json) =>
      _$FigmaDocumentFromJson(json);

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
}

@JsonSerializable()
class AbsoluteBoundingBox {
  final double? x;
  final double? y;
  final double? width;
  final double? height;
  factory AbsoluteBoundingBox.fromJson(Map<String, dynamic> json) =>
      _$AbsoluteBoundingBoxFromJson(json);

  AbsoluteBoundingBox({
    this.x,
    this.y,
    this.width,
    this.height,
  });
}

@JsonSerializable()
class Constraints {
  final String? vertical;
  final String? horizontal;
  factory Constraints.fromJson(Map<String, dynamic> json) =>
      _$ConstraintsFromJson(json);

  Constraints({this.vertical, this.horizontal});
}

@JsonSerializable()
class Fills {
  final String? blendMode;
  final String? type;
  final Color? color;
  factory Fills.fromJson(Map<String, dynamic> json) => _$FillsFromJson(json);

  Fills({this.blendMode, this.type, this.color});
}

@JsonSerializable()
class Color {
  final double? r;
  final double? g;
  final double? b;
  final double? a;
  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);

  Color({this.r, this.g, this.b, this.a});
}

@JsonSerializable()
class Style {
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
  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);

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
}

@JsonSerializable()
class StyleOverrideTable {
  // TODO(hodoan): any?
  final dynamic mm;
  factory StyleOverrideTable.fromJson(Map<String, dynamic> json) =>
      _$StyleOverrideTableFromJson(json);

  StyleOverrideTable({this.mm});
}

@JsonSerializable()
class Background {
  final String? blendMode;
  final bool? visible;
  final String? type;
  final Color? color;
  factory Background.fromJson(Map<String, dynamic> json) =>
      _$BackgroundFromJson(json);

  Background({this.blendMode, this.visible, this.type, this.color});
}

@JsonSerializable()
class PrototypeDevice {
  final String? type;
  final String? rotation;
  factory PrototypeDevice.fromJson(Map<String, dynamic> json) =>
      _$PrototypeDeviceFromJson(json);

  PrototypeDevice({this.type, this.rotation});
}

@JsonSerializable()
class ExportSettings {
  final String? suffix;
  final String? format;
  final Constraint? constraint;
  factory ExportSettings.fromJson(Map<String, dynamic> json) =>
      _$ExportSettingsFromJson(json);

  ExportSettings(
      {required this.suffix, required this.format, required this.constraint});
}

@JsonSerializable()
class Constraint {
  final String? type;
  final int? value;
  factory Constraint.fromJson(Map<String, dynamic> json) =>
      _$ConstraintFromJson(json);

  Constraint({this.type, this.value});
}
