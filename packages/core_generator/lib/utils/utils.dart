import 'dart:io';

import 'package:path/path.dart';

export 'cast.dart';
export 'error.dart';
export 'file.dart';
export 'map.dart';
export 'pubspec.dart';
export 'version.dart';

bool checkIfExit(String path, String pFile) {
  final file = File(normalize(join(path, pFile)));
  return file.existsSync();
}
