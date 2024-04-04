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

ApiClientFigma get _apiClientFigma {
  final dio = _dio;
  dio.interceptors.add(LogInterceptor(
      // request: false,
      // requestBody: true,
      // error: false,
      // requestHeader: false,
      // responseBody: true,
      // responseHeader: false,
      ));
  dio.options.headers.addAll({
    'X-Figma-Token': F.instance.env.figmaToken,
  });

  return ApiClientFigma(
    dio,
    baseUrl: F.instance.env.apiEndpointFigma,
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
    ..registerLazySingleton<ApiClient>(() => _apiClient)
    ..registerLazySingleton<ApiClientFigma>(() => _apiClientFigma)

    // TODO(any): register all local data source

    /// Don't remove comment - CORE GENERATED FOR WEB
    ..registerFactory<EntryLocalDataSource>(EntryLocalDataSource.new)
    ..registerFactory<ProductLocalDataSource>(ProductLocalDataSource.new)
    ..registerFactory<CategoryLocalDataSource>(CategoryLocalDataSource.new);
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
