import 'dart:io';

import '../core_generator.dart';
import '../services/remote/api_client.dart';

Future<void> getAllImage(
  String pathSource,
  String token,
  FigmaGen config,
  ImageWriter writer,
) async {
  final imgConfigs = config.imgConfigs;
  final imgLst = await fetchImages(config.figmaKey, token);
  final lstLog = <String>[];
  for (final img in imgLst) {
    final config = imgConfigs.where((e) => e.id == img.imageId);
    final path = config.isNotEmpty ? config.first.name : img.imageId;

    final pathDot = path.split('.').length > 1 ? path : '$path.png';

    final check = checkIfExit(pathSource, pathDot);
    if (check) continue;

    stdout.writeln('img $path download...');
    final imageByte = await download(img.url);

    String? oldPath;

    if (config.isEmpty) {
      lstLog.add('add imgs: - $path: :name');
    } else {
      oldPath = '${img.imageId}.png';
    }
    writer(imageByte, pathDot, oldPath);
  }
  stdout
    ..writeln(lstLog.join('\n'))
    ..writeln('Download success!');
}
