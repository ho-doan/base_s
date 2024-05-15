import 'package:common/system/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/core/router/router.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/core/utils/utils.dart';

void main() {
  final homeScreen = MaterialApp.router(
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

  testWidgets(
    'when success',
    (tester) async {
      try {
        await configureDependencies();
        await tester.pumpWidget(homeScreen);

        await tester.pump();

        await tester.pumpAndSettle();
      } catch (e) {
        print(e);
      }
    },
  );
}
