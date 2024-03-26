import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:path/path.dart';

import 'generated/export_model_local_generated.dart';
import 'generated/interface_model_local_generated.dart';
import 'generated/model_local_generated.dart';
import 'generated/model_local_stub_generated.dart';
import 'settings/config.dart';
import 'utils/file.dart';

export 'utils/utils.dart';

class CoreGenerator {
  CoreGenerator(this.pubspecFile, [this.tokenFigma]);
  final File pubspecFile;
  final String? tokenFigma;

  Future<void> buildIModel(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) async {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return;

    final figmaGen = config.pubspec.config;

    void defaultWriter(String contents, String path) {
      final pathF = normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
        ),
      );

      final file = File(normalize(join(pathF, path)));
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      file.writeAsStringSync(contents);
      // file.exists();
    }

    writer ??= defaultWriter;

    if (figmaGen.dirLocalModel == null) return;

    final absoluteOutput = Directory(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
        ),
      ),
    );

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final str = generatedInterfaceModel(modelName);
    writer(
      str,
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
          '${modelName.toSnakeCase()}/i_${modelName.toSnakeCase()}.dart',
        ),
      ),
    );
  }

  Future<void> buildModelLocal(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) async {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return;

    final figmaGen = config.pubspec.config;

    void defaultWriter(String contents, String path) {
      final pathF = normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
        ),
      );

      final file = File(normalize(join(pathF, path)));
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      file.writeAsStringSync(contents);
      // file.exists();
    }

    writer ??= defaultWriter;

    if (figmaGen.dirLocalModel == null) return;

    final absoluteOutput = Directory(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
        ),
      ),
    );

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final str = generatedModelLocal(modelName);
    writer(
      str,
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
          '${modelName.toSnakeCase()}/${modelName.toSnakeCase()}_local.dart',
        ),
      ),
    );
  }

  Future<void> buildModelLocalStub(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) async {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return;

    final figmaGen = config.pubspec.config;

    void defaultWriter(String contents, String path) {
      final pathF = normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
        ),
      );

      final file = File(normalize(join(pathF, path)));
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      file.writeAsStringSync(contents);
      // file.exists();
    }

    writer ??= defaultWriter;

    if (figmaGen.dirLocalModel == null) return;

    final absoluteOutput = Directory(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
        ),
      ),
    );

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final str = generatedModelLocalStub(modelName);
    writer(
      str,
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
          '${modelName.toSnakeCase()}/${modelName.toSnakeCase()}_local_stub.dart',
        ),
      ),
    );
  }

  Future<void> buildExportModelLocalStub(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) async {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return;

    final figmaGen = config.pubspec.config;

    void defaultWriter(String contents, String path) {
      final pathF = normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
        ),
      );

      final file = File(normalize(join(pathF, path)));
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      file.writeAsStringSync(contents);
      // file.exists();
    }

    writer ??= defaultWriter;

    if (figmaGen.dirLocalModel == null) return;

    final absoluteOutput = Directory(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
        ),
      ),
    );

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final file = File(
      normalize(
        join(pubspecFile.parent.path, figmaGen.dirLocalModel, 'local.dart'),
      ),
    );
    String strFile = '';
    if (file.existsSync()) {
      strFile = file.readAsStringSync();
    }

    final str = generatedExportModelLocal(modelName, strFile);
    writer(
      str,
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalModel,
          'local.dart',
        ),
      ),
    );
  }
}
