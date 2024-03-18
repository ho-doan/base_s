import 'package:freezed_annotation/freezed_annotation.dart';

part 'figma_document.freezed.dart';
part 'figma_document.g.dart';

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class FigmaDocument with _$FigmaDocument {
  const factory FigmaDocument({
    String? id,
    String? name,
    String? type,
    String? scrollBehavior,
    List<FigmaDocument>? children,
    Color? backgroundColor,
    dynamic prototypeStartNodeID,
    List<dynamic>? flowStartingPoints,
    PrototypeDevice? prototypeDevice,
    List<ExportSettings>? exportSettings,
    String? blendMode,
    AbsoluteBoundingBox? absoluteBoundingBox,
    AbsoluteBoundingBox? absoluteRenderBounds,
    Constraints? constraints,
    List<Fills>? fills,
    List<dynamic>? strokes,
    double? strokeWeight,
    String? strokeAlign,
    List<dynamic>? effects,
    String? characters,
    Style? style,
    List<dynamic>? characterStyleOverrides,
    StyleOverrideTable? styleOverrideTable,
    List<String>? lineTypes,
    List<int>? lineIndentations,
    bool? clipsContent,
    List<Background>? background,
    String? strokeJoin,
    dynamic strokeMiterAngle,
  }) = _FigmaDocument;
  factory FigmaDocument.fromJson(Map<String, dynamic> json) =>
      _$FigmaDocumentFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class AbsoluteBoundingBox with _$AbsoluteBoundingBox {
  const factory AbsoluteBoundingBox({
    double? x,
    double? y,
    double? width,
    double? height,
  }) = _AbsoluteBoundingBox;
  factory AbsoluteBoundingBox.fromJson(Map<String, dynamic> json) =>
      _$AbsoluteBoundingBoxFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class Constraints with _$Constraints {
  const factory Constraints({
    String? vertical,
    String? horizontal,
  }) = _Constraints;
  factory Constraints.fromJson(Map<String, dynamic> json) =>
      _$ConstraintsFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class Fills with _$Fills {
  const factory Fills({
    String? blendMode,
    String? type,
    Color? color,
  }) = _Fills;
  factory Fills.fromJson(Map<String, dynamic> json) => _$FillsFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class Color with _$Color {
  const factory Color({
    double? r,
    double? g,
    double? b,
    int? a,
  }) = _Color;
  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class Style with _$Style {
  const factory Style({
    String? fontFamily,
    String? fontPostScriptName,
    int? fontWeight,
    String? textAutoResize,
    int? fontSize,
    String? textAlignHorizontal,
    String? textAlignVertical,
    double? letterSpacing,
    double? lineHeightPx,
    double? lineHeightPercent,
    String? lineHeightUnit,
  }) = _Style;
  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class StyleOverrideTable with _$StyleOverrideTable {
  const factory StyleOverrideTable({
    // TODO(hodoan): any?
    dynamic mm,
  }) = _StyleOverrideTable;
  factory StyleOverrideTable.fromJson(Map<String, dynamic> json) =>
      _$StyleOverrideTableFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class Background with _$Background {
  const factory Background({
    String? blendMode,
    bool? visible,
    String? type,
    Color? color,
  }) = _Background;
  factory Background.fromJson(Map<String, dynamic> json) =>
      _$BackgroundFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class PrototypeDevice with _$PrototypeDevice {
  const factory PrototypeDevice({
    String? type,
    String? rotation,
  }) = _PrototypeDevice;
  factory PrototypeDevice.fromJson(Map<String, dynamic> json) =>
      _$PrototypeDeviceFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class ExportSettings with _$ExportSettings {
  const factory ExportSettings({
    String? suffix,
    String? format,
    Constraint? constraint,
  }) = _ExportSettings;
  factory ExportSettings.fromJson(Map<String, dynamic> json) =>
      _$ExportSettingsFromJson(json);
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.none,
)
class Constraint with _$Constraint {
  const factory Constraint({
    String? type,
    int? value,
  }) = _Constraint;
  factory Constraint.fromJson(Map<String, dynamic> json) =>
      _$ConstraintFromJson(json);
}
