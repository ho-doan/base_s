import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'core/router/router.dart';
import 'core/services/dependency_injection/service_locator.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      //#region config
      await LocalDatabase.init();
      configureDependencies();
      //#endregion
      runApp(const MyApp());
    },
    (error, stack) {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: Routers.ins.$router.routerDelegate,
      routeInformationProvider: Routers.ins.$router.routeInformationProvider,
      routeInformationParser: Routers.ins.$router.routeInformationParser,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
