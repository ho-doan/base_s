import 'package:domain/data/models/local/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

void main() {
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
    });
    test('update success', () async {
      final entry = await isar.entryLocals.where().findFirst();
      await isar.writeTxn(() async {
        await isar.entryLocals.put(entry!.copyWith.hTTPS(true));
      });

      final entries = await isar.entryLocals.where().findAll();
      expect(entries.length, 1);
      expect(entries.first.aPI, entry!.aPI);
      expect(entries.first.hTTPS, true);
    });
    test('delete success', () async {
      final entry = await isar.entryLocals.where().findFirst();
      await isar.writeTxn(() async {
        await isar.entryLocals.delete(entry!.key!);
      });

      final entries = await isar.entryLocals.where().findAll();
      expect(entries.length, 0);
    });
  });
}
