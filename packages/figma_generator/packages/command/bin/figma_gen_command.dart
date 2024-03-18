import 'dart:io';

import 'package:args/args.dart';
import 'package:figma_gen_core/core_generator.dart';

void main(List<String> args) {
  final parser = ArgParser();
  parser.addOption(
    'config',
    abbr: 'c',
    help: 'Set the path of pubspec.yaml',
    defaultsTo: 'pubspec.yaml',
  );
  parser.addOption(
    'read',
    abbr: 'r',
    help: 'Read all text',
    defaultsTo: 'pubspec.yaml',
  );
  parser.addFlag(
    'help',
    abbr: 'h',
    help: 'Help about command',
    defaultsTo: false,
  );
  parser.addFlag(
    'write',
    abbr: 'w',
    help: 'Help about command',
    defaultsTo: false,
  );
  parser.addFlag(
    'version',
    abbr: 'v',
    help: 'FigmaGen version',
    defaultsTo: false,
  );
  ArgResults results;
  try {
    results = parser.parse(args);

    if (results.wasParsed('help')) {
      stdout.writeln(parser.usage);
      return;
    } else if (results.wasParsed('version')) {
      stdout.writeln(figmaGenVersion);
      return;
    } else if (results.wasParsed('write')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.write(pubspecPath ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).build();
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
