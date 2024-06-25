import 'dart:async';
import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import 'feature/app/app.dart';
import 'core/observer/bloc_obs.dart';
import 'core/services/dependency_injection/service_locator.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      //#region config
      // print('============ ${DefaultFirebaseOptions.name}');
      // await Firebase.initializeApp(
      //   name: DefaultFirebaseOptions.name,
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );
      Bloc.observer = const AppBlocObserver();

      await F.instance.env.load();

      await LocalDatabase.init();
      await configureDependencies();
      //#endregion
      runApp(const App());
    },
    (error, stack) {
      log(error.toString());
    },
  );
}
