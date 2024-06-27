import 'package:change_case/change_case.dart';
import 'package:dart_style/dart_style.dart';

String generatedExportApiClient(String modelName, String file) {
  final partName = modelName.toPascalCase();

  if (file.contains('${partName}LocalSchema')) return file;

  if (file.contains('''@GET('/getAll$partName')''')) {
    return file;
  }

  final export = '''
;\n
  /// TODO(gen): change code
  @GET('/getAll$partName')
  Future<BaseModel<List<${partName}Remote>>> getAll$partName();
}
''';

  return DartFormatter().format(file.replaceFirst(RegExp(r'(;)\n}'), export));
}
