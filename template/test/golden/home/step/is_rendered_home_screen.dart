import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:template/core/router/router.dart';

import '../../../utils/http_overrides.dart';
import 'is_running_home_screen.dart';

Future<void> runningRenderedHomeScreen(WidgetTester tester) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await loadAppFonts();
  HttpOverrides.global = MockHttpOverrides();
  navigatorKeyTesting = GlobalKey<NavigatorState>();
  debugDisableShadows = false;
  final builder = DeviceBuilder()
    ..overrideDevicesForAllScenarios(
      devices: [Device.iphone11],
    )
    ..addScenario(widget: homeScreen);
  await tester.pumpDeviceBuilder(builder);
}
