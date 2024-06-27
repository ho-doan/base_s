part of '../core_generator.dart';

void _buildModel(
  String modelName,
  (FileWriter?, FileReader?) g, {
  FileWriter? writer,
}) {
  writer ??= g.$1;

  final reader = g.$2;

  final fileName = modelName.toSnakeCase();

  //#region gen
  writer?.call(
    generatedModel(modelName),
    '${fileName}_model.dart',
  );
  //#endregion

  //#region export
  const fileExport = 'models.dart';
  writer?.call(
    generatedExportModel(
      modelName,
      reader?.call(fileExport) ?? '',
    ),
    fileExport,
    export: true,
  );
  //#endregion
}

void _deleteBuildModel(
  String modelName,
  FileWriter? g, {
  FileWriter? writer,
}) {
  writer ??= g;

  final fileName = modelName.toSnakeCase();

  //#region gen
  writer?.call('', '${fileName}_model.dart');
  //#endregion

  //#region export
  const fileExport = 'models.dart';
  writer?.call('', fileExport, export: true);
  //#endregion
}
