import 'package:flutter_test/flutter_test.dart';
import 'package:figma_generator/figma_generator.dart';
import 'package:figma_generator/figma_generator_platform_interface.dart';
import 'package:figma_generator/figma_generator_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFigmaGeneratorPlatform
    with MockPlatformInterfaceMixin
    implements FigmaGeneratorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FigmaGeneratorPlatform initialPlatform = FigmaGeneratorPlatform.instance;

  test('$MethodChannelFigmaGenerator is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFigmaGenerator>());
  });

  test('getPlatformVersion', () async {
    FigmaGenerator figmaGeneratorPlugin = FigmaGenerator();
    MockFigmaGeneratorPlatform fakePlatform = MockFigmaGeneratorPlatform();
    FigmaGeneratorPlatform.instance = fakePlatform;

    expect(await figmaGeneratorPlugin.getPlatformVersion(), '42');
  });
}
