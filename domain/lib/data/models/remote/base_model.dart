import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> extends Equatable {
  const BaseModel({
    this.data,
    this.list,
    this.code,
  });
  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseModelFromJson(json, fromJsonT);
  @JsonKey(name: 'data')
  final T? data;
  final List<T>? list;
  final int? code;

  Map<String, dynamic> toJson(T Function(Object? json) toJsonT) =>
      _$BaseModelToJson(this, toJsonT);

  @override
  List<Object?> get props => [data, list, code];
}

abstract class Data<T> {}
