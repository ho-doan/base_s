import 'package:domain/data/local_data_sources/local_data_sources.dart';
import 'package:domain/data/remote_data_sources/remote_data_sources.dart';
import 'package:domain/domain.dart';
import 'package:domain/services/networks/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('di test', () async {
    configureDomainDependenciesTest();
    //#region api client
    expect(getItTesting<ApiClient>(), isA<ApiClient>());
    //#endregion
    //#region remote data source
    expect(getItTesting<CategoryRemoteDataSource>(),
        isA<CategoryRemoteDataSource>());
    //#endregion
    //#region local data source
    expect(getItTesting<CategoryLocalDataSource>(),
        isA<CategoryLocalDataSource>());
    //#endregion
    //#region use case
    expect(getItTesting<CategoryUseCase>(), isA<CategoryUseCase>());
    //#endregion
  });
}
