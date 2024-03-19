import 'dart:io';

import 'package:path/path.dart';

import 'generated/icon_generated.dart';
import 'generated/image_generated.dart';
import 'generated/lang_generated.dart';
import 'services/remote/api_client.dart';
import 'services/translator/translator.dart';
import 'settings/config.dart';
import 'utils/file.dart';

export 'utils/utils.dart';

class CoreGenerator {
  CoreGenerator(this.pubspecFile, [this.tokenFigma]);
  final File pubspecFile;
  final String? tokenFigma;

  Future<void> build({Config? config, FileWriter? writer}) async {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return;

    final figmaGen = config.pubspec.figmaGen;
    // final formatter = DartFormatter(pageWidth: 80, lineEnding: '\n');

    void defaultWriter(String contents, String path) {
      final file = File(path);
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      file.writeAsStringSync(contents);
      // file.exists();
    }

    writer ??= defaultWriter;

    final absoluteOutput = Directory(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirOutput,
        ),
      ),
    );

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final token = tokenFigma ?? figmaGen.figmaToken;

    if (token == null) {
      stdout.writeln('Token figma is null');
    }

    final figmaContent = await fetchFile(figmaGen.figmaKey, token!);

    if (figmaContent == null) return;

    final lstLang = await genDefault(figmaContent);

    final defaultEn = generatedLangEn(lstLang);
    final pathEn = normalize(
      join(
        pubspecFile.parent.path,
        figmaGen.dirOutput,
        'app_en.arb',
      ),
    );

    writer(defaultEn, pathEn);

    for (final item in config.pubspec.figmaGen.enumLangs) {
      if (item == Lang.en) continue;
      final generated = await generatedLangs(item, lstLang);
      final path = normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirOutput,
          'app_${item.code}.arb',
        ),
      );

      writer(generated, path);
    }
  }

  Future<void> downloadImages({Config? config, ImageWriter? writer}) async {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return;

    final figmaGen = config.pubspec.figmaGen;
    // final formatter = DartFormatter(pageWidth: 80, lineEnding: '\n');

    void defaultWriter(List<int> contents, String path, String? oldPath) {
      final pathF = normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirImg,
        ),
      );
      if (oldPath != null) {
        final file = File(normalize(join(pathF, oldPath)));
        if (file.existsSync()) {
          stdout.writeln('delete old image $oldPath...');
          file.deleteSync();
        }
      }
      final file = File(normalize(join(pathF, path)));
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      file.writeAsBytesSync(contents);
      // file.exists();
    }

    writer ??= defaultWriter;

    final absoluteOutput = Directory(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirOutput,
        ),
      ),
    );

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final token = tokenFigma ?? figmaGen.figmaToken;

    if (token == null) {
      stdout.writeln('Token figma is null');
    }

    await getAllImage(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirImg,
        ),
      ),
      token!,
      figmaGen,
      writer,
    );
  }

  Future<void> downloadIcons({Config? config, ImageWriter? writer}) async {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return;

    final figmaGen = config.pubspec.figmaGen;
    // final formatter = DartFormatter(pageWidth: 80, lineEnding: '\n');

    void defaultWriter(List<int> contents, String path, String? oldPath) {
      final pathF = normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirIcons,
        ),
      );
      if (oldPath != null) {
        final file = File(normalize(join(pathF, oldPath)));
        if (file.existsSync()) {
          stdout.writeln('delete old image $oldPath...');
          file.deleteSync();
        }
      }
      final file = File(normalize(join(pathF, path)));
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      file.writeAsBytesSync(contents);
      // file.exists();
    }

    writer ??= defaultWriter;

    final absoluteOutput = Directory(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirOutput,
        ),
      ),
    );

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final token = tokenFigma ?? figmaGen.figmaToken;

    if (token == null) {
      stdout.writeln('Token figma is null');
    }

    final figmaContent = await fetchFile(figmaGen.figmaKey, token!);

    if (figmaContent == null) return;

    await downloadAllIcon(
      normalize(
        join(
          pubspecFile.parent.path,
          figmaGen.dirIcons,
        ),
      ),
      token,
      figmaGen,
      figmaContent,
      writer,
    );
  }
}
