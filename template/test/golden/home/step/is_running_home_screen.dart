import 'dart:io';

import 'package:common/system/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/core/router/router.dart';
import 'package:template/core/utils/utils.dart';
import 'package:template/feature/app/app.dart';

import '../../../utils/http_overrides.dart';

final homeScreen = MaterialApp.router(
  scrollBehavior: MyCustomScrollBehavior(),
  routerDelegate: Routers.ins.$router.routerDelegate,
  routeInformationProvider: Routers.ins.$router.routeInformationProvider,
  routeInformationParser: Routers.ins.$router.routeInformationParser,
  title: 'Flutter Demo',
  localizationsDelegates: const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  theme: AppThemes.internal().lightTheme,
  darkTheme: AppThemes.internal().dartTheme,
);
Future<void> runningHomeScreen(WidgetTester tester) async {
  navigatorKeyTesting = GlobalKey<NavigatorState>();
  HttpOverrides.global = MockHttpOverrides();
  await tester.pumpWidget(homeScreen);
  await tester.pump(Durations.extralong4);
}
