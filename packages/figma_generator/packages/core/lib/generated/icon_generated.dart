import 'dart:io';

import '../core_generator.dart';
import '../models/figma/figma.dart';
import '../services/remote/api_client.dart';

Future<void> downloadAllIcon(
  String pathSource,
  String token,
  FigmaGen config,
  FigmaFile figmaFile,
  ImageWriter writer,
) async {
  final imgConfigs = config.iconConfigs;

  final lstLog = <String>[];

  final iconIds = [
    for (final i in figmaFile.document.documents)
      if (i.type == 'BOOLEAN_OPERATION') i.id,
  ].where((e) => e != null).cast<String>().toList();

  final iconUrls = await fetchIcons(config.figmaKey, token, iconIds.join(','));

  for (final img in iconUrls) {
    final config = imgConfigs.where((e) => e.id == img.imageId);
    final path = config.isNotEmpty ? config.first.name : img.imageId;

    final pathDot = path.split('.').length > 1 ? path : '$path.svg';

    final check = checkIfExit(pathSource, pathDot);
    if (check) continue;

    stdout.writeln('icon $path download...');
    final imageByte = await download(img.url);

    String? oldPath;

    if (config.isEmpty) {
      lstLog.add('add icons: - $path: :name');
    } else {
      oldPath = '${img.imageId}.svg';
    }
    writer(imageByte, pathDot, oldPath);
  }
  stdout
    ..writeln(lstLog.join('\n'))
    ..writeln('Download success!');
}
