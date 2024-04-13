library domain;

import 'dart:async';

import 'package:domain/services/local_database/_local_database.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

export 'package:flutter/services.dart';
export 'data/models/data_models.dart';
export 'models/models.dart';
export 'services/dependency_injection/service_locator.dart';
export 'services/local_database/local_database.dart';
export 'use_cases/use_cases.dart';

@visibleForTesting
Future<void> configIsarTesting() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Isar.initializeIsarCore(download: true);
  // ignore: invalid_use_of_visible_for_testing_member
  final isar = await LocalDatabase.openIsarTest();
  LocalDatabase.init(isar);
}
