import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  await configureDomainDependencies(getIt);
  $initGetIt(getIt);
}

@visibleForTesting
void configureDependenciesTest() {
  // ignore: invalid_use_of_visible_for_testing_member
  configureDomainDependenciesTest(null, getIt);
  $initGetIt(getIt);
}
