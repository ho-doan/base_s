import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/feature/home/home_screen.dart';

Future<void> runningCounter(WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
}
