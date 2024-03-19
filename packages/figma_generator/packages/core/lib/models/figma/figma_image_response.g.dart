// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaImageResponse _$FigmaImageResponseFromJson(Map json) => $checkedCreate(
      'FigmaImageResponse',
      json,
      ($checkedConvert) {
        final val = FigmaImageResponse(
          error: $checkedConvert('error', (v) => v as bool?),
          status: $checkedConvert('status', (v) => v as int?),
          meta: $checkedConvert(
              'meta', (v) => v == null ? null : Meta.fromJson(v as Map)),
          i18n: $checkedConvert('i18n', (v) => v),
          images: $checkedConvert(
              'images',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e as String),
                  )),
        );
        return val;
      },
    );

Meta _$MetaFromJson(Map json) => $checkedCreate(
      'Meta',
      json,
      ($checkedConvert) {
        final val = Meta(
          images: $checkedConvert(
              'images',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e as String),
                  )),
        );
        return val;
      },
    );
