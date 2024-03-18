import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'figma_generator_platform_interface.dart';

/// An implementation of [FigmaGeneratorPlatform] that uses method channels.
class MethodChannelFigmaGenerator extends FigmaGeneratorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('figma_generator');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
