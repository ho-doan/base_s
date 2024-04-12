import 'package:dio/dio.dart';
import 'package:domain/data/remote_data_sources/remote_data_sources.dart';
import 'package:domain/domain.dart';
import 'package:domain/services/networks/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/dummy/base_model_dummy.dart';
import '../../../utils/dummy/category_dummy.dart';
import 'category_remote_data_source_test.mocks.dart';

class MockApiClient extends Mock implements ApiClient {}

@GenerateMocks([MockApiClient])
Future<void> main() async {
  late MockMockApiClient apiClient;
  late CategoryRemoteDataSource remote;
  setUpAll(() {
    apiClient = MockMockApiClient();
    configureDomainDependenciesTest(apiClient);
    remote = getItTesting<CategoryRemoteDataSource>();
  });
  group('test categories remote data source', () {
    group('api client', () {
      test('test success', () async {
        final model = [CategoryRemote.fromJson(dummyCategory)];
        when(apiClient.categories()).thenAnswer(
          (_) async => BaseModel(data: model),
        );
        final res = await apiClient.categories();
        expect(res, isA<BaseModel>());
        expect(res.data, isNotNull);
        expect(res.data!.first, isA<CategoryRemote>());
        expect(res.data!.length, model.length);
      });
      test('test throw exception', () async {
        when(apiClient.categories()).thenAnswer((_) async => throw Exception());
        expect(apiClient.categories(), throwsException);
      });
      test('test with data null', () async {
        when(apiClient.categories()).thenAnswer((_) async => const BaseModel());
        final res = await apiClient.categories();
        expect(res.data, null);
      });
      test('test with httpCode 404', () async {
        when(apiClient.categories()).thenAnswer(
          (_) async => throw DioException.badResponse(
            statusCode: 404,
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions()),
          ),
        );

        await expectLater(
          apiClient.categories,
          throwsA(isA<DioException>()),
        );
      });
      test('test with 500', () async {
        when(apiClient.categories()).thenAnswer(
          (_) async => throw DioException.badResponse(
            statusCode: 500,
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions()),
          ),
        );

        await expectLater(
          apiClient.categories,
          throwsA(isA<DioException>()),
        );
      });
    });
    group('remote data source', () {
      test('with success', () async {
        final model = [CategoryRemote.fromJson(dummyBaseModel)];
        when(apiClient.categories()).thenAnswer(
          (_) async => BaseModel(data: model),
        );
        final res = await remote.fetchCategories();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<CategoryRemote>>());
        expect(result, model);
      });
      test('with throw exception', () async {
        when(apiClient.categories()).thenAnswer((_) async => throw Exception());
        final res = await remote.fetchCategories();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isLeft(), true);
        expect(result, isA<ErrorState>());
      });
      test('with data null', () async {
        when(apiClient.categories()).thenAnswer((_) async => const BaseModel());
        expect(remote.fetchCategories(), throwsA(isA<AssertionError>()));
      });
      test('with 404', () async {
        when(apiClient.categories()).thenAnswer(
          (_) async => throw DioException.badResponse(
            statusCode: 404,
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions()),
          ),
        );

        final res = await remote.fetchCategories();
        final result = res.fold((l) => l, (r) => r);

        expect(res.isLeft(), true);
        expect(result, isA<ErrorState>());
      });
      test('with 500', () async {
        when(apiClient.categories()).thenAnswer(
          (_) async => throw DioException.badResponse(
            statusCode: 500,
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions()),
          ),
        );

        final res = await remote.fetchCategories();
        final result = res.fold((l) => l, (r) => r);

        expect(res.isLeft(), true);
        expect(result, isA<ErrorState>());
      });
    });
  });
}
