import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:path/path.dart';

import 'generated/export_model_local_generated.dart';
import 'generated/interface_model_local_generated.dart';
import 'generated/local_data_source_generated.dart';
import 'generated/model_generated.dart';
import 'generated/model_local_generated.dart';
import 'generated/model_local_stub_generated.dart';
import 'generated/model_remote_generated.dart';
import 'settings/config.dart';
import 'utils/file.dart';

export 'utils/utils.dart';

class CoreGenerator {
  CoreGenerator(this.pubspecFile);
  final File pubspecFile;

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

  Future<void> buildModelRemote(
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
          figmaGen.dirRemoteModel,
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

    final str = generatedModelRemote(modelName);
    writer(
      str,
      '${modelName.toSnakeCase()}/${modelName.toSnakeCase()}.dart',
    );
  }

  Future<void> buildModel(
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
          figmaGen.dirModel,
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

    if (figmaGen.dirModel == null) return;

    final absoluteOutput = Directory(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirModel,
        ),
      ),
    );

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final str = generatedModel(modelName);
    writer(
      str,
      '${modelName.toSnakeCase()}_model.dart',
    );
  }

  Future<void> buildExportModelLocal(
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

  Future<void> buildExportModelRemote(
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
          figmaGen.dirRemoteModel,
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
        join(pubspecFile.parent.path, figmaGen.dirRemoteModel, 'remote.dart'),
      ),
    );
    String strFile = '';
    if (file.existsSync()) {
      strFile = file.readAsStringSync();
    }

    final str = generatedExportModelRemote(modelName, strFile);
    writer(str, 'remote.dart');
  }

  Future<void> buildExportModel(
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
          figmaGen.dirModel,
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
        join(pubspecFile.parent.path, figmaGen.dirModel, 'models.dart'),
      ),
    );
    String strFile = '';
    if (file.existsSync()) {
      strFile = file.readAsStringSync();
    }

    final str = generatedExportModel(modelName, strFile);
    writer(str, 'models.dart');
  }

  Future<void> buildLocalDataSource(
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
          figmaGen.dirLocalDataSource,
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

    if (figmaGen.dirLocalDataSource == null) return;

    final absoluteOutput = Directory(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalDataSource,
        ),
      ),
    );

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final fileName = modelName.toSnakeCase();

    //#region gen

    writer(
      generatedLocalDataSource(modelName),
      '$fileName/${fileName}_local_data_source.dart',
    );
    writer(
      generatedLocalDataSourceStub(modelName),
      '$fileName/${fileName}_local_data_source_stub.dart',
    );
    //#endregion

    final file = File(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirLocalDataSource,
          'local_data_sources.dart',
        ),
      ),
    );
    String strFile = '';
    if (file.existsSync()) {
      strFile = file.readAsStringSync();
    }

    final str = generatedExportLocalDataSource(modelName, strFile);
    writer(str, 'local_data_sources.dart');
  }
}
