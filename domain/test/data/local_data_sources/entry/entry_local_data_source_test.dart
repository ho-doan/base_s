import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

void main() {
  late Isar isar;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Isar.initializeIsarCore(download: true);
    isar = await LocalDatabase.openIsarTest();
  });
  tearDownAll(() => isar.close(deleteFromDisk: true));
  group('entry local database', () {
    test('insert success', () async {
      const entry = EntryLocal(aPI: 'API');
      await isar.writeTxn(() async {
        await isar.entryLocals.put(entry);
      });

      final entries = await isar.entryLocals.where().findAll();
      expect(entries.length, 1);
      expect(entries.first.aPI, entry.aPI);

      addTearDown(
        () => isar.writeTxn<void>(() async {
          await isar.entryLocals.clear();
        }),
      );
    });
    test('update success', () async {
      const entry1 = EntryLocal(aPI: 'API');
      await isar.writeTxn(() async {
        await isar.entryLocals.put(entry1);
      });
      final entry = await isar.entryLocals.where().findFirst();
      await isar.writeTxn(() async {
        await isar.entryLocals.put(entry!.copyWith.hTTPS(true));
      });

      final entries = await isar.entryLocals.where().findAll();
      expect(entries.length, 1);
      expect(entries.first.aPI, entry!.aPI);
      expect(entries.first.hTTPS, true);

      addTearDown(
        () => isar.writeTxn<void>(() async {
          await isar.entryLocals.clear();
        }),
      );
    });
    test('delete success', () async {
      const entry1 = EntryLocal(aPI: 'API');
      await isar.writeTxn(() async {
        await isar.entryLocals.put(entry1);
      });
      final entry = await isar.entryLocals.where().findFirst();
      await isar.writeTxn(() async {
        await isar.entryLocals.delete(entry!.key!);
      });

      final entries = await isar.entryLocals.where().findAll();
      expect(entries.length, 0);

      addTearDown(
        () => isar.writeTxn<void>(() async {
          await isar.entryLocals.clear();
        }),
      );
    });
  });
}
