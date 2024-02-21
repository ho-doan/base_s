import 'package:flutter/services.dart';

void initIsolateToken(RootIsolateToken token) {
  BackgroundIsolateBinaryMessenger.ensureInitialized(token);
}
