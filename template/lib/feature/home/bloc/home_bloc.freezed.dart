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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loading,
    required TResult Function(ErrorState<dynamic> error) error,
    required TResult Function(Categories? categories) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories? categories)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories? categories)? data,
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

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'HomeEvent.started()';
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
    required TResult Function(Categories? categories) data,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories? categories)? data,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories? categories)? data,
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

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HomeEvent.loading()';
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
    required TResult Function(Categories? categories) data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories? categories)? data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories? categories)? data,
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

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final ErrorState<dynamic> error;

  @override
  String toString() {
    return 'HomeEvent.error(error: $error)';
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
    required TResult Function(Categories? categories) data,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories? categories)? data,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories? categories)? data,
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
  $Res call({Categories? categories});

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
    Object? categories = freezed,
  }) {
    return _then(_$DataImpl(
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

class _$DataImpl implements _Data {
  const _$DataImpl({this.categories = null});

  @override
  @JsonKey()
  final Categories? categories;

  @override
  String toString() {
    return 'HomeEvent.data(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.categories, categories) ||
                other.categories == categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categories);

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
    required TResult Function(Categories? categories) data,
  }) {
    return data(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories? categories)? data,
  }) {
    return data?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories? categories)? data,
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
  const factory _Data({final Categories? categories}) = _$DataImpl;

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
    required TResult Function(Categories categories) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories categories)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories categories)? data,
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

class _$$InitialImpl implements $Initial {
  const _$$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
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
    required TResult Function(Categories categories) data,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories categories)? data,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories categories)? data,
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

class _$$LoadingImpl implements $Loading {
  const _$$LoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
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
    required TResult Function(Categories categories) data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories categories)? data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories categories)? data,
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

class _$$ErrorImpl implements $Error {
  const _$$ErrorImpl(this.error);

  @override
  final ErrorState<dynamic> error;

  @override
  String toString() {
    return 'HomeState.error(error: $error)';
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
    required TResult Function(Categories categories) data,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories categories)? data,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories categories)? data,
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
  $Res call({Categories categories});

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
    Object? categories = null,
  }) {
    return _then(_$$DataImpl(
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

class _$$DataImpl implements $Data {
  const _$$DataImpl({this.categories = const Categories.started()});

  @override
  @JsonKey()
  final Categories categories;

  @override
  String toString() {
    return 'HomeState.data(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$DataImpl &&
            (identical(other.categories, categories) ||
                other.categories == categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categories);

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
    required TResult Function(Categories categories) data,
  }) {
    return data(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorState<dynamic> error)? error,
    TResult? Function(Categories categories)? data,
  }) {
    return data?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorState<dynamic> error)? error,
    TResult Function(Categories categories)? data,
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
  const factory $Data({final Categories categories}) = _$$DataImpl;

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

class _$CateStartedImpl implements _CateStarted {
  const _$CateStartedImpl();

  @override
  String toString() {
    return 'Categories.started()';
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

class _$CateLoadingImpl implements _CateLoading {
  const _$CateLoadingImpl();

  @override
  String toString() {
    return 'Categories.loading()';
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

class _$CateErrorImpl implements _CateError {
  const _$CateErrorImpl(this.error);

  @override
  final ErrorState<dynamic> error;

  @override
  String toString() {
    return 'Categories.error(error: $error)';
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

class _$CateDataImpl implements _CateData {
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
  String toString() {
    return 'Categories.data(categories: $categories)';
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
