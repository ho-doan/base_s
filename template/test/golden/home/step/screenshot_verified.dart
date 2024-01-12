import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> screenshotVerifiedCounter(
  WidgetTester tester,
  String scenario,
) async {
  await screenMatchesGolden(tester, scenario);
}
