import 'dart:async';
import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import 'app.dart';
import 'core/observer/bloc_obs.dart';
import 'core/services/dependency_injection/service_locator.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      //#region config
      Bloc.observer = const AppBlocObserver();
      log(F.instance.env.apiEndpoint);
      await LocalDatabase.init();
      configureDependencies();
      //#endregion
      runApp(const App());
    },
    (error, stack) {},
  );
}
