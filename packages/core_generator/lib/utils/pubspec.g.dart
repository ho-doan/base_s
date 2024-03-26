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
          requiredKeys: const ['name', 'core_generator'],
        );
        final val = Pubspec(
          packageName: $checkedConvert('name', (v) => v as String),
          config: $checkedConvert(
              'core_generator', (v) => ConfigModel.fromJson(v as Map)),
        );
        return val;
      },
      fieldKeyMap: const {'packageName': 'name', 'config': 'core_generator'},
    );

ConfigModel _$ConfigModelFromJson(Map json) => $checkedCreate(
      'ConfigModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'dir_local_model',
            'dir_remote_model',
            'dir_model',
            'dir_local_data_source'
          ],
        );
        final val = ConfigModel(
          dirLocalModel: $checkedConvert('dir_local_model',
              (v) => v as String? ?? 'domain/lib/data/models/local'),
          dirRemoteModel: $checkedConvert('dir_remote_model',
              (v) => v as String? ?? 'domain/lib/data/models/remote'),
          dirLocalDataSource: $checkedConvert('dir_local_data_source',
              (v) => v as String? ?? 'domain/lib/data/local_data_sources'),
          dirModel: $checkedConvert(
              'dir_model', (v) => v as String? ?? 'domain/lib/models'),
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
        'dirLocalModel': 'dir_local_model',
        'dirRemoteModel': 'dir_remote_model',
        'dirLocalDataSource': 'dir_local_data_source',
        'dirModel': 'dir_model'
      },
    );
