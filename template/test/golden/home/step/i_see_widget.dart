import 'package:flutter_test/flutter_test.dart';

Future<void> iSeeText(WidgetTester tester, String text) async {
  expect(find.text(text), findsOneWidget);
}

Future<void> iSeeNText(WidgetTester tester, String text, int n) async {
  expect(find.text(text), findsNWidgets(n));
}
