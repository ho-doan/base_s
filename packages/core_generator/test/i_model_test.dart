import 'dart:io';

import 'package:core_generator/generated/model_local_generated.dart';

void main() {
  // final s = generatedInterfaceModel('modelName');
  final s = generatedModelLocal('modelName');
  // final s = generatedModelLocalStub('modelName');

  stdout.writeln(s);
}
