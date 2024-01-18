import 'package:dartz/dartz.dart';
import 'package:domain/data/models/models.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:domain/services/local_database/local_database.dart';
import 'package:domain/services/networks/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../utils/dummy/entries_dummy.dart';
import 'entry_use_case_test.mocks.dart';

class MockApiClient extends Mock implements ApiClient {}

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
    isar = await Isar.open(
      [EntryLocalSchema],
      directory: '',
    );
    await isar.writeTxn<void>(() async {
      await isar.entryLocals.clear();
    });

    await LocalDatabase.init(isar);

    repository = MockEntryRepository();

    configureDependenciesTest();
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
          (_) async => Right(model.entries),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<Entry>>());
        final resultCast = result as List<Entry>;
        expect(resultCast.length, model.count);
        expect(resultCast.first, model.entries.first);
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
          (_) async => Right(model.entries),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<Entry>>());
        final resultCast = result as List<Entry>;
        expect(resultCast.length, model.count);
        expect(resultCast.first, model.entries.first);
        addTearDown(
          () async {
            await isar.writeTxn<void>(() async {
              await isar.entryLocals.clear();
            });
          },
        );
      });
      test('test get entries empty', () async {
        final model = Entries.fromJson(dummyEntries);
        when(repository.fetch()).thenAnswer(
          (_) async => Right(model.copyWith(count: 0, entries: []).entries),
        );
        final res = await useCase.fetch();
        final result = res.fold((l) => l, (r) => r);
        expect(res.isRight(), true);
        expect(result, isA<List<Entry>>());
        final resultCast = result as List<Entry>;
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
      });
    });
  });
}
