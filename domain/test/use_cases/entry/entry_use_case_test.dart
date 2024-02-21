import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../utils/dummy/entries_dummy.dart';
import 'entry_use_case_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<EntryRepository>(),
])
Future<void> main() async {
  late MockEntryRepository repository;
  late EntryUseCase useCase;
  late Isar isar;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Isar.initializeIsarCore(download: true);
    isar = await LocalDatabase.openIsarTest();
    await isar.writeTxn<void>(() async {
      await isar.entryLocals.clear();
    });

    await LocalDatabase.init(isar);

    repository = MockEntryRepository();

    configureDomainDependenciesTest();
  });
  tearDownAll(() => isar.close(deleteFromDisk: true));
  group('test entry repository', () {
    setUpAll(
      () async {
        useCase = EntryUseCase(repository);
        await isar.writeTxn<void>(() async {
          await isar.entryLocals.clear();
        });
      },
    );
    group('fetch', () {
      test('test get entries', () async {
        final model = Entries.fromJson(dummyEntries);
        when(repository.fetch()).thenAnswer(
          (_) async => Right(
            [
              for (final i in model.entries) EntryModel.fromEntryRemote(i),
            ],
          ),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<EntryModel>>());
        final resultCast = result as List<EntryModel>;
        expect(resultCast.length, model.count);
        expect(resultCast.first.aPI, model.entries.first.aPI);
        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.entryLocals.clear();
            });
          },
        );
      });
      test('test get forceRefresh', () async {
        final model = Entries.fromJson(dummyEntries);
        when(repository.fetch()).thenAnswer(
          (_) async => Right(
            [
              for (final i in model.entries) EntryModel.fromEntryRemote(i),
            ],
          ),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<EntryModel>>());
        final resultCast = result as List<EntryModel>;
        expect(resultCast.length, model.count);
        expect(resultCast.first.aPI, model.entries.first.aPI);
        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.entryLocals.clear();
            });
          },
        );
      });
      test('test get entries empty', () async {
        when(repository.fetch()).thenAnswer(
          (_) async => const Right([]),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<EntryModel>>());
        final resultCast = result as List<EntryModel>;
        expect(resultCast.length, 0);
        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.entryLocals.clear();
            });
          },
        );
      });
      test('test get entries null', () async {
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
              await isar.entryLocals.clear();
            });
          },
        );
      });
    });
  });
}
