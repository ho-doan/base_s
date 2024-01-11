import 'package:app/main.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> runningCounter(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
}
