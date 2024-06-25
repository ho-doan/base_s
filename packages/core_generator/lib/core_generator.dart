import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:path/path.dart';

import 'generated/local_data_source_generated.dart';
import 'generated/model_generated.dart';
import 'generated/model_local_generated.dart';
import 'generated/model_remote_generated.dart';
import 'generated/remote_data_source_generated.dart';
import 'generated/repository_generated.dart';
import 'generated/use_case_generated.dart';
import 'settings/config.dart';
import 'utils/utils.dart';

export 'utils/utils.dart';

class CoreGenerator {
  CoreGenerator(this.pubspecFile);
  final File pubspecFile;

  (FileWriter?, FileReader?) _build(
    String modelName, {
    required String? Function(ConfigModel) pathWork,
    Config? config,
    FileWriter? writer,
  }) {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return (null, null);

    final coreConfig = config.pubspec.config;

    final configPath = pathWork.call(coreConfig);

    if (configPath == null) return (null, null);

    final parent = normalize(
      join(
        pubspecFile.parent.path,
        configPath,
      ),
    );

    void defaultWriter(String contents, String path, {bool export = false}) {
      final file = File(normalize(join(parent, path)));
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      } else if (!export && !(config?.pubspec.config.replace ?? false)) {
        return;
      }
      file.writeAsStringSync(contents);
      // file.exists();
    }

    writer ??= defaultWriter;

    if (!parent.contains('.dart')) {
      final absoluteOutput = Directory(parent);

      if (!absoluteOutput.existsSync()) {
        absoluteOutput.createSync(recursive: true);
      }
    }

    String fReader(String path) {
      final file = File(normalize(join(parent, path)));
      String strFile = '';
      if (file.existsSync()) {
        strFile = file.readAsStringSync();
      }
      return strFile;
    }

