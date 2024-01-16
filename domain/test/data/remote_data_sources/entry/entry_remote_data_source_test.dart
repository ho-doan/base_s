import 'package:domain/data/models/models.dart';
import 'package:domain/data/remote_data_sources/entry/entries_remote_data_source.dart';
import 'package:domain/domain.dart';
import 'package:domain/services/networks/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'entry_remote_data_source_test.mocks.dart';

class MockApiClient extends Mock implements ApiClient {}

@GenerateMocks([MockApiClient])
Future<void> main() async {
  final json = {
    'count': 1,
    'entries': [
      {
        'API': 'aPI',
        'Auth': 'auth',
        'Category': 'category',
        'Cors': 'cors',
        'Description': 'description',
        'HTTPS': false,
        'Link': 'link',
      }
    ],
  };
  late MockMockApiClient apiClient;
  late EntryRemoteDataSource remote;
  setUpAll(() {
    apiClient = MockMockApiClient();
    configureDependenciesTest(apiClient);
    remote = getItTesting<EntryRemoteDataSource>();
  });
  group('test entries', () {
    group('api client', () {
      test('test get entries', () async {
        final model = Entries.fromJson(json);
        when(apiClient.entries()).thenAnswer(
          (_) async => BaseModel(data: model),
        );
        final res = await apiClient.entries();
        expect(res, isA<BaseModel>());
        expect(res.data, model);
      });
      test('test get entries throw exception', () async {
        when(apiClient.entries()).thenAnswer((_) async => throw Exception());
        expect(apiClient.entries(), throwsException);
      });
      test('test get entries with entries null', () async {
        when(apiClient.entries())
            .thenAnswer((_) async => const BaseModel(data: null));
        final res = await apiClient.entries();
        expect(res.data, null);
      });
    });
    group('remote data source', () {
      test('test get entries', () async {
        final model = Entries.fromJson(json);
        when(apiClient.entries()).thenAnswer(
          (_) async => BaseModel(data: model),
        );
        final res = await remote.fetchEntries();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<Entries>());
        expect(result, model);
      });
      test('test get entries throw exception', () async {
        when(apiClient.entries()).thenAnswer((_) async => throw Exception());
        final res = await remote.fetchEntries();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isLeft(), true);
        expect(result, isA<ErrorState>());
      });
      test('test get entries with entries null', () async {
        when(apiClient.entries())
            .thenAnswer((_) async => const BaseModel(data: null));
        expect(remote.fetchEntries, throwsA(isA<AssertionError>()));
      });
    });
  });
}
