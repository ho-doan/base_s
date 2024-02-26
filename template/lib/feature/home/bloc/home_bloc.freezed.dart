// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeEvent.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)
        data,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Data value) data,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Data value)? data,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeEvent.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)
        data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Data value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Data value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeEvent {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorState<dynamic> error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorState<dynamic>,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final ErrorState<dynamic> error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeEvent.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)
        data,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Data value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Data value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HomeEvent {
  const factory _Error(final ErrorState<dynamic> error) = _$ErrorImpl;

  ErrorState<dynamic> get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<EntryModel>? entries,
      List<EntryModel>? entries1,
      List<EntryModel>? entries2,
      List<EntryModel>? entries3,
      Categories? categories});

  $CategoriesCopyWith<$Res>? get categories;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = freezed,
    Object? entries1 = freezed,
    Object? entries2 = freezed,
    Object? entries3 = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$DataImpl(
      entries: freezed == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<EntryModel>?,
      entries1: freezed == entries1
          ? _value._entries1
          : entries1 // ignore: cast_nullable_to_non_nullable
              as List<EntryModel>?,
      entries2: freezed == entries2
          ? _value._entries2
          : entries2 // ignore: cast_nullable_to_non_nullable
              as List<EntryModel>?,
      entries3: freezed == entries3
          ? _value._entries3
          : entries3 // ignore: cast_nullable_to_non_nullable
              as List<EntryModel>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Categories?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoriesCopyWith<$Res>? get categories {
    if (_value.categories == null) {
      return null;
    }

    return $CategoriesCopyWith<$Res>(_value.categories!, (value) {
      return _then(_value.copyWith(categories: value));
    });
  }
}

/// @nodoc

class _$DataImpl with DiagnosticableTreeMixin implements _Data {
  const _$DataImpl(
      {final List<EntryModel>? entries = null,
      final List<EntryModel>? entries1 = null,
      final List<EntryModel>? entries2 = null,
      final List<EntryModel>? entries3 = null,
      this.categories = null})
      : _entries = entries,
        _entries1 = entries1,
        _entries2 = entries2,
        _entries3 = entries3;

