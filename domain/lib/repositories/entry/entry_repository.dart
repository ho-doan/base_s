import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../data/local_data_sources/entry/entry_local_data_source.dart';
import '../../data/models/models.dart';
import '../../data/remote_data_sources/entry/entries_remote_data_source.dart';

class EntryRepository {
  EntryRepository(this._local, this._remote);

  final EntryLocalDataSource _local;
  final EntryRemoteDataSource _remote;

  Future<Either<ErrorState, List<Entry>>> fetch({
    bool forceRefresh = false,
  }) async {
    try {
      final cache = await _local.getAll();

      final check = forceRefresh || cache.isEmpty;

      if (check) {
        final fetchResult = await _remote.fetchEntries();
        return fetchResult.fold(Left.new, (r) async {
          final models = [
            for (final i in r.entries) EntryLocal.fromEntry(i),
          ];
          await _local.insertAll(models);
          return Right(r.entries);
        });
      }

      return Right([for (final i in cache) Entry.fromEntryLocal(i)]);
    } on Exception catch (error, stackTrace) {
      log(
        'Fetch entries info list failed: $error',
        stackTrace: stackTrace,
      );
      return Left(ErrorState(error: error, stackTrace: stackTrace));
    }
  }
}
