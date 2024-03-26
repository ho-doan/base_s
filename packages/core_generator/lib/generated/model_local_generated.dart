import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

String generatedModelLocal(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();
  final partName = modelName.toSnakeCase();

  final imports = [
    "import 'package:copy_with_extension/copy_with_extension.dart';",
    "import 'package:isar/isar.dart';",
    "import '../../remote/remote.dart';",
    "import 'i_$partName.dart';",
    "part '${partName}_local.g.dart';",
  ];

  final cClass = Class((c) {
    c
      ..docs.addAll(['@CopyWith()', '@collection'])
      ..extend = refer('I$className')
      ..constructors.add(
        Constructor(
          (cons) => cons
            ..constant = true
            ..optionalParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'primary'
                  ..required = true
                  ..toThis = true
                  ..named = true,
              ),
              Parameter(
                (p) => p
                  ..name = 'id'
                  ..required = false
                  ..toSuper = true
                  ..named = true,
              ),
              Parameter(
                (p) => p
                  ..name = 'key'
                  ..required = false
                  ..toThis = true
                  ..named = true
                  ..defaultTo = const Code('Isar.autoIncrement'),
              ),
            ]),
        ),
      )
      ..constructors.add(
        Constructor(
          (cons) => cons
            ..factory = true
            ..requiredParameters.add(
              Parameter(
                (p) => p
                  ..name = 'model'
                  ..type = refer('${className}Remote'),
              ),
            )
            ..name = 'fromRemote'
            ..lambda = true
            ..body =
                Code('${className}Local(id: model.id, primary: model.id,)'),
        ),
      )
      ..fields.addAll([
        Field(
          (f) => f
            ..name = 'key'
            ..type = refer('Id?')
            ..modifier = FieldModifier.final$,
        ),
        Field(
          (f) => f
            ..name = 'primary'
            ..type = refer('int?')
            ..docs.add('@Index(unique: true)')
            ..modifier = FieldModifier.final$,
        ),
      ])
      ..name = '${className}Local';
  });

  return DartFormatter().format(
    [...imports, cClass.accept(emitter)].join('\n'),
  );
}
