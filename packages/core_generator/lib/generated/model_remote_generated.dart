import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

String generatedModelRemote(String modelName) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  /// TestString
  final className = modelName.toPascalCase();
  final partName = modelName.toSnakeCase();

  final imports = [
    "import 'package:freezed_annotation/freezed_annotation.dart';",
    "import '../../local/local.dart';",
    "part '$partName.freezed.dart';",
    "part '$partName.g.dart';",
  ];

  final cClass = Class((c) {
    c
      ..docs.add(
        "@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.none)",
      )
      ..mixins.add(refer('_\$${className}Remote'))
      ..constructors.add(
        Constructor(
          (cons) => cons
            ..constant = true
            ..factory = true
            ..redirect = refer('_${className}Remote')
            ..optionalParameters.addAll([
              Parameter(
                (p) => p
                  ..name = 'id'
                  ..required = false
                  ..type = refer('int?')
                  ..docs.add("@JsonKey(name: 'id')")
                  ..named = true,
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
                  ..name = 'json'
                  ..type = refer('Map<String,dynamic>'),
              ),
            )
            ..name = 'fromJson'
            ..lambda = true
            ..body = Code('_\$${className}RemoteFromJson(json)'),
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
            ..body = Code('${className}Remote(id: model.id)'),
        ),
      )
      ..name = '${className}Remote';
  });

  return DartFormatter().format(
    [...imports, cClass.accept(emitter)].join('\n'),
  );
}

String generatedExportModelRemote(String modelName, String file) {
  final partName = modelName.toSnakeCase();

  if (file.contains('$partName/$partName.dart')) return file;

  final export = "export '$partName/$partName.dart';";

  return DartFormatter().format([file, export].join('\n'));
}
