// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaDocument _$FigmaDocumentFromJson(Map json) => $checkedCreate(
      'FigmaDocument',
      json,
      ($checkedConvert) {
        final val = FigmaDocument(
          id: $checkedConvert('id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          scrollBehavior:
              $checkedConvert('scrollBehavior', (v) => v as String?),
          children: $checkedConvert(
              'children',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => FigmaDocument.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          backgroundColor: $checkedConvert(
              'backgroundColor',
              (v) => v == null
                  ? null
                  : Color.fromJson(Map<String, dynamic>.from(v as Map))),
          prototypeStartNodeID:
              $checkedConvert('prototypeStartNodeID', (v) => v),
          flowStartingPoints:
              $checkedConvert('flowStartingPoints', (v) => v as List<dynamic>?),
          prototypeDevice: $checkedConvert(
              'prototypeDevice',
              (v) => v == null
                  ? null
                  : PrototypeDevice.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          exportSettings: $checkedConvert(
              'exportSettings',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => ExportSettings.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          blendMode: $checkedConvert('blendMode', (v) => v as String?),
          absoluteBoundingBox: $checkedConvert(
              'absoluteBoundingBox',
              (v) => v == null
                  ? null
                  : AbsoluteBoundingBox.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          absoluteRenderBounds: $checkedConvert(
              'absoluteRenderBounds',
              (v) => v == null
                  ? null
                  : AbsoluteBoundingBox.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          constraints: $checkedConvert(
              'constraints',
              (v) => v == null
                  ? null
                  : Constraints.fromJson(Map<String, dynamic>.from(v as Map))),
          fills: $checkedConvert(
              'fills',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      Fills.fromJson(Map<String, dynamic>.from(e as Map)))
                  .toList()),
          strokes: $checkedConvert('strokes', (v) => v as List<dynamic>?),
          strokeWeight:
              $checkedConvert('strokeWeight', (v) => (v as num?)?.toDouble()),
          strokeAlign: $checkedConvert('strokeAlign', (v) => v as String?),
          effects: $checkedConvert('effects', (v) => v as List<dynamic>?),
          characters: $checkedConvert('characters', (v) => v as String?),
          style: $checkedConvert(
              'style',
              (v) => v == null
                  ? null
                  : Style.fromJson(Map<String, dynamic>.from(v as Map))),
          characterStyleOverrides: $checkedConvert(
              'characterStyleOverrides', (v) => v as List<dynamic>?),
          styleOverrideTable: $checkedConvert(
              'styleOverrideTable',
              (v) => v == null
                  ? null
                  : StyleOverrideTable.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          lineTypes: $checkedConvert('lineTypes',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          lineIndentations: $checkedConvert('lineIndentations',
              (v) => (v as List<dynamic>?)?.map((e) => e as int).toList()),
          clipsContent: $checkedConvert('clipsContent', (v) => v as bool?),
          background: $checkedConvert(
              'background',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      Background.fromJson(Map<String, dynamic>.from(e as Map)))
                  .toList()),
          strokeJoin: $checkedConvert('strokeJoin', (v) => v as String?),
          strokeMiterAngle: $checkedConvert('strokeMiterAngle', (v) => v),
        );
        return val;
      },
    );

AbsoluteBoundingBox _$AbsoluteBoundingBoxFromJson(Map json) => $checkedCreate(
      'AbsoluteBoundingBox',
      json,
      ($checkedConvert) {
        final val = AbsoluteBoundingBox(
          x: $checkedConvert('x', (v) => (v as num?)?.toDouble()),
          y: $checkedConvert('y', (v) => (v as num?)?.toDouble()),
          width: $checkedConvert('width', (v) => (v as num?)?.toDouble()),
          height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Constraints _$ConstraintsFromJson(Map json) => $checkedCreate(
      'Constraints',
      json,
      ($checkedConvert) {
        final val = Constraints(
          vertical: $checkedConvert('vertical', (v) => v as String?),
          horizontal: $checkedConvert('horizontal', (v) => v as String?),
        );
        return val;
      },
    );

Fills _$FillsFromJson(Map json) => $checkedCreate(
      'Fills',
      json,
      ($checkedConvert) {
        final val = Fills(
          blendMode: $checkedConvert('blendMode', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          color: $checkedConvert(
              'color',
              (v) => v == null
                  ? null
                  : Color.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Color _$ColorFromJson(Map json) => $checkedCreate(
      'Color',
      json,
      ($checkedConvert) {
        final val = Color(
          r: $checkedConvert('r', (v) => (v as num?)?.toDouble()),
          g: $checkedConvert('g', (v) => (v as num?)?.toDouble()),
          b: $checkedConvert('b', (v) => (v as num?)?.toDouble()),
          a: $checkedConvert('a', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Style _$StyleFromJson(Map json) => $checkedCreate(
      'Style',
      json,
      ($checkedConvert) {
        final val = Style(
          fontFamily: $checkedConvert('fontFamily', (v) => v as String?),
          fontPostScriptName:
              $checkedConvert('fontPostScriptName', (v) => v as String?),
          fontWeight: $checkedConvert('fontWeight', (v) => v as int?),
          textAutoResize:
              $checkedConvert('textAutoResize', (v) => v as String?),
          fontSize: $checkedConvert('fontSize', (v) => v as double?),
          textAlignHorizontal:
              $checkedConvert('textAlignHorizontal', (v) => v as String?),
          textAlignVertical:
              $checkedConvert('textAlignVertical', (v) => v as String?),
          letterSpacing:
              $checkedConvert('letterSpacing', (v) => (v as num?)?.toDouble()),
          lineHeightPx:
              $checkedConvert('lineHeightPx', (v) => (v as num?)?.toDouble()),
          lineHeightPercent: $checkedConvert(
              'lineHeightPercent', (v) => (v as num?)?.toDouble()),
          lineHeightUnit:
              $checkedConvert('lineHeightUnit', (v) => v as String?),
        );
        return val;
      },
    );

StyleOverrideTable _$StyleOverrideTableFromJson(Map json) => $checkedCreate(
      'StyleOverrideTable',
      json,
      ($checkedConvert) {
        final val = StyleOverrideTable(
          mm: $checkedConvert('mm', (v) => v),
        );
        return val;
      },
    );

Background _$BackgroundFromJson(Map json) => $checkedCreate(
      'Background',
      json,
      ($checkedConvert) {
        final val = Background(
          blendMode: $checkedConvert('blendMode', (v) => v as String?),
          visible: $checkedConvert('visible', (v) => v as bool?),
          type: $checkedConvert('type', (v) => v as String?),
          color: $checkedConvert(
              'color',
              (v) => v == null
                  ? null
                  : Color.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

PrototypeDevice _$PrototypeDeviceFromJson(Map json) => $checkedCreate(
      'PrototypeDevice',
      json,
      ($checkedConvert) {
        final val = PrototypeDevice(
          type: $checkedConvert('type', (v) => v as String?),
          rotation: $checkedConvert('rotation', (v) => v as String?),
        );
        return val;
      },
    );

ExportSettings _$ExportSettingsFromJson(Map json) => $checkedCreate(
      'ExportSettings',
      json,
      ($checkedConvert) {
        final val = ExportSettings(
          suffix: $checkedConvert('suffix', (v) => v as String?),
          format: $checkedConvert('format', (v) => v as String?),
          constraint: $checkedConvert(
              'constraint',
              (v) => v == null
                  ? null
                  : Constraint.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Constraint _$ConstraintFromJson(Map json) => $checkedCreate(
      'Constraint',
      json,
      ($checkedConvert) {
        final val = Constraint(
          type: $checkedConvert('type', (v) => v as String?),
          value: $checkedConvert('value', (v) => v as int?),
        );
        return val;
      },
    );
