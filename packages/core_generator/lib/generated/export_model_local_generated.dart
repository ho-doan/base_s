import 'package:change_case/change_case.dart';
import 'package:dart_style/dart_style.dart';

String generatedExportModelLocal(String modelName, String file) {
  final partName = modelName.toSnakeCase();

  if (file.contains('$partName/${partName}_local.dart')) return file;

  final export =
      "export '$partName/${partName}_local.dart' if (dart.library.js) '$partName/${partName}_local_stub.dart';";

  return DartFormatter().format([file, export].join('\n'));
}
