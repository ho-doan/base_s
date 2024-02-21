import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

import '../../data/local_data_sources/local_data_sources.dart';
import '../../data/remote_data_sources/entry/entries_remote_data_source.dart';
import '../../domain.dart';

class EntryRepository {
  EntryRepository(this._local, this._remote);

  final EntryLocalDataSource _local;
  final EntryRemoteDataSource _remote;

  Future<Either<ErrorState, List<EntryModel>>> fetch({
    bool forceRefresh = false,
    RootIsolateToken? token,
  }) async {
    try {
      List<EntryLocal> cache;
      if (token == null) {
        cache = await _local.getAll();
      } else {
        cache = await _local.getAllTask(token);
      }

      final check = forceRefresh || cache.isEmpty;

      if (check) {
        final fetchResult = await _remote.fetchEntries();
        return fetchResult.fold(Left.new, (r) async {
          final models = [
            for (final i in r.entries) EntryLocal.fromEntry(i),
          ];
          unawaited(
            computeApp(
              _local.insertAllTask,
              LocalTaskList(
                models: models,
                token: !kIsWeb ? token ?? RootIsolateToken.instance! : null,
              ),
            ),
          );
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
