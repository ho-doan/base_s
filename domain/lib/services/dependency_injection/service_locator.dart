import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../core/env/env.dart';
import '../networks/api_client.dart';
import 'service_locator.config.dart';

@visibleForTesting
final getItTesting = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies(GetIt getIt) {
  final dio = Dio();

  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.headers['Content-Type'] = 'application/json';

  dio.options.headers['Accept'] = 'text/json';

  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(
      dio,
      baseUrl: Env.apiEndpoint,
    ),
  );
  $initGetIt(getIt);
}

@visibleForTesting
void configureDependenciesTest(ApiClient apiClient) {
  getItTesting.registerLazySingleton<ApiClient>(() => apiClient);
  $initGetIt(getItTesting);
}
