import 'dart:io';

import 'package:args/args.dart';

import 'package:core_generator/core_generator.dart';

void main(List<String> args) {
  final parser = ArgParser()
    ..addOption(
      'config',
      abbr: 'c',
      help: 'Set the path of pubspec.yaml',
      defaultsTo: 'pubspec.yaml',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Help about command',
    )
    ..addOption(
      'local',
      abbr: 'l',
      help: 'Generated model local',
    )
    ..addOption(
      'model_remote',
      abbr: 'r',
      help: 'Generated model remote',
    )
    ..addOption(
      'lds',
      help: 'Generated local data source',
    )
    ..addOption(
      'rds',
      help: 'Generated remote data source',
    )
    ..addOption(
      'us',
      help: 'Generated use case',
    )
    ..addOption(
      'all',
      help: 'Generated resource feature (local model, remote model, model, '
          'local data source, remote data source, repository, use case)',
    )
    ..addOption(
      'repo',
      help: 'Generated repository',
    )
    ..addOption(
      'model',
      abbr: 'm',
      help: 'Generated model remote',
    )
    ..addFlag(
      'version',
      abbr: 'v',
      help: 'Core Gen version',
    );
  ArgResults results;
  try {
    results = parser.parse(args);

    if (results.wasParsed('help')) {
      stdout.writeln(parser.usage);
      return;
    } else if (results.wasParsed('version')) {
      stdout.writeln(coreGenVersion);
      return;
    } else if (results.wasParsed('local')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['local']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).buildLocalModel(modelName!);
      return;
    } else if (results.wasParsed('model_remote')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['model_remote']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).buildRemoteModel(modelName!);
      return;
    } else if (results.wasParsed('model')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['model']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).buildModel(modelName!);
      return;
    } else if (results.wasParsed('all')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['all']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).build(modelName!);
      return;
    } else if (results.wasParsed('lds')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['lds']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute)
          .buildLocalDataSource(modelName!);
      return;
    } else if (results.wasParsed('us')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['us']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).buildUseCase(modelName!);
      return;
    } else if (results.wasParsed('rds')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['rds']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute)
          .buildRemoteDataSource(modelName!);
      return;
    } else if (results.wasParsed('repo')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['repo']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).buildRepository(modelName!);
      return;
    }
  } on FormatException catch (e) {
    stderr.writeAll(
      <String>[e.message, 'usage: figma_gen [options...]', ''],
      '\n',
    );
    return;
  }
}
