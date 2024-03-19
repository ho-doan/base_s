import 'package:json_annotation/json_annotation.dart';

part 'figma_image_response.g.dart';

@JsonSerializable()
class FigmaImageResponse {
  FigmaImageResponse({
    this.error,
    this.status,
    this.meta,
    this.i18n,
    this.images,
  });

  factory FigmaImageResponse.fromJson(Map<String, dynamic> json) =>
      _$FigmaImageResponseFromJson(json);
  final bool? error;
  final int? status;

  /// using when download all image
  final Meta? meta;

  /// using when download all image ids
  final Map<String, String>? images;
  final dynamic i18n;
}

@JsonSerializable()
class Meta {
  const Meta({this.images});
  factory Meta.fromJson(Map<dynamic, dynamic> json) => _$MetaFromJson(json);
  final Map<String, String>? images;
}
