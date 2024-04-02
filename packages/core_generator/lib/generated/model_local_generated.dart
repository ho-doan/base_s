import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

const hardLocal = "/// Don't remove comment - CORE GENERATED FOR APP";

String generatedInterfaceModel(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();
  final cClass = Class((c) {
    c
      ..abstract = true
      ..constructors.add(
        Constructor(
          (cons) => cons
            ..constant = true
            ..optionalParameters.add(
              Parameter(
                (p) => p
                  ..name = 'id'
                  ..required = false
                  ..toThis = true
                  ..named = true,
              ),
            ),
        ),
      )
      ..fields.add(
        Field(
          (f) => f
            ..name = 'id'
            ..type = refer('int?')
            ..modifier = FieldModifier.final$,
        ),
      )
      ..name = 'I$className';
  });

  return DartFormatter().format([cClass.accept(emitter)].join('\n'));
}

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

String generatedModelLocalStub(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();
  final partName = modelName.toSnakeCase();

  final imports = [
    "import '../../remote/remote.dart';",
    "import 'i_$partName.dart';",
  ];

  final cClass = Class((c) {
    c
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
                  ..defaultTo = const Code('-1'),
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
            ..body = Code('${className}Local(id: model.id,primary: model.id,)'),
        ),
      )
      ..fields.addAll([
        Field(
          (f) => f
            ..name = 'key'
            ..type = refer('int?')
            ..modifier = FieldModifier.final$,
        ),
        Field(
          (f) => f
            ..name = 'primary'
            ..type = refer('int?')
            ..modifier = FieldModifier.final$,
        ),
      ])
      ..name = '${className}Local';
  });

  return DartFormatter().format(
    [...imports, cClass.accept(emitter)].join('\n'),
  );
}

String generatedExportModelLocal(
  String modelName,
  String file,
  String? webLocator,
) {
  final partName = modelName.toSnakeCase();

  if (file.contains('$partName/${partName}_local.dart')) return file;
  String export;
  if (webLocator != null) {
    export =
        "export '$partName/${partName}_local.dart' if (dart.library.js) '$partName/${partName}_local_stub.dart';";
  } else {
    export = "export '$partName/${partName}_local.dart';";
  }

  return DartFormatter().format([file, export].join('\n'));
}

String generatedExportModelLocalSchema(String modelName, String file) {
  final partName = modelName.toPascalCase();

  if (file.contains('${partName}LocalSchema')) return file;

  final strs = file.split(hardLocal);

  final export = '${partName}LocalSchema,';

  return DartFormatter()
      .format([strs.first, hardLocal, export, strs.last].join('\n'));
}
