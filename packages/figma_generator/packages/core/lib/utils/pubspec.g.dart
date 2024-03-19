// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pubspec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pubspec _$PubspecFromJson(Map json) => $checkedCreate(
      'Pubspec',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['name', 'figma_gen'],
        );
        final val = Pubspec(
          packageName: $checkedConvert('name', (v) => v as String),
          figmaGen:
              $checkedConvert('figma_gen', (v) => FigmaGen.fromJson(v as Map)),
        );
        return val;
      },
      fieldKeyMap: const {'packageName': 'name', 'figmaGen': 'figma_gen'},
    );

FigmaGen _$FigmaGenFromJson(Map json) => $checkedCreate(
      'FigmaGen',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'figma_key',
            'figma_token',
            'dir_output',
            'langs'
          ],
        );
        final val = FigmaGen(
          figmaKey: $checkedConvert('figma_key', (v) => v as String),
          figmaToken: $checkedConvert('figma_token', (v) => v as String?),
          dirOutput: $checkedConvert('dir_output', (v) => v as String),
          langs: $checkedConvert('langs',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'figmaKey': 'figma_key',
        'figmaToken': 'figma_token',
        'dirOutput': 'dir_output'
      },
    );
