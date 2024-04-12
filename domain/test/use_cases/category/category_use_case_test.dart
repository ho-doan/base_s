import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../utils/dummy/category_dummy.dart';
import 'category_use_case_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CategoryRepository>(),
])
Future<void> main() async {
  late MockCategoryRepository repository;
  late CategoryUseCase useCase;
  late Isar isar;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Isar.initializeIsarCore(download: true);
    isar = await LocalDatabase.openIsarTest();
    await isar.writeTxn<void>(() async {
      await isar.categoryLocals.clear();
    });

    await LocalDatabase.init(isar);

    repository = MockCategoryRepository();

    configureDomainDependenciesTest();
  });
  tearDownAll(() async => await isar.close(deleteFromDisk: true));
  group('test category repository', () {
    setUpAll(
      () async {
        useCase = CategoryUseCase(repository);
        await isar.writeTxn<void>(() async {
          await isar.categoryLocals.clear();
        });
      },
    );
    group('fetch', () {
      test('with success', () async {
        final model = [CategoryRemote.fromJson(dummyCategory)];
        when(repository.fetch()).thenAnswer(
          (_) async => Right(
            [
              for (final i in model) CategoryModel.fromRemote(i),
            ],
          ),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<CategoryModel>>());
        final resultCast = result as List<CategoryModel>;
        expect(resultCast.length, model.length);
        expect(resultCast.first.name, model.first.name);
        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.categoryLocals.clear();
            });
          },
        );
      });
      test('with forceRefresh', () async {
        final model = [CategoryRemote.fromJson(dummyCategory)];
        when(repository.fetch()).thenAnswer(
          (_) async => Right(
            [
              for (final i in model) CategoryModel.fromRemote(i),
            ],
          ),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<CategoryModel>>());
        final resultCast = result as List<CategoryModel>;
        expect(resultCast.length, model.length);
        expect(resultCast.first.name, model.first.name);
        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.categoryLocals.clear();
            });
          },
        );
      });
      test('with empty', () async {
        when(repository.fetch()).thenAnswer(
          (_) async => const Right([]),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<CategoryModel>>());
        final resultCast = result as List<CategoryModel>;
        expect(resultCast.length, 0);
        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.categoryLocals.clear();
            });
          },
        );
      });
      test('with null', () async {
        when(repository.fetch()).thenAnswer(
          (_) async => Left(ErrorState(error: '')),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isLeft(), true);
        expect(result, isA<ErrorState>());

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
