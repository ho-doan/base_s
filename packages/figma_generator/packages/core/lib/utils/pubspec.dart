import 'package:json_annotation/json_annotation.dart';

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
  });

  @JsonKey(name: 'figma_key', required: true)
  final String figmaKey;
  @JsonKey(name: 'figma_token', required: true)
  final String figmaToken;
  @JsonKey(name: 'dir_output', required: true)
  final String dirOutput;

  factory FigmaGen.fromJson(Map json) => _$FigmaGenFromJson(json);
}
