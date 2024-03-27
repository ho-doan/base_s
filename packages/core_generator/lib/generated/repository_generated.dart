import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

String generatedRepository(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();

  final imports = [
    "import 'dart:async';",
    "import 'dart:developer';",
    "import 'package:dartz/dartz.dart';",
    "import 'package:flutter/foundation.dart';",
    "import 'package:shared/shared.dart';",
    "import '../../data/local_data_sources/local_data_sources.dart';",
    "import '../../data/models/data_models.dart';",
    "import '../../data/remote_data_sources/remote_data_sources.dart';",
    "import '../../models/models.dart';",
    "import '../../services/local_database/local_database.dart';",
  ];

  final cClass = Class((c) {
    c
      ..constructors.add(
        Constructor(
          (c) => c
            ..constant = true
            ..requiredParameters.addAll([
              Parameter(
                (p) => p
                  ..name = '_local'
                  ..toThis = true,
              ),
              Parameter(
                (p) => p
                  ..name = '_remote'
                  ..toThis = true,
              ),
            ]),
        ),
      )
      ..fields.addAll([
        Field(
          (f) => f
            ..name = '_local'
            ..modifier = FieldModifier.final$
            ..type = refer('${className}LocalDataSource'),
        ),
        Field(
          (f) => f
            ..name = '_remote'
            ..modifier = FieldModifier.final$
            ..type = refer('${className}RemoteDataSource'),
        ),
      ])
      ..methods.addAll([
        Method(
          (m) => m
            ..name = 'getAll'
            ..returns =
                refer('Future<Either<ErrorState,List<${className}Model>>>')
            ..modifier = MethodModifier.async
            ..optionalParameters.addAll([
              Parameter(
                (f) => f
                  ..name = 'forceRefresh'
                  ..type = refer('bool')
                  ..named = true
                  ..defaultTo = const Code('false'),
              ),
              Parameter(
                (f) => f
                  ..name = 'token'
                  ..type = refer('RootIsolateToken?')
                  ..named = true,
              ),
            ])
            ..body = Code(
              [
                'try {',
                'List<${className}Local> cache;',
                'if (token == null) {',
                'cache = await _local.getAll();',
                '} else {',
                'cache = await _local.getAllTask(token);',
                '}',
                'final check = forceRefresh || cache.isEmpty;',
                'if (check) {',
                'final fetchResult = await _remote.getAll();',
                'return fetchResult.fold(Left.new, (r) async {',
                'final models = [',
                'for (final i in r) ${className}Local.fromRemote(i),',
                '];',
                'unawaited(',
                'computeApp(',
                '_local.insertAllTask,',
                'LocalTaskList(',
                'models: models,',
                'token: !kIsWeb ? token ?? RootIsolateToken.instance! : null,',
                '),',
                '),',
                ');',
                'return Right(',
                '[for (final i in r) ${className}Model.fromRemote(i)],',
                ');',
                '});',
                '}',
                'return Right([for (final i in cache)',
                ' ${className}Model.fromLocal(i)]);',
                '} on Exception catch (error, stackTrace) {',
                'log(',
                "'get all $modelName info list failed: \$error',",
                'stackTrace: stackTrace,',
                ');',
                'return Left(ErrorState(error: error,',
                ' stackTrace: stackTrace));',
                '}',
              ].join('\n'),
            ),
        ),
      ])
      ..name = '${className}Repository';
  });

  return DartFormatter().format(
    [...imports, cClass.accept(emitter)].join('\n'),
  );
}

String generatedExportRepository(String modelName, String file) {
  final partName = modelName.toSnakeCase();

  if (file.contains('$partName/${partName}_repository.dart')) {
    return file;
  }

  final export = "export '$partName/${partName}_repository.dart';";

  return DartFormatter().format([file, export].join('\n'));
}
