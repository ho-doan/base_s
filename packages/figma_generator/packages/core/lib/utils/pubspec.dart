import 'package:json_annotation/json_annotation.dart';

import '../services/translator/translator.dart';

part 'pubspec.g.dart';

@JsonSerializable()
class Pubspec {
  Pubspec({
    required this.packageName,
    required this.figmaGen,
  });

  factory Pubspec.fromJson(Map json) => _$PubspecFromJson(json);

  @JsonKey(name: 'name', required: true)
  final String packageName;

  @JsonKey(name: 'figma_gen', required: true)
  final FigmaGen figmaGen;
}

@JsonSerializable()
class FigmaGen {
  FigmaGen({
    required this.figmaKey,
    required this.figmaToken,
    required this.dirOutput,
    required this.langs,
    this.dirImg = 'assets/images',
    this.dirIcons = 'assets/icons',
    this.imgs,
    this.icons,
  });
  factory FigmaGen.fromJson(Map json) => _$FigmaGenFromJson(json);

  @JsonKey(name: 'figma_key', required: true)
  final String figmaKey;
  @JsonKey(name: 'figma_token', required: true)
  final String? figmaToken;
  @JsonKey(name: 'dir_output', required: true)
  final String dirOutput;
  @JsonKey(name: 'dir_img', required: true)
  final String dirImg;
  @JsonKey(name: 'dir_icons', required: true)
  final String dirIcons;
  @JsonKey(name: 'langs', required: true)
  final List<String> langs;
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
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<Lang> get enumLangs {
    return langs.map(getLangByString).toList();
  }

  @override
  String toString() =>
      'figma_key: $figmaKey, figmaToken: $figmaToken, dirOutput: $dirOutput,'
      ' langs: ${langs.join(', ')}';
}

class ImageConfig {
  ImageConfig({required this.id, required this.name});
  final String id;
  final String name;

  @override
  String toString() => 'id: $id, name: $name';
}
