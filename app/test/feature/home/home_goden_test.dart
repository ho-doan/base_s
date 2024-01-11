import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'step/i_see_counter.dart';
import 'step/i_tab_counter.dart';
import 'step/is_rendered_counter.dart';
import 'step/is_running_counter.dart';
import 'step/screenshot_verified.dart';

void main() {
  group('Counter', () {
    testWidgets('Counter init value is 0', (tester) async {
      await runningCounter(tester);
      await iSeeText(tester, '0');
    });
    testWidgets('Tab icon Plus increment the counter', (tester) async {
      await runningCounter(tester);
      await iTapIcon(tester, Icons.add);
      await iSeeText(tester, '1');
    });
    testGoldens('Primary swatch color is blue', (tester) async {
      await runningRenderedCounter(tester);
      await screenshotVerifiedCounter(tester, 'counter');
      addTearDown(() => tester.view.reset());
    });
    testWidgets('Primary swatch color is blue the counter', (tester) async {
      await loadAppFonts();
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.iphone11,
          ],
        )
        ..addScenario(widget: const MyApp());
      await tester.pumpDeviceBuilder(builder);
      await iTapIcon(tester, Icons.add);
      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile('goldens/counter_1.png'),
      );
    });
  });
}
