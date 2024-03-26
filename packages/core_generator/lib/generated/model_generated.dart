import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

String generatedModel(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();
  final partName = modelName.toSnakeCase();

  final imports = [
    "import 'package:freezed_annotation/freezed_annotation.dart';",
    "import '../data/models/data_models.dart';",
    "part '${partName}_model.freezed.dart';",
  ];

  final cClass = Class((c) {
    c
      ..docs.add("@Freezed(unionKey: 'type',unionValueCase: "
          'FreezedUnionCase.pascal,fromJson: false,toJson: false,)')
      ..mixins.add(refer('_\$${className}Model'))
      ..constructors.add(
        Constructor(
          (cons) => cons
            ..constant = true
            ..factory = true
            ..redirect = refer('_${className}Model')
            ..optionalParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'id'
                  ..required = false
                  ..type = refer('int?')
                  ..named = true,
              ),
            ]),
        ),
      )
      ..constructors.add(
        Constructor(
          (cons) => cons
            ..factory = true
            ..requiredParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'model'
                  ..type = refer('${className}Local'),
              ),
            ])
            ..name = 'fromLocal'
            ..lambda = true
            ..body = Code('${className}Model(id: model.id)'),
        ),
      )
      ..constructors.add(
        Constructor(
          (cons) => cons
            ..factory = true
            ..requiredParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'model'
                  ..type = refer('${className}Remote'),
              ),
            ])
            ..name = 'fromRemote'
            ..lambda = true
            ..body = Code('${className}Model(id: model.id)'),
        ),
      )
      ..name = '${className}Model';
  });

  return DartFormatter().format(
    [...imports, cClass.accept(emitter)].join('\n'),
  );
}

String generatedExportModel(String modelName, String file) {
  final partName = modelName.toSnakeCase();

  if (file.contains('${partName}_model.dart')) return file;

  final export = "export '${partName}_model.dart';";

  return DartFormatter().format([file, export].join('\n'));
}
