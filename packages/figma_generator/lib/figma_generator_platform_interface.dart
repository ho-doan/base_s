import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'figma_generator_method_channel.dart';

abstract class FigmaGeneratorPlatform extends PlatformInterface {
  /// Constructs a FigmaGeneratorPlatform.
  FigmaGeneratorPlatform() : super(token: _token);

  static final Object _token = Object();

  static FigmaGeneratorPlatform _instance = MethodChannelFigmaGenerator();

  /// The default instance of [FigmaGeneratorPlatform] to use.
  ///
  /// Defaults to [MethodChannelFigmaGenerator].
  static FigmaGeneratorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FigmaGeneratorPlatform] when
  /// they register themselves.
  static set instance(FigmaGeneratorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
