// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntriesImpl _$$EntriesImplFromJson(Map<String, dynamic> json) =>
    _$EntriesImpl(
      count: json['count'] as int? ?? 0,
      entries: (json['entries'] as List<dynamic>?)
              ?.map((e) => EntryRemote.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EntriesImplToJson(_$EntriesImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
