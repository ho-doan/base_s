import 'dart:io' show Platform;

import 'package:core/core_generator.dart';
import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

final separator = Platform.pathSeparator;

void main() {
  test('Execute figmagen', () async {
    final process = await TestProcess.start(
      'dart',
      ['bin/figma_gen_command.dart'],
    );
    expect(
      await process.stdout.next,
      equals('$figmaGenVersion Loading ... command${separator}pubspec.yaml'),
    );
    await process.shouldExit(0);
  });

  test('Execute figmagen --config pubspec.yaml', () async {
    var process = await TestProcess.start(
      'dart',
      ['bin/figma_gen_command.dart', '--config', 'pubspec.yaml'],
    );
    expect(
      await process.stdout.next,
      equals('$figmaGenVersion Loading ... command${separator}pubspec.yaml'),
    );
    await process.shouldExit(0);
  });

  test('Execute figmagen --help', () async {
    var process = await TestProcess.start(
      'dart',
      ['bin/figma_gen_command.dart', '--help'],
    );
    expect(await process.stdout.next,
        equals('-c, --config          Set the path of pubspec.yaml.'));
    final line = await process.stdout.next;
    expect(line.trim(), equals('(defaults to "pubspec.yaml")'));
    await process.shouldExit(0);
  });

  test('Execute figmagen --version', () async {
    var process = await TestProcess.start(
      'dart',
      ['bin/figma_gen_command.dart', '--version'],
    );
    expect(await process.stdout.next, equals(figmaGenVersion));
    await process.shouldExit(0);
  });

  test('Execute wrong argments with figmagen --wrong', () async {
    var process = await TestProcess.start(
      'dart',
      ['bin/figma_gen_command.dart', '--wrong'],
    );
    expect(
      await process.stderr.next,
      equals('Could not find an option named "wrong".'),
    );
    expect(
      await process.stderr.next,
      equals('usage: figma_gen [options...]'),
    );
    await process.shouldExit(0);
  });
}
