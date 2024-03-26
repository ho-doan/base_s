import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

String generatedUseCase(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();

  final imports = [
    "import 'package:dartz/dartz.dart';",
    "import '../../domain.dart';",
    "import '../../repositories/repositories.dart';",
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
                  ..name = '_repository'
                  ..toThis = true,
              ),
            ]),
        ),
      )
      ..fields.addAll([
        Field(
          (f) => f
            ..name = '_repository'
            ..modifier = FieldModifier.final$
            ..type = refer('${className}Repository'),
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
            ..lambda = true
            ..body = const Code(
              '_repository.getAll(forceRefresh: forceRefresh, token: token)',
            ),
        ),
      ])
      ..name = '${className}UseCase';
  });

  return DartFormatter().format(
    [...imports, cClass.accept(emitter)].join('\n'),
  );
}

String generatedExportUseCase(String modelName, String file) {
  final partName = modelName.toSnakeCase();

  if (file.contains('$partName/${partName}_use_case.dart')) {
    return file;
  }

  final export = "export '$partName/${partName}_use_case.dart';";

  return DartFormatter().format([file, export].join('\n'));
}
