import 'package:domain/data/local_data_sources/entry/entry_local_data_source.dart';
import 'package:domain/data/remote_data_sources/entry/entries_remote_data_source.dart';
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
    expect(getItTesting<EntryRemoteDataSource>(), isA<EntryRemoteDataSource>());
    //#endregion
    //#region local data source
    expect(getItTesting<EntryLocalDataSource>(), isA<EntryLocalDataSource>());
    //#endregion
    //#region use case
    expect(getItTesting<EntryUseCase>(), isA<EntryUseCase>());
    //#endregion
  });
}
