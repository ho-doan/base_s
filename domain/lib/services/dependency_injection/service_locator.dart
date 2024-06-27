import 'dart:async';

import 'package:dio/dio.dart';
import 'package:domain/services/local_database/share_preference/share_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/local_data_sources/local_data_sources.dart';
import '../networks/api_client.dart';
import 'service_locator.config.dart';

@visibleForTesting
final getItTesting = GetIt.instance;

Dio get _dio {
  final dio = Dio();

  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.headers['Content-Type'] = 'application/json';

  dio.options.headers['Accept'] = 'text/json';

  return dio;
}

ApiClient get _apiClient {
  final dio = _dio;
  dio.interceptors.add(LogInterceptor(
      // request: false,
      // requestBody: false,
      // error: false,
      // requestHeader: false,
      // responseBody: false,
      // responseHeader: false,
      ));
  return ApiClient(
    _dio,
    baseUrl: F.instance.env.apiEndpoint,
  );
}

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDomainDependencies(GetIt getIt) async {
  getIt.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  await GetIt.instance.isReady<SharedPreferences>();
  getIt
    ..registerLazySingleton<SharedPreferenceHelper>(
      () => SharedPreferenceHelper(getIt<SharedPreferences>()),
    )
    ..registerLazySingleton<ApiClient>(() => _apiClient);

  $initGetIt(getIt);
}

@visibleForTesting
void configureDomainDependenciesTest([ApiClient? apiClient, GetIt? getIt]) {
  if (apiClient != null) {
    (getIt ?? getItTesting).registerLazySingleton<ApiClient>(() => apiClient);
  } else {
    (getIt ?? getItTesting).registerLazySingleton<ApiClient>(
      () => ApiClient(Dio(), baseUrl: 'https://example.com/'),
    );
  }
  $initGetIt(getIt ?? getItTesting);
}
