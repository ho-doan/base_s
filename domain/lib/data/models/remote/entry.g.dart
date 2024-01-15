// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryImpl _$$EntryImplFromJson(Map<String, dynamic> json) => _$EntryImpl(
      aPI: json['API'] as String?,
      description: json['Description'] as String?,
      auth: json['Auth'] as String?,
      hTTPS: json['HTTPS'] as bool?,
      cors: json['Cors'] as String?,
      link: json['Link'] as String?,
      category: json['Category'] as String?,
    );

Map<String, dynamic> _$$EntryImplToJson(_$EntryImpl instance) =>
    <String, dynamic>{
      'API': instance.aPI,
      'Description': instance.description,
      'Auth': instance.auth,
      'HTTPS': instance.hTTPS,
      'Cors': instance.cors,
      'Link': instance.link,
      'Category': instance.category,
    };
