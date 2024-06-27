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
            'dir_local_data_source',
            'dir_remote_data_source',
            'dir_repository',
            'dir_use_case'
          ],
        );
        final val = ConfigModel(
          dirLocalModel: $checkedConvert('dir_local_model',
              (v) => v as String? ?? 'domain/lib/data/models/local'),
          localSchema: $checkedConvert(
              'local_schema',
              (v) =>
                  v as String? ??
                  'domain/lib/services/local_database/_local_database.dart'),
          dirRemoteModel: $checkedConvert('dir_remote_model',
              (v) => v as String? ?? 'domain/lib/data/models/remote'),
          dirLocalDataSource: $checkedConvert('dir_local_data_source',
              (v) => v as String? ?? 'domain/lib/data/local_data_sources'),
          dirRemoteDataSource: $checkedConvert('dir_remote_data_source',
              (v) => v as String? ?? 'domain/lib/data/remote_data_sources'),
          dirModel: $checkedConvert(
              'dir_model', (v) => v as String? ?? 'domain/lib/models'),
          dirRepository: $checkedConvert('dir_repository',
              (v) => v as String? ?? 'domain/lib/repositories'),
          dirUseCase: $checkedConvert(
              'dir_use_case', (v) => v as String? ?? 'domain/lib/use_cases'),
          webLocator: $checkedConvert('web_locator', (v) => v as String?),
          service: $checkedConvert('service', (v) => v as String?),
          replace: $checkedConvert('replace', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {
        'dirLocalModel': 'dir_local_model',
        'localSchema': 'local_schema',
        'dirRemoteModel': 'dir_remote_model',
        'dirLocalDataSource': 'dir_local_data_source',
        'dirRemoteDataSource': 'dir_remote_data_source',
        'dirModel': 'dir_model',
        'dirRepository': 'dir_repository',
        'dirUseCase': 'dir_use_case',
        'webLocator': 'web_locator'
      },
    );
