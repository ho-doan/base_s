import 'package:json_annotation/json_annotation.dart';

part 'pubspec.g.dart';

@JsonSerializable()
class Pubspec {
  Pubspec({
    required this.packageName,
    required this.config,
  });

  factory Pubspec.fromJson(Map json) => _$PubspecFromJson(json);

  @JsonKey(name: 'name', required: true)
  final String packageName;

  @JsonKey(name: 'core_generator', required: true)
  final ConfigModel config;
}

@JsonSerializable()
class ConfigModel {
  ConfigModel({
    this.dirLocalModel = 'domain/lib/data/models/local',
    this.localSchema =
        'domain/lib/services/local_database/_local_database.dart',
    this.dirRemoteModel = 'domain/lib/data/models/remote',
    this.dirLocalDataSource = 'domain/lib/data/local_data_sources',
    this.dirRemoteDataSource = 'domain/lib/data/remote_data_sources',
    this.dirModel = 'domain/lib/models',
    this.dirRepository = 'domain/lib/repositories',
    this.dirUseCase = 'domain/lib/use_cases',
    this.webLocator,
    this.replace = false,
  });
  factory ConfigModel.fromJson(Map json) => _$ConfigModelFromJson(json);

  @JsonKey(name: 'dir_local_model', required: true)
  final String? dirLocalModel;
  @JsonKey(name: 'dir_remote_model', required: true)
  final String? dirRemoteModel;
  @JsonKey(name: 'dir_model', required: true)
  final String? dirModel;
  @JsonKey(name: 'dir_local_data_source', required: true)
  final String? dirLocalDataSource;
  @JsonKey(name: 'dir_remote_data_source', required: true)
  final String? dirRemoteDataSource;
  @JsonKey(name: 'dir_repository', required: true)
  final String? dirRepository;
  @JsonKey(name: 'web_locator')
  final String? webLocator;
  @JsonKey(name: 'local_schema')
  final String? localSchema;
  @JsonKey(name: 'replace')
  final bool? replace;
  @JsonKey(name: 'dir_use_case', required: true)
  final String? dirUseCase;
}
