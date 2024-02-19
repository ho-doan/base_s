import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../data/local_data_sources/entry/entry_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/entry/entries_remote_data_source.dart';
import '../../models/models.dart';

class EntryRepository {
  EntryRepository(this._local, this._remote);

  final EntryLocalDataSource _local;
  final EntryRemoteDataSource _remote;

  Future<Either<ErrorState, List<EntryModel>>> fetch({
    bool forceRefresh = false,
    Directory? dir,
  }) async {
    try {
      List<EntryLocal> cache;
      if (dir != null) {
        cache = await _local.getAllTask(dir);
      } else {
        cache = await _local.getAll();
      }

      final check = forceRefresh || cache.isEmpty;

      if (check) {
        final fetchResult = await _remote.fetchEntries();
        return fetchResult.fold(Left.new, (r) async {
          final models = [
            for (final i in r.entries) EntryLocal.fromEntry(i),
          ];
          unawaited(compute(_local.insertAllTask, models));
          return Right(
            [for (final i in r.entries) EntryModel.fromEntryRemote(i)],
          );
        });
      }

      return Right([for (final i in cache) EntryModel.fromEntryLocal(i)]);
    } on Exception catch (error, stackTrace) {
      log(
        'Fetch entries info list failed: $error',
        stackTrace: stackTrace,
      );
      return Left(ErrorState(error: error, stackTrace: stackTrace));
    }
  }

  Future<Either<ErrorState, List<EntryRemote>?>> fetchLocal() async {
    try {
      final cache = await _local.getAll();

      return Right([for (final i in cache) EntryRemote.fromEntryLocal(i)]);
    } on Exception catch (error, stackTrace) {
      log(
        'Fetch entries info list failed: $error',
        stackTrace: stackTrace,
      );
      return Left(ErrorState(error: error, stackTrace: stackTrace));
    }
  }
}
