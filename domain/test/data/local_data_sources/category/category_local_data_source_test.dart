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
  tearDownAll(() async => await isar.close(deleteFromDisk: true));
  group('category local database', () {
    test('insert success', () async {
      const mock = CategoryLocal(id: 1, primary: 1, name: 'API');
      await isar.writeTxn(() async {
        await isar.categoryLocals.put(mock);
      });

      final data = await isar.categoryLocals.where().findAll();
      expect(data.length, 1);
      expect(data.first.name, mock.name);

      addTearDown(
        () => isar.writeTxn<void>(() async {
          await isar.categoryLocals.clear();
        }),
      );
    });
    test('update success', () async {
      const cate = CategoryLocal(primary: 1, name: 'API');
      await isar.writeTxn(() async {
        await isar.categoryLocals.put(cate);
      });
      final category = await isar.categoryLocals.where().findFirst();
      await isar.writeTxn(() async {
        await isar.categoryLocals.put(category!.copyWith.name('API2'));
      });

      final categories = await isar.categoryLocals.where().findAll();
      expect(categories.length, 1);
      expect(categories.first.name, 'API2');

      addTearDown(
        () => isar.writeTxn<void>(() async {
          await isar.categoryLocals.clear();
        }),
      );
    });
    test('delete success', () async {
      const cate = CategoryLocal(primary: 1, name: 'API');
      await isar.writeTxn(() async {
        await isar.categoryLocals.put(cate);
      });
      final data = await isar.categoryLocals.where().findFirst();
      await isar.writeTxn(() async {
        await isar.categoryLocals.delete(data!.key!);
      });

      final local = await isar.categoryLocals.where().findAll();
      expect(local.length, 0);

      addTearDown(
        () => isar.writeTxn<void>(() async {
          await isar.categoryLocals.clear();
        }),
      );
    });
  });
}
