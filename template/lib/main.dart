import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/observer/bloc_obs.dart';
import 'core/services/dependency_injection/service_locator.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      //#region config
      Bloc.observer = const AppBlocObserver();
      await LocalDatabase.init();
      configureDependencies();
      //#endregion
      runApp(const App());
    },
    (error, stack) {},
  );
}
