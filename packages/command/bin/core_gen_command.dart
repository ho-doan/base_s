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
      'i_local',
      abbr: 'i',
      help: 'Generated interface model local',
    )
    ..addOption(
      'local',
      abbr: 'l',
      help: 'Generated model local',
    )
    ..addOption(
      'local_stub',
      abbr: 's',
      help: 'Generated model local',
    )
    ..addOption(
      'export_local',
      abbr: 'e',
      help: 'Generated export model local',
    )
    ..addFlag(
      'version',
      abbr: 'v',
      help: 'FigmaGen version',
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
    } else if (results.wasParsed('i_local')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['i_local']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).buildIModel(modelName!);
      return;
    } else if (results.wasParsed('local')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['local']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).buildModelLocal(modelName!);
      return;
    } else if (results.wasParsed('local_stub')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['local_stub']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute)
          .buildModelLocalStub(modelName!);
      return;
    } else if (results.wasParsed('export_local')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');

      final modelName = safeCast<String>(results['export_local']);
      stdout.writeln(modelName ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute)
          .buildExportModelLocalStub(modelName!);
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