  final List<EntryModel>? _entries;
  @override
  @JsonKey()
  List<EntryModel>? get entries {
    final value = _entries;
    if (value == null) return null;
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EntryModel>? _entries1;
  @override
  @JsonKey()
  List<EntryModel>? get entries1 {
    final value = _entries1;
    if (value == null) return null;
    if (_entries1 is EqualUnmodifiableListView) return _entries1;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EntryModel>? _entries2;
  @override
  @JsonKey()
  List<EntryModel>? get entries2 {
    final value = _entries2;
    if (value == null) return null;
    if (_entries2 is EqualUnmodifiableListView) return _entries2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EntryModel>? _entries3;
  @override
  @JsonKey()
  List<EntryModel>? get entries3 {
    final value = _entries3;
    if (value == null) return null;
    if (_entries3 is EqualUnmodifiableListView) return _entries3;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final Categories? categories;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.data(entries: $entries, entries1: $entries1, entries2: $entries2, entries3: $entries3, categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeEvent.data'))
      ..add(DiagnosticsProperty('entries', entries))
      ..add(DiagnosticsProperty('entries1', entries1))
      ..add(DiagnosticsProperty('entries2', entries2))
      ..add(DiagnosticsProperty('entries3', entries3))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            const DeepCollectionEquality().equals(other._entries1, _entries1) &&
            const DeepCollectionEquality().equals(other._entries2, _entries2) &&
            const DeepCollectionEquality().equals(other._entries3, _entries3) &&
            (identical(other.categories, categories) ||
                other.categories == categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_entries),
      const DeepCollectionEquality().hash(_entries1),
      const DeepCollectionEquality().hash(_entries2),
      const DeepCollectionEquality().hash(_entries3),
      categories);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)
        data,
  }) {
    return data(entries, entries1, entries2, entries3, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
  }) {
    return data?.call(entries, entries1, entries2, entries3, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories? categories)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(entries, entries1, entries2, entries3, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements HomeEvent {
  const factory _Data(
      {final List<EntryModel>? entries,
      final List<EntryModel>? entries1,
      final List<EntryModel>? entries2,
      final List<EntryModel>? entries3,
      final Categories? categories}) = _$DataImpl;

  List<EntryModel>? get entries;
  List<EntryModel>? get entries1;
  List<EntryModel>? get entries2;
  List<EntryModel>? get entries3;
  Categories? get categories;
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($Initial value) initial,
    required TResult Function($Loading value) loading,
    required TResult Function($Error value) error,
    required TResult Function($Data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($Initial value)? initial,
    TResult? Function($Loading value)? loading,
    TResult? Function($Error value)? error,
    TResult? Function($Data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($Initial value)? initial,
    TResult Function($Loading value)? loading,
    TResult Function($Error value)? error,
    TResult Function($Data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$$InitialImplCopyWith<$Res> {
  factory _$$$InitialImplCopyWith(
          _$$InitialImpl value, $Res Function(_$$InitialImpl) then) =
      __$$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$$InitialImpl>
    implements _$$$InitialImplCopyWith<$Res> {
  __$$$InitialImplCopyWithImpl(
      _$$InitialImpl _value, $Res Function(_$$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$$InitialImpl with DiagnosticableTreeMixin implements $Initial {
  const _$$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)
        data,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($Initial value) initial,
    required TResult Function($Loading value) loading,
    required TResult Function($Error value) error,
    required TResult Function($Data value) data,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($Initial value)? initial,
    TResult? Function($Loading value)? loading,
    TResult? Function($Error value)? error,
    TResult? Function($Data value)? data,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($Initial value)? initial,
    TResult Function($Loading value)? loading,
    TResult Function($Error value)? error,
    TResult Function($Data value)? data,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class $Initial implements HomeState {
  const factory $Initial() = _$$InitialImpl;
}

/// @nodoc
abstract class _$$$LoadingImplCopyWith<$Res> {
  factory _$$$LoadingImplCopyWith(
          _$$LoadingImpl value, $Res Function(_$$LoadingImpl) then) =
      __$$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$$LoadingImpl>
    implements _$$$LoadingImplCopyWith<$Res> {
  __$$$LoadingImplCopyWithImpl(
      _$$LoadingImpl _value, $Res Function(_$$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$$LoadingImpl with DiagnosticableTreeMixin implements $Loading {
  const _$$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)
        data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($Initial value) initial,
    required TResult Function($Loading value) loading,
    required TResult Function($Error value) error,
    required TResult Function($Data value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($Initial value)? initial,
    TResult? Function($Loading value)? loading,
    TResult? Function($Error value)? error,
    TResult? Function($Data value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($Initial value)? initial,
    TResult Function($Loading value)? loading,
    TResult Function($Error value)? error,
    TResult Function($Data value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class $Loading implements HomeState {
  const factory $Loading() = _$$LoadingImpl;
}

/// @nodoc
abstract class _$$$ErrorImplCopyWith<$Res> {
  factory _$$$ErrorImplCopyWith(
          _$$ErrorImpl value, $Res Function(_$$ErrorImpl) then) =
      __$$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorState<dynamic> error});
}

/// @nodoc
class __$$$ErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$$ErrorImpl>
    implements _$$$ErrorImplCopyWith<$Res> {
  __$$$ErrorImplCopyWithImpl(
      _$$ErrorImpl _value, $Res Function(_$$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorState<dynamic>,
    ));
  }
}

/// @nodoc

class _$$ErrorImpl with DiagnosticableTreeMixin implements $Error {
  const _$$ErrorImpl(this.error);

  @override
  final ErrorState<dynamic> error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ErrorImplCopyWith<_$$ErrorImpl> get copyWith =>
      __$$$ErrorImplCopyWithImpl<_$$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)
        data,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($Initial value) initial,
    required TResult Function($Loading value) loading,
    required TResult Function($Error value) error,
    required TResult Function($Data value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($Initial value)? initial,
    TResult? Function($Loading value)? loading,
    TResult? Function($Error value)? error,
    TResult? Function($Data value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($Initial value)? initial,
    TResult Function($Loading value)? loading,
    TResult Function($Error value)? error,
    TResult Function($Data value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class $Error implements HomeState {
  const factory $Error(final ErrorState<dynamic> error) = _$$ErrorImpl;

  ErrorState<dynamic> get error;
  @JsonKey(ignore: true)
  _$$$ErrorImplCopyWith<_$$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$$DataImplCopyWith<$Res> {
  factory _$$$DataImplCopyWith(
          _$$DataImpl value, $Res Function(_$$DataImpl) then) =
      __$$$DataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<EntryModel>? entries,
      List<EntryModel>? entries1,
      List<EntryModel>? entries2,
      List<EntryModel>? entries3,
      Categories categories});

  $CategoriesCopyWith<$Res> get categories;
}

/// @nodoc
class __$$$DataImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$$DataImpl>
    implements _$$$DataImplCopyWith<$Res> {
  __$$$DataImplCopyWithImpl(
      _$$DataImpl _value, $Res Function(_$$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = freezed,
    Object? entries1 = freezed,
    Object? entries2 = freezed,
    Object? entries3 = freezed,
    Object? categories = null,
  }) {
    return _then(_$$DataImpl(
      entries: freezed == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<EntryModel>?,
      entries1: freezed == entries1
          ? _value._entries1
          : entries1 // ignore: cast_nullable_to_non_nullable
              as List<EntryModel>?,
      entries2: freezed == entries2
          ? _value._entries2
          : entries2 // ignore: cast_nullable_to_non_nullable
              as List<EntryModel>?,
      entries3: freezed == entries3
          ? _value._entries3
          : entries3 // ignore: cast_nullable_to_non_nullable
              as List<EntryModel>?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Categories,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoriesCopyWith<$Res> get categories {
    return $CategoriesCopyWith<$Res>(_value.categories, (value) {
      return _then(_value.copyWith(categories: value));
    });
  }
}

/// @nodoc

class _$$DataImpl with DiagnosticableTreeMixin implements $Data {
  const _$$DataImpl(
      {final List<EntryModel>? entries = const [],
      final List<EntryModel>? entries1 = const [],
      final List<EntryModel>? entries2 = const [],
      final List<EntryModel>? entries3 = const [],
      this.categories = const Categories.started()})
      : _entries = entries,
        _entries1 = entries1,
        _entries2 = entries2,
        _entries3 = entries3;

  final List<EntryModel>? _entries;
  @override
  @JsonKey()
  List<EntryModel>? get entries {
    final value = _entries;
    if (value == null) return null;
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EntryModel>? _entries1;
  @override
  @JsonKey()
  List<EntryModel>? get entries1 {
    final value = _entries1;
    if (value == null) return null;
    if (_entries1 is EqualUnmodifiableListView) return _entries1;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EntryModel>? _entries2;
  @override
  @JsonKey()
  List<EntryModel>? get entries2 {
    final value = _entries2;
    if (value == null) return null;
    if (_entries2 is EqualUnmodifiableListView) return _entries2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EntryModel>? _entries3;
  @override
  @JsonKey()
  List<EntryModel>? get entries3 {
    final value = _entries3;
    if (value == null) return null;
    if (_entries3 is EqualUnmodifiableListView) return _entries3;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final Categories categories;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.data(entries: $entries, entries1: $entries1, entries2: $entries2, entries3: $entries3, categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState.data'))
      ..add(DiagnosticsProperty('entries', entries))
      ..add(DiagnosticsProperty('entries1', entries1))
      ..add(DiagnosticsProperty('entries2', entries2))
      ..add(DiagnosticsProperty('entries3', entries3))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$DataImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            const DeepCollectionEquality().equals(other._entries1, _entries1) &&
            const DeepCollectionEquality().equals(other._entries2, _entries2) &&
            const DeepCollectionEquality().equals(other._entries3, _entries3) &&
            (identical(other.categories, categories) ||
                other.categories == categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_entries),
      const DeepCollectionEquality().hash(_entries1),
      const DeepCollectionEquality().hash(_entries2),
      const DeepCollectionEquality().hash(_entries3),
      categories);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$DataImplCopyWith<_$$DataImpl> get copyWith =>
      __$$$DataImplCopyWithImpl<_$$DataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)
        data,
  }) {
    return data(entries, entries1, entries2, entries3, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
  }) {
    return data?.call(entries, entries1, entries2, entries3, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(
            List<EntryModel>? entries,
            List<EntryModel>? entries1,
            List<EntryModel>? entries2,
            List<EntryModel>? entries3,
            Categories categories)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(entries, entries1, entries2, entries3, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function($Initial value) initial,
    required TResult Function($Loading value) loading,
    required TResult Function($Error value) error,
    required TResult Function($Data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function($Initial value)? initial,
    TResult? Function($Loading value)? loading,
    TResult? Function($Error value)? error,
    TResult? Function($Data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function($Initial value)? initial,
    TResult Function($Loading value)? loading,
    TResult Function($Error value)? error,
    TResult Function($Data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class $Data implements HomeState {
  const factory $Data(
      {final List<EntryModel>? entries,
      final List<EntryModel>? entries1,
      final List<EntryModel>? entries2,
      final List<EntryModel>? entries3,
      final Categories categories}) = _$$DataImpl;

  List<EntryModel>? get entries;
  List<EntryModel>? get entries1;
  List<EntryModel>? get entries2;
  List<EntryModel>? get entries3;
  Categories get categories;
  @JsonKey(ignore: true)
  _$$$DataImplCopyWith<_$$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Categories {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(List<CategoryModel> categories) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(List<CategoryModel> categories)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(List<CategoryModel> categories)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CateStarted value) started,
    required TResult Function(_CateLoading value) loading,
    required TResult Function(_CateError value) error,
    required TResult Function(_CateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CateStarted value)? started,
    TResult? Function(_CateLoading value)? loading,
    TResult? Function(_CateError value)? error,
    TResult? Function(_CateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CateStarted value)? started,
    TResult Function(_CateLoading value)? loading,
    TResult Function(_CateError value)? error,
    TResult Function(_CateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesCopyWith<$Res> {
  factory $CategoriesCopyWith(
          Categories value, $Res Function(Categories) then) =
      _$CategoriesCopyWithImpl<$Res, Categories>;
}

/// @nodoc
class _$CategoriesCopyWithImpl<$Res, $Val extends Categories>
    implements $CategoriesCopyWith<$Res> {
  _$CategoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CateStartedImplCopyWith<$Res> {
  factory _$$CateStartedImplCopyWith(
          _$CateStartedImpl value, $Res Function(_$CateStartedImpl) then) =
      __$$CateStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CateStartedImplCopyWithImpl<$Res>
    extends _$CategoriesCopyWithImpl<$Res, _$CateStartedImpl>
    implements _$$CateStartedImplCopyWith<$Res> {
  __$$CateStartedImplCopyWithImpl(
      _$CateStartedImpl _value, $Res Function(_$CateStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CateStartedImpl with DiagnosticableTreeMixin implements _CateStarted {
  const _$CateStartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Categories.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Categories.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CateStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(List<CategoryModel> categories) data,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(List<CategoryModel> categories)? data,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(List<CategoryModel> categories)? data,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CateStarted value) started,
    required TResult Function(_CateLoading value) loading,
    required TResult Function(_CateError value) error,
    required TResult Function(_CateData value) data,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CateStarted value)? started,
    TResult? Function(_CateLoading value)? loading,
    TResult? Function(_CateError value)? error,
    TResult? Function(_CateData value)? data,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CateStarted value)? started,
    TResult Function(_CateLoading value)? loading,
    TResult Function(_CateError value)? error,
    TResult Function(_CateData value)? data,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _CateStarted implements Categories {
  const factory _CateStarted() = _$CateStartedImpl;
}

/// @nodoc
abstract class _$$CateLoadingImplCopyWith<$Res> {
  factory _$$CateLoadingImplCopyWith(
          _$CateLoadingImpl value, $Res Function(_$CateLoadingImpl) then) =
      __$$CateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CateLoadingImplCopyWithImpl<$Res>
    extends _$CategoriesCopyWithImpl<$Res, _$CateLoadingImpl>
    implements _$$CateLoadingImplCopyWith<$Res> {
  __$$CateLoadingImplCopyWithImpl(
      _$CateLoadingImpl _value, $Res Function(_$CateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CateLoadingImpl with DiagnosticableTreeMixin implements _CateLoading {
  const _$CateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Categories.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Categories.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(List<CategoryModel> categories) data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(List<CategoryModel> categories)? data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(List<CategoryModel> categories)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CateStarted value) started,
    required TResult Function(_CateLoading value) loading,
    required TResult Function(_CateError value) error,
    required TResult Function(_CateData value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CateStarted value)? started,
    TResult? Function(_CateLoading value)? loading,
    TResult? Function(_CateError value)? error,
    TResult? Function(_CateData value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CateStarted value)? started,
    TResult Function(_CateLoading value)? loading,
    TResult Function(_CateError value)? error,
    TResult Function(_CateData value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CateLoading implements Categories {
  const factory _CateLoading() = _$CateLoadingImpl;
}

/// @nodoc
abstract class _$$CateErrorImplCopyWith<$Res> {
  factory _$$CateErrorImplCopyWith(
          _$CateErrorImpl value, $Res Function(_$CateErrorImpl) then) =
      __$$CateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorState<dynamic> error});
}

/// @nodoc
class __$$CateErrorImplCopyWithImpl<$Res>
    extends _$CategoriesCopyWithImpl<$Res, _$CateErrorImpl>
    implements _$$CateErrorImplCopyWith<$Res> {
  __$$CateErrorImplCopyWithImpl(
      _$CateErrorImpl _value, $Res Function(_$CateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorState<dynamic>,
    ));
  }
}

/// @nodoc

class _$CateErrorImpl with DiagnosticableTreeMixin implements _CateError {
  const _$CateErrorImpl(this.error);

  @override
  final ErrorState<dynamic> error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Categories.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Categories.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CateErrorImplCopyWith<_$CateErrorImpl> get copyWith =>
      __$$CateErrorImplCopyWithImpl<_$CateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(List<CategoryModel> categories) data,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(List<CategoryModel> categories)? data,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(List<CategoryModel> categories)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CateStarted value) started,
    required TResult Function(_CateLoading value) loading,
    required TResult Function(_CateError value) error,
    required TResult Function(_CateData value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CateStarted value)? started,
    TResult? Function(_CateLoading value)? loading,
    TResult? Function(_CateError value)? error,
    TResult? Function(_CateData value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CateStarted value)? started,
    TResult Function(_CateLoading value)? loading,
    TResult Function(_CateError value)? error,
    TResult Function(_CateData value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _CateError implements Categories {
  const factory _CateError(final ErrorState<dynamic> error) = _$CateErrorImpl;

  ErrorState<dynamic> get error;
  @JsonKey(ignore: true)
  _$$CateErrorImplCopyWith<_$CateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CateDataImplCopyWith<$Res> {
  factory _$$CateDataImplCopyWith(
          _$CateDataImpl value, $Res Function(_$CateDataImpl) then) =
      __$$CateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$CateDataImplCopyWithImpl<$Res>
    extends _$CategoriesCopyWithImpl<$Res, _$CateDataImpl>
    implements _$$CateDataImplCopyWith<$Res> {
  __$$CateDataImplCopyWithImpl(
      _$CateDataImpl _value, $Res Function(_$CateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CateDataImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$CateDataImpl with DiagnosticableTreeMixin implements _CateData {
  const _$CateDataImpl(final List<CategoryModel> categories)
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Categories.data(categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Categories.data'))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CateDataImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CateDataImplCopyWith<_$CateDataImpl> get copyWith =>
      __$$CateDataImplCopyWithImpl<_$CateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(List<CategoryModel> categories) data,
  }) {
    return data(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(List<CategoryModel> categories)? data,
  }) {
    return data?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(List<CategoryModel> categories)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CateStarted value) started,
    required TResult Function(_CateLoading value) loading,
    required TResult Function(_CateError value) error,
    required TResult Function(_CateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CateStarted value)? started,
    TResult? Function(_CateLoading value)? loading,
    TResult? Function(_CateError value)? error,
    TResult? Function(_CateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CateStarted value)? started,
    TResult Function(_CateLoading value)? loading,
    TResult Function(_CateError value)? error,
    TResult Function(_CateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _CateData implements Categories {
  const factory _CateData(final List<CategoryModel> categories) =
      _$CateDataImpl;

  List<CategoryModel> get categories;
  @JsonKey(ignore: true)
  _$$CateDataImplCopyWith<_$CateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
