import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

String generatedRemoteDataSource(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();

  final imports = [
    "import 'dart:developer';",
    "import 'package:dartz/dartz.dart';",
    "import '../../../services/networks/api_client.dart';",
    "import '../../models/data_models.dart';",
  ];

  final cClass = Class((c) {
    c
      ..constructors.add(
        Constructor(
          (c) => c
            ..constant = true
            ..requiredParameters.add(
              Parameter(
                (p) => p
                  ..name = '_apiClient'
                  ..toThis = true,
              ),
            ),
        ),
      )
      ..fields.add(
        Field(
          (f) => f
            ..name = '_apiClient'
            ..modifier = FieldModifier.final$
            ..type = refer('ApiClient'),
        ),
      )
      ..methods.addAll([
        Method(
          (m) => m
            ..name = 'getAll'
            ..returns =
                refer('Future<Either<ErrorState,List<${className}Remote>>>')
            ..modifier = MethodModifier.async
            ..body = Code(
              [
                'try {',
                'final result = await _apiClient.getAll$className();',
                "assert(result.list != null, 'Categories model server null');",
                'return Right(result.list!);',
                '} on Exception catch (error, stackTrace) {',
                "log('get all $className failed: \$error',",
                ' stackTrace: stackTrace);',
                'return Left(',
                'ErrorState(',
                'error: error,',
                'type: ErrorType.server,',
                'stackTrace: stackTrace,',
                '),',
                ');',
                '}',
              ].join('\n'),
            ),
        ),
      ])
      ..name = '${className}RemoteDataSource';
  });

  return DartFormatter().format(
    [...imports, cClass.accept(emitter)].join('\n'),
  );
}

String generatedExportRemoteDataSource(String modelName, String file) {
  final partName = modelName.toSnakeCase();

  if (file.contains('$partName/${partName}_remote_data_source.dart')) {
    return file;
  }

  final export = "export '$partName/${partName}_remote_data_source.dart';";

  return DartFormatter().format([file, export].join('\n'));
}
