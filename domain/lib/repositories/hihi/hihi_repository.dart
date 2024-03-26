import 'dart:async';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';
import '../../data/local_data_sources/local_data_sources.dart';
import '../../data/models/data_models.dart';
import '../../data/remote_data_sources/remote_data_sources.dart';
import '../../models/models.dart';
import '../../services/local_database/local_database.dart';

class HihiRepository {
  const HihiRepository(
    this._local,
    this._remote,
  );

  final HihiLocalDataSource _local;

  final HihiRemoteDataSource _remote;

  Future<Either<ErrorState, List<HihiModel>>> getAll({
    bool forceRefresh = false,
    RootIsolateToken? token,
  }) async {
    try {
      List<HihiLocal> cache;
      if (token == null) {
        cache = await _local.getAll();
      } else {
        cache = await _local.getAllTask(token);
      }
      final check = forceRefresh || cache.isEmpty;
      if (check) {
        final fetchResult = await _remote.getAll();
        return fetchResult.fold(Left.new, (r) async {
          final models = [
            for (final i in r) HihiLocal.fromRemote(i),
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
            [for (final i in r) HihiModel.fromRemote(i)],
          );
        });
      }
      return Right([for (final i in cache) HihiModel.fromLocal(i)]);
    } on Exception catch (error, stackTrace) {
      log(
        'get all hihi info list failed: $error',
        stackTrace: stackTrace,
      );
      return Left(ErrorState(error: error, stackTrace: stackTrace));
    }
  }
}
