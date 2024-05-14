import 'package:common/common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/feature/app/cubit/app_cubit.dart';

import '../../core/router/router.dart';
import '../../core/services/firebase/notifications/firebase_core_app.dart';
import '../../core/utils/utils.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   FirebaseAppNotifications().initialize(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>(),
      child: MaterialApp.router(
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
      ),
    );
  }
}
