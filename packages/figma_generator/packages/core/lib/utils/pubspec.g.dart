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
            'dir_img',
            'dir_icons',
            'langs'
          ],
        );
        final val = FigmaGen(
          figmaKey: $checkedConvert('figma_key', (v) => v as String),
          figmaToken: $checkedConvert('figma_token', (v) => v as String?),
          dirOutput: $checkedConvert('dir_output', (v) => v as String),
          langs: $checkedConvert('langs',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          dirImg: $checkedConvert(
              'dir_img', (v) => v as String? ?? 'assets/images'),
          dirIcons: $checkedConvert(
              'dir_icons', (v) => v as String? ?? 'assets/icons'),
          imgs: $checkedConvert(
              'imgs',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Map<String, String>.from(e as Map))
                  .toList()),
          icons: $checkedConvert(
              'icons',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Map<String, String>.from(e as Map))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'figmaKey': 'figma_key',
        'figmaToken': 'figma_token',
        'dirOutput': 'dir_output',
        'dirImg': 'dir_img',
        'dirIcons': 'dir_icons'
      },
    );
