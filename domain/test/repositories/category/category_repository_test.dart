import 'package:dartz/dartz.dart';
import 'package:domain/data/local_data_sources/local_data_sources.dart';
import 'package:domain/data/remote_data_sources/remote_data_sources.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../utils/dummy/base_model_dummy.dart';
import '../../utils/dummy/category_dummy.dart';
import 'category_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CategoryRemoteDataSource>(),
])
Future<void> main() async {
  late CategoryRemoteDataSource remoteDataSource;
  late CategoryRepository repository;
  late Isar isar;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Isar.initializeIsarCore(download: true);
    isar = await LocalDatabase.openIsarTest();

    await LocalDatabase.init(isar);

    remoteDataSource = MockCategoryRemoteDataSource();

    configureDomainDependenciesTest();

    getItTesting
      ..unregister<CategoryRemoteDataSource>()
      ..registerFactory(() => remoteDataSource);
  });
  tearDownAll(() async => await isar.close(deleteFromDisk: true));
  group('test category repository', () {
    setUpAll(
      () async {
        repository = getItTesting<CategoryRepository>();
      },
    );
    group('fetch', () {
      test('with success', () async {
        final model = [CategoryRemote.fromJson(dummyCategory)];
        when(remoteDataSource.fetchCategories()).thenAnswer(
          (_) async => Right(model),
        );
        final res = await repository.fetch();
        final result = res.fold((l) => l, (r) => r);

        // expect(res.isRight(), true);
        expect(result, isA<List<CategoryModel>>());
        final resultCast = result as List<CategoryModel>;
        expect(resultCast.length, model.length);
        expect(resultCast.length, 1);
        expect(resultCast.first.name, model.first.name);
        await Future<void>.delayed(const Duration(seconds: 5));
        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.categoryLocals.clear();
            });
          },
        );
      });
      test('with forceRefresh', () async {
        final model = [CategoryRemote.fromJson(dummyBaseModel)];
        when(remoteDataSource.fetchCategories()).thenAnswer(
          (_) async => Right(model),
        );
        final res = await repository.fetch(forceRefresh: true);
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<CategoryModel>>());
        final resultCast = result as List<CategoryModel>;
        expect(resultCast.length, model.length);
        expect(resultCast.first.name, model.first.name);
        await Future<void>.delayed(Durations.extralong4);
        final local = await getItTesting<CategoryLocalDataSource>().getAll();
        for (final item in resultCast) {
          expect(local.any((e) => e.name == item.name), true);
        }
        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.categoryLocals.clear();
            });
          },
        );
      });
      test('with empty', () async {
        final model = <CategoryRemote>[];
        when(remoteDataSource.fetchCategories()).thenAnswer(
          (_) async => Right(model),
        );
        final res = await repository.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<CategoryModel>>());
        final resultCast = result as List<CategoryModel>;
        expect(resultCast.length, 0);
        await Future<void>.delayed(Durations.short4);
        final local = await getItTesting<CategoryLocalDataSource>().getAll();

        expect(local.length, 0);

        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.categoryLocals.clear();
            });
          },
        );
      });
      test('with null', () async {
        when(remoteDataSource.fetchCategories()).thenAnswer(
          (_) async => Left(ErrorState(error: '')),
        );
        final res = await repository.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isLeft(), true);
        expect(result, isA<ErrorState>());
        await Future<void>.delayed(Durations.short4);
        final local = await getItTesting<CategoryLocalDataSource>().getAll();

        expect(local.length, 0);

        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.categoryLocals.clear();
            });
          },
        );
      });
    });
  });
}
