import 'dart:io';

import 'package:core/figma/figma.dart';
import 'package:core/generated/lang_generated.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

import 'settings/config.dart';
import 'utils/file.dart';

export 'utils/utils.dart';

class CoreGenerator {
  final File pubspecFile;

  CoreGenerator(this.pubspecFile);

  Future<void> build({Config? config, FileWriter? writer}) async {
    config ??= loadPubspecConfigOrNull(pubspecFile);
    if (config == null) return;

    final figmaGen = config.pubspec.figmaGen;
    final formatter = DartFormatter(pageWidth: 80, lineEnding: '\n');

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

    final generated = generatedLangs(
      pubspecFile,
      formatter,
      'us',
      figmaContent,
    );
    final path = normalize(
      join(pubspecFile.parent.path, figmaGen.dirOutput, 'us.json'),
    );

    writer(generated, path);
  }
}

Future<FigmaFile?> fetch(String key, String token) async {
  var headers = {
    'X-Figma-Token': 'figd_JsfT_-mkMcCAtawNtiDDcl-gf1vrCIEBphdFCgWp'
  };
  var dio = Dio();
  var response = await dio.request(
    'https://api.figma.com/v1/files/4gkDegYeUUosqeLoUREmDn',
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
