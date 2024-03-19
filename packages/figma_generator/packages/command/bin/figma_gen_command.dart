import 'dart:io';

import 'package:args/args.dart';
import 'package:figma_gen_core/core_generator.dart';

void main(List<String> args) {
  final parser = ArgParser()
    ..addOption(
      'config',
      abbr: 'c',
      help: 'Set the path of pubspec.yaml',
      defaultsTo: 'pubspec.yaml',
    )
    ..addOption(
      'token',
      abbr: 't',
      help: 'Read all text',
      defaultsTo: 'pubspec.yaml',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Help about command',
    )
    ..addFlag(
      'write',
      abbr: 'w',
      help: 'Write all text figma to file arb',
    )
    ..addOption(
      'images',
      abbr: 'i',
      help: 'Download all image to assets',
      defaultsTo: 'pubspec.yaml',
    )
    ..addOption(
      'icons',
      abbr: 'n',
      help: 'Download all image to assets',
      defaultsTo: 'pubspec.yaml',
    )
    ..addFlag(
      'version',
      abbr: 'v',
      help: 'FigmaGen version',
    );
  ArgResults results;
  try {
    results = parser.parse(args);

    String? tokenFigma;

    if (results.wasParsed('help')) {
      stdout.writeln(parser.usage);
      return;
    } else if (results.wasParsed('token')) {
      tokenFigma = results['token'];
    } else if (results.wasParsed('version')) {
      stdout.writeln(figmaGenVersion);
      return;
    } else if (results.wasParsed('write')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute).build();
      return;
    } else if (results.wasParsed('images')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute, results['images'])
          .downloadImages();
      return;
    } else if (results.wasParsed('icons')) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute, results['icons'])
          .downloadIcons();
      return;
    }
    if (tokenFigma != null) {
      final pubspecPath = safeCast<String>(results['config']);
      stdout.writeln(pubspecPath ?? 'NONE');
      CoreGenerator(File(pubspecPath!).absolute, tokenFigma).build();
    }
  } on FormatException catch (e) {
    stderr.writeAll(
      <String>[e.message, 'usage: figma_gen [options...]', ''],
      '\n',
    );
    return;
  }
}
