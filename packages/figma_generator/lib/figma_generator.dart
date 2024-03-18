
import 'figma_generator_platform_interface.dart';

class FigmaGenerator {
  Future<String?> getPlatformVersion() {
    return FigmaGeneratorPlatform.instance.getPlatformVersion();
  }
}
