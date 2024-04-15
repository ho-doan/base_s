import 'dart:async';
import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/firebase/notifications/firebase_core_app.dart';
import 'feature/app/app.dart';
import 'core/observer/bloc_obs.dart';
import 'core/services/dependency_injection/service_locator.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      //#region config
      print('============ ${DefaultFirebaseOptions.name}');
      await Firebase.initializeApp(
        name: DefaultFirebaseOptions.name,
        options: DefaultFirebaseOptions.currentPlatform,
      );
      Bloc.observer = const AppBlocObserver();
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
