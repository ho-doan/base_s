// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return _Entry.fromJson(json);
}

/// @nodoc
mixin _$Entry {
  @JsonKey(name: 'API')
  String? get aPI => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Auth')
  String? get auth => throw _privateConstructorUsedError;
  @JsonKey(name: 'HTTPS')
  bool? get hTTPS => throw _privateConstructorUsedError;
  @JsonKey(name: 'Cors')
  String? get cors => throw _privateConstructorUsedError;
  @JsonKey(name: 'Link')
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryCopyWith<Entry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<$Res> {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) then) =
      _$EntryCopyWithImpl<$Res, Entry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'API') String? aPI,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Auth') String? auth,
      @JsonKey(name: 'HTTPS') bool? hTTPS,
      @JsonKey(name: 'Cors') String? cors,
      @JsonKey(name: 'Link') String? link,
      @JsonKey(name: 'Category') String? category});
}

/// @nodoc
class _$EntryCopyWithImpl<$Res, $Val extends Entry>
    implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aPI = freezed,
    Object? description = freezed,
    Object? auth = freezed,
    Object? hTTPS = freezed,
    Object? cors = freezed,
    Object? link = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      aPI: freezed == aPI
          ? _value.aPI
          : aPI // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      hTTPS: freezed == hTTPS
          ? _value.hTTPS
          : hTTPS // ignore: cast_nullable_to_non_nullable
              as bool?,
      cors: freezed == cors
          ? _value.cors
          : cors // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntryImplCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$$EntryImplCopyWith(
          _$EntryImpl value, $Res Function(_$EntryImpl) then) =
      __$$EntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'API') String? aPI,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'Auth') String? auth,
      @JsonKey(name: 'HTTPS') bool? hTTPS,
      @JsonKey(name: 'Cors') String? cors,
      @JsonKey(name: 'Link') String? link,
      @JsonKey(name: 'Category') String? category});
}

/// @nodoc
class __$$EntryImplCopyWithImpl<$Res>
    extends _$EntryCopyWithImpl<$Res, _$EntryImpl>
    implements _$$EntryImplCopyWith<$Res> {
  __$$EntryImplCopyWithImpl(
      _$EntryImpl _value, $Res Function(_$EntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aPI = freezed,
    Object? description = freezed,
    Object? auth = freezed,
    Object? hTTPS = freezed,
    Object? cors = freezed,
    Object? link = freezed,
    Object? category = freezed,
  }) {
    return _then(_$EntryImpl(
      aPI: freezed == aPI
          ? _value.aPI
          : aPI // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      hTTPS: freezed == hTTPS
          ? _value.hTTPS
          : hTTPS // ignore: cast_nullable_to_non_nullable
              as bool?,
      cors: freezed == cors
          ? _value.cors
          : cors // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntryImpl implements _Entry {
  const _$EntryImpl(
      {@JsonKey(name: 'API') this.aPI,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'Auth') this.auth,
      @JsonKey(name: 'HTTPS') this.hTTPS,
      @JsonKey(name: 'Cors') this.cors,
      @JsonKey(name: 'Link') this.link,
      @JsonKey(name: 'Category') this.category});

  factory _$EntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntryImplFromJson(json);

  @override
  @JsonKey(name: 'API')
  final String? aPI;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'Auth')
  final String? auth;
  @override
  @JsonKey(name: 'HTTPS')
  final bool? hTTPS;
  @override
  @JsonKey(name: 'Cors')
  final String? cors;
  @override
  @JsonKey(name: 'Link')
  final String? link;
  @override
  @JsonKey(name: 'Category')
  final String? category;

  @override
  String toString() {
    return 'Entry(aPI: $aPI, description: $description, auth: $auth, hTTPS: $hTTPS, cors: $cors, link: $link, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryImpl &&
            (identical(other.aPI, aPI) || other.aPI == aPI) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.hTTPS, hTTPS) || other.hTTPS == hTTPS) &&
            (identical(other.cors, cors) || other.cors == cors) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, aPI, description, auth, hTTPS, cors, link, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      __$$EntryImplCopyWithImpl<_$EntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntryImplToJson(
      this,
    );
  }
}

abstract class _Entry implements Entry {
  const factory _Entry(
      {@JsonKey(name: 'API') final String? aPI,
      @JsonKey(name: 'Description') final String? description,
      @JsonKey(name: 'Auth') final String? auth,
      @JsonKey(name: 'HTTPS') final bool? hTTPS,
      @JsonKey(name: 'Cors') final String? cors,
      @JsonKey(name: 'Link') final String? link,
      @JsonKey(name: 'Category') final String? category}) = _$EntryImpl;

  factory _Entry.fromJson(Map<String, dynamic> json) = _$EntryImpl.fromJson;

  @override
  @JsonKey(name: 'API')
  String? get aPI;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'Auth')
  String? get auth;
  @override
  @JsonKey(name: 'HTTPS')
  bool? get hTTPS;
  @override
  @JsonKey(name: 'Cors')
  String? get cors;
  @override
  @JsonKey(name: 'Link')
  String? get link;
  @override
  @JsonKey(name: 'Category')
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
