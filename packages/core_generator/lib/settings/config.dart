import 'dart:io';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

import '../utils/utils.dart';
import 'config_default.dart';

class Config {
  Config._({
    required this.pubspec,
    required this.pubspecFile,
  });

  final Pubspec pubspec;
  final File pubspecFile;
}

Config loadPubspecConfig(File pubspecFile) {
  stdout.writeln('$coreGenVersion Loading ... '
      '${normalize(
    join(
      basename(pubspecFile.parent.path),
      basename(pubspecFile.path),
    ),
  )}');
  final content = pubspecFile.readAsStringSync();
  final userMap = loadYaml(content) as Map?;
  final defaultMap = loadYaml(configDefaultYamlContent) as Map?;
  final mergedMap = mergeMap([defaultMap, userMap]);
  final pubspec = Pubspec.fromJson(mergedMap);
  return Config._(pubspec: pubspec, pubspecFile: pubspecFile);
}

Config? loadPubspecConfigOrNull(File pubspecFile) {
  try {
    return loadPubspecConfig(pubspecFile);
  } on FileSystemException catch (e) {
    stderr.writeln(e.message);
  } on InvalidSettingsException catch (e) {
    stderr.writeln(e.message);
  }
  return null;
}
