import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> extends Equatable {
  const BaseModel({required this.data});
  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseModelFromJson(json, fromJsonT);
  final T? data;

  Map<String, dynamic> toJson(T Function(Object? json) toJsonT) =>
      _$BaseModelToJson(this, toJsonT);

  @override
  List<Object?> get props => [data];
}
