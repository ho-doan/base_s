import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

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
