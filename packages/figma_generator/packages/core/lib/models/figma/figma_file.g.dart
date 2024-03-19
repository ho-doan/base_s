// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaFile _$FigmaFileFromJson(Map json) => $checkedCreate(
      'FigmaFile',
      json,
      ($checkedConvert) {
        final val = FigmaFile(
          components: $checkedConvert(
              'components',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(
                        k as String,
                        Component.fromJson(
                            Map<String, dynamic>.from(e as Map))),
                  )),
          document: $checkedConvert(
              'document',
              (v) => v == null
                  ? null
                  : FigmaDocument.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          componentSets: $checkedConvert(
              'componentSets',
              (v) => v == null
                  ? null
                  : StyleOverrideTable.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          schemaVersion: $checkedConvert('schemaVersion', (v) => v as int?),
          styles: $checkedConvert(
              'styles',
              (v) => v == null
                  ? null
                  : StyleOverrideTable.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          name: $checkedConvert('name', (v) => v as String?),
          lastModified: $checkedConvert('lastModified', (v) => v as String?),
          thumbnailUrl: $checkedConvert('thumbnailUrl', (v) => v as String?),
          version: $checkedConvert('version', (v) => v as String?),
          role: $checkedConvert('role', (v) => v as String?),
          editorType: $checkedConvert('editorType', (v) => v as String?),
          linkAccess: $checkedConvert('linkAccess', (v) => v as String?),
        );
        return val;
      },
    );

Component _$ComponentFromJson(Map json) => $checkedCreate(
      'Component',
      json,
      ($checkedConvert) {
        final val = Component(
          key: $checkedConvert('key', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          remote: $checkedConvert('remote', (v) => v as bool?),
          documentationLinks:
              $checkedConvert('documentationLinks', (v) => v as List<dynamic>?),
        );
        return val;
      },
    );
