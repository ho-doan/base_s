import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../data/local_data_sources/local_data_sources.dart';
import '../networks/api_client.dart';
import 'service_locator.config.dart';

@visibleForTesting
final getItTesting = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDomainDependencies(GetIt getIt) {
  final dio = Dio();

  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.headers['Content-Type'] = 'application/json';

  dio.options.headers['Accept'] = 'text/json';

  dio.interceptors.add(LogInterceptor());

  getIt
    ..registerLazySingleton<ApiClient>(
      () => ApiClient(
        dio,
        baseUrl: F.instance.env.apiEndpoint,
      ),
    )
    // TODO(any): register all local data source
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