    return (writer, fReader);
  }

  FileWriter? _deleteBuild(
    String modelName, {
    required String? Function(ConfigModel) pathWork,
    Config? config,
    FileWriter? writer,
  }) {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return null;

    final coreConfig = config.pubspec.config;

    final configPath = pathWork.call(coreConfig);

    if (configPath == null) return null;

    final parent = normalize(
      join(
        pubspecFile.parent.path,
        configPath,
      ),
    );

    void defaultWriter(String contents, String path, {bool export = false}) {
      final file = File(normalize(join(parent, path)));
      if (file.existsSync()) {
        file.deleteSync(recursive: true);
      }
    }

    writer ??= defaultWriter;

    if (!parent.contains('.dart')) {
      final absoluteOutput = Directory(parent);

      if (absoluteOutput.existsSync()) {
        absoluteOutput.deleteSync(recursive: true);
      }
    }

    return writer;
  }

  void buildModel(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) {
    final initial = _build(
      modelName,
      pathWork: (c) => c.dirModel,
    );
    writer ??= initial.$1;

    final reader = initial.$2;

    final fileName = modelName.toSnakeCase();

    //#region gen
    writer?.call(
      generatedModel(modelName),
      '${fileName}_model.dart',
    );
    //#endregion

    //#region export
    const fileExport = 'models.dart';
    writer?.call(
      generatedExportModel(
        modelName,
        reader?.call(fileExport) ?? '',
      ),
      fileExport,
      export: true,
    );
    //#endregion
  }

  void buildRemoteModel(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) {
    final initial = _build(
      modelName,
      pathWork: (c) => c.dirRemoteModel,
    );
    writer ??= initial.$1;

    final reader = initial.$2;

    final fileName = modelName.toSnakeCase();

    //#region gen
    writer?.call(
      generatedModelRemote(modelName),
      '$fileName/$fileName.dart',
    );
    //#endregion

    //#region export
    const fileExport = 'remote.dart';
    writer?.call(
      generatedExportModelRemote(
        modelName,
        reader?.call(fileExport) ?? '',
      ),
      fileExport,
      export: true,
    );
    //#endregion
  }

  void _deleteBuildRemoteModel(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) {
    final initial = _deleteBuild(
      modelName,
      pathWork: (c) => c.dirRemoteModel,
    );
    writer ??= initial;

    final fileName = modelName.toSnakeCase();

    //#region gen
    writer?.call('', '$fileName/$fileName.dart');
    //#endregion

    //#region export
    const fileExport = 'remote.dart';
    writer?.call('', fileExport, export: true);
    //#endregion
  }

  void buildLocalModel(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) {
    final initial = _build(
      modelName,
      pathWork: (c) => c.dirLocalModel,
    );
    writer ??= initial.$1;

    final reader = initial.$2;

    final fileName = modelName.toSnakeCase();

    //#region gen
    writer?.call(
      generatedInterfaceModel(modelName),
      '$fileName/i_$fileName.dart',
    );
    writer?.call(
      generatedModelLocal(modelName),
      '$fileName/${fileName}_local.dart',
    );
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config?.pubspec.config.webLocator != null) {
      writer?.call(
        generatedModelLocalStub(modelName),
        '$fileName/${fileName}_local_stub.dart',
      );
    }
    //#endregion

    //#region export
    const fileExport = 'local.dart';
    writer?.call(
      generatedExportModelLocal(
        modelName,
        reader?.call(fileExport) ?? '',
        config?.pubspec.config.webLocator,
      ),
      fileExport,
      export: true,
    );
    _buildLocalSchema(modelName);
    //#endregion
  }

  void _buildLocalDataSourceLocator(
    String modelName, {
    FileWriter? writer,
  }) {
    final initial = _build(
      modelName,
      pathWork: (c) => c.webLocator,
    );
    writer ??= initial.$1;

    final reader = initial.$2;
    //#region export
    const fileExport = '';
    writer?.call(
      generatedExportLocalDataSourceLocator(
        modelName,
        reader?.call(fileExport) ?? '',
      ),
      fileExport,
      export: true,
    );
    //#endregion
  }

  void _buildLocalSchema(
    String modelName, {
    FileWriter? writer,
  }) {
    final initial = _build(
      modelName,
      pathWork: (c) => c.localSchema,
    );
    writer ??= initial.$1;

    final reader = initial.$2;
    //#region export
    const fileExport = '';

    writer?.call(
      generatedExportModelLocalSchema(
        modelName,
        reader?.call(fileExport) ?? '',
      ),
      fileExport,
      export: true,
    );
    //#endregion
  }

  void buildLocalDataSource(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) {
    final initial = _build(
      modelName,
      pathWork: (c) => c.dirLocalDataSource,
    );
    writer ??= initial.$1;

    final reader = initial.$2;

    final fileName = modelName.toSnakeCase();

    //#region gen
    writer?.call(
      generatedLocalDataSource(modelName),
      '$fileName/${fileName}_local_data_source.dart',
    );
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config?.pubspec.config.webLocator != null) {
      writer?.call(
        generatedLocalDataSourceStub(modelName),
        '$fileName/${fileName}_local_data_source_stub.dart',
      );
    }
    //#endregion

    //#region export
    const fileExport = 'local_data_sources.dart';
    writer?.call(
      generatedExportLocalDataSource(
        modelName,
        reader?.call(fileExport) ?? '',
        config?.pubspec.config.webLocator,
      ),
      fileExport,
      export: true,
    );
    if (config?.pubspec.config.webLocator != null) {
      _buildLocalDataSourceLocator(modelName);
    }

    //#endregion
  }

  void buildRemoteDataSource(
    String modelName, {
    Config? config,
    FileWriter? writer,
  }) {
    final initial = _build(
      modelName,
      pathWork: (c) => c.dirRemoteDataSource,
    );
    writer ??= initial.$1;

    final reader = initial.$2;

    final fileName = modelName.toSnakeCase();

    //#region gen
    writer?.call(
      generatedRemoteDataSource(modelName),
      '$fileName/${fileName}_remote_data_source.dart',
    );
    //#endregion

    //#region export
    const fileExport = 'remote_data_sources.dart';
    writer?.call(
      generatedExportRemoteDataSource(
        modelName,
        reader?.call(fileExport) ?? '',
      ),
      fileExport,
      export: true,
    );
    //#endregion
  }

  void buildRepository(String modelName, {Config? config, FileWriter? writer}) {
    final initial = _build(
      modelName,
      pathWork: (c) => c.dirRepository,
    );
    writer ??= initial.$1;

    final reader = initial.$2;

    final fileName = modelName.toSnakeCase();

    //#region gen
    writer?.call(
      generatedRepository(modelName),
      '$fileName/${fileName}_repository.dart',
    );
    //#endregion

    //#region export
    const fileExport = 'repositories.dart';
    writer?.call(
      generatedExportRepository(modelName, reader?.call(fileExport) ?? ''),
      fileExport,
      export: true,
    );
    //#endregion
  }

  void buildUseCase(String modelName, {Config? config, FileWriter? writer}) {
    final initial = _build(
      modelName,
      pathWork: (c) => c.dirUseCase,
    );
    writer ??= initial.$1;

    final reader = initial.$2;

    final fileName = modelName.toSnakeCase();

    //#region gen
    writer?.call(
      generatedUseCase(modelName),
      '$fileName/${fileName}_use_case.dart',
    );
    //#endregion

    //#region export
    const fileExport = 'use_cases.dart';
    writer?.call(
      generatedExportUseCase(modelName, reader?.call(fileExport) ?? ''),
      fileExport,
      export: true,
    );
    //#endregion
  }

  void build(String modelName, {Config? config, FileWriter? writer}) {
    buildRemoteModel(modelName);
    buildLocalModel(modelName);
    buildModel(modelName);
    buildLocalDataSource(modelName);
    buildRemoteDataSource(modelName);
    buildRepository(modelName);
    buildUseCase(modelName);
  }

  void deleteBuild(String modelName, {Config? config, FileWriter? writer}) {
    _deleteBuildRemoteModel(modelName);
    // buildLocalModel(modelName);
    // buildModel(modelName);
    // buildLocalDataSource(modelName);
    // buildRemoteDataSource(modelName);
    // buildRepository(modelName);
    // buildUseCase(modelName);
  }
}
