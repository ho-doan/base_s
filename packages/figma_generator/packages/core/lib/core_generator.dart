import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

import 'figma/figma.dart';
import 'generated/lang_generated.dart';
import 'settings/config.dart';
import 'translator/translator.dart';
import 'utils/file.dart';

export 'utils/utils.dart';

class CoreGenerator {
  final File pubspecFile;

  CoreGenerator(this.pubspecFile);

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

    final absoluteOutput = Directory(normalize(join(
      pubspecFile.parent.path,
      figmaGen.dirOutput,
    )));

    if (!absoluteOutput.existsSync()) {
      absoluteOutput.createSync(recursive: true);
    }

    final figmaContent = await fetch(figmaGen.figmaKey, figmaGen.figmaToken);

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
}

Future<FigmaFile?> fetch(String key, String token) async {
  var headers = {'X-Figma-Token': token};
  var dio = Dio();
  var response = await dio.request(
    'https://api.figma.com/v1/files/$key',
    options: Options(
      method: 'GET',
      headers: headers,
    ),
  );

  if (response.statusCode == 200) {
    return FigmaFile.fromJson(response.data);
  } else {
    print(response.statusMessage);
    return null;
  }
}
