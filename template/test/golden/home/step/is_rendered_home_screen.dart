import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'is_running_home_screen.dart';

Future<void> runningRenderedHomeScreen(WidgetTester tester) async {
  await loadAppFonts();
  debugDisableShadows = false;
  final builder = DeviceBuilder()
    ..overrideDevicesForAllScenarios(
      devices: [
        Device.tabletLandscape,
        Device.iphone11,
      ],
    )
    ..addScenario(widget: homeScreen);
  await tester.pumpDeviceBuilder(builder);
}
