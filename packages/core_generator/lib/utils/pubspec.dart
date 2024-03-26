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
    this.dirLocalModel = 'domain/lib/data/models',
    this.imgs,
    this.icons,
  });
  factory ConfigModel.fromJson(Map json) => _$ConfigModelFromJson(json);

  @JsonKey(name: 'dir_local_model', required: true)
  final String? dirLocalModel;
  @JsonKey(name: 'imgs')
  final List<Map<String, String>>? imgs;
  @JsonKey(name: 'icons')
  final List<Map<String, String>>? icons;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ImageConfig> get imgConfigs => [
        for (final i in imgs ?? <Map<String, String>>[])
          for (final j in i.entries) ImageConfig(id: j.key, name: j.value),
      ];
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ImageConfig> get iconConfigs => [
        for (final i in icons ?? <Map<String, String>>[])
          for (final j in i.entries) ImageConfig(id: j.key, name: j.value),
      ];
}

class ImageConfig {
  ImageConfig({required this.id, required this.name});
  final String id;
  final String name;

  @override
  String toString() => 'id: $id, name: $name';
}
