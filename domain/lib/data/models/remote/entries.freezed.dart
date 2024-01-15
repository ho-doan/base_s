// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Entries _$EntriesFromJson(Map<String, dynamic> json) {
  return _Entries.fromJson(json);
}

/// @nodoc
mixin _$Entries {
  int get count => throw _privateConstructorUsedError;
  List<Entry> get entries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntriesCopyWith<Entries> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntriesCopyWith<$Res> {
  factory $EntriesCopyWith(Entries value, $Res Function(Entries) then) =
      _$EntriesCopyWithImpl<$Res, Entries>;
  @useResult
  $Res call({int count, List<Entry> entries});
}

/// @nodoc
class _$EntriesCopyWithImpl<$Res, $Val extends Entries>
    implements $EntriesCopyWith<$Res> {
  _$EntriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? entries = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<Entry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntriesImplCopyWith<$Res> implements $EntriesCopyWith<$Res> {
  factory _$$EntriesImplCopyWith(
          _$EntriesImpl value, $Res Function(_$EntriesImpl) then) =
      __$$EntriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<Entry> entries});
}

/// @nodoc
class __$$EntriesImplCopyWithImpl<$Res>
    extends _$EntriesCopyWithImpl<$Res, _$EntriesImpl>
    implements _$$EntriesImplCopyWith<$Res> {
  __$$EntriesImplCopyWithImpl(
      _$EntriesImpl _value, $Res Function(_$EntriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? entries = null,
  }) {
    return _then(_$EntriesImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<Entry>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EntriesImpl implements _Entries {
  const _$EntriesImpl({this.count = 0, final List<Entry> entries = const []})
      : _entries = entries;

  factory _$EntriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntriesImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  final List<Entry> _entries;
  @override
  @JsonKey()
  List<Entry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'Entries(count: $count, entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntriesImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntriesImplCopyWith<_$EntriesImpl> get copyWith =>
      __$$EntriesImplCopyWithImpl<_$EntriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntriesImplToJson(
      this,
    );
  }
}

abstract class _Entries implements Entries {
  const factory _Entries({final int count, final List<Entry> entries}) =
      _$EntriesImpl;

  factory _Entries.fromJson(Map<String, dynamic> json) = _$EntriesImpl.fromJson;

  @override
  int get count;
  @override
  List<Entry> get entries;
  @override
  @JsonKey(ignore: true)
  _$$EntriesImplCopyWith<_$EntriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
