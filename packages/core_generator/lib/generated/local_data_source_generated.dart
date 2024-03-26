import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

String generatedLocalDataSource(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();
  final fileName = modelName.toCamelCase();

  final imports = [
    "import 'package:isar/isar.dart';",
    "import '../../../services/local_database/local_database.dart';",
    "import '../../models/data_models.dart';",
  ];

  final cClass = Class((c) {
    c
      ..extend = refer('BaseLocalDatabase<${className}Local>')
      ..mixins.add(refer('LocalDatabase'))
      ..methods.addAll([
        Method(
          (m) => m
            ..name = 'getAll'
            ..returns = refer('Future<List<${className}Local>>')
            ..docs.add('@override')
            ..optionalParameters.add(
              Parameter(
                (p) => p
                  ..covariant = true
                  ..name = 'isar'
                  ..type = refer('Isar?'),
              ),
            )
            ..body = Code(
              [
                'if (isar != null) {',
                'return isar.${fileName}Locals.where().findAll();',
                '}',
                'if (instance != null) {',
                'return instance!.${fileName}Locals.where().findAll();',
                '}',
                "throw Exception('isar null');",
              ].join('\n'),
            ),
        ),
      ])
      ..name = '${className}LocalDataSource';
  });

  return DartFormatter().format(
    [...imports, cClass.accept(emitter)].join('\n'),
  );
}

String generatedLocalDataSourceStub(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();

  final imports = [
    "import '../../../services/local_database/local_database.dart';",
    "import '../../models/data_models.dart';",
  ];

  final cClass = Class((c) {
    c
      ..extend = refer('BaseLocalDatabase<${className}Local>')
      ..mixins.add(refer('LocalDatabase'))
      ..name = '${className}LocalDataSource';
  });

  return DartFormatter().format(
    [...imports, cClass.accept(emitter)].join('\n'),
  );
}

String generatedExportLocalDataSource(String modelName, String file) {
  final partName = modelName.toSnakeCase();

  if (file.contains('$partName/${partName}_local_data_source.dart')) {
    return file;
  }

  final export = "export '$partName/${partName}_local_data_source.dart'"
      " if (dart.library.js) '$partName/${partName}_local_data_source_stub.dart';";

  return DartFormatter().format([file, export].join('\n'));
}
