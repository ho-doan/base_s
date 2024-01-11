import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> runningRenderedCounter(WidgetTester tester) async {
  await loadAppFonts();
  debugDisableShadows = false;
  final builder = DeviceBuilder()
    ..overrideDevicesForAllScenarios(
      devices: [
        Device.phone,
        Device.tabletLandscape,
        // Device.tabletPortrait,
        Device.iphone11,
      ],
    )
    ..addScenario(widget: const MyApp());
  await tester.pumpDeviceBuilder(builder);
}
