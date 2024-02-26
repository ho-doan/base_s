import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

import '../../data/local_data_sources/local_data_sources.dart';
import '../../data/remote_data_sources/remote_data_sources.dart';
import '../../domain.dart';

class CategoryRepository {
  CategoryRepository(this._local, this._remote);

  final CategoryLocalDataSource _local;
  final CategoryRemoteDataSource _remote;

  Future<Either<ErrorState, List<CategoryModel>>> fetch({
    bool forceRefresh = false,
    RootIsolateToken? token,
  }) async {
    try {
      List<CategoryLocal> cache;
      if (token == null) {
        cache = await _local.getAll();
      } else {
        cache = await _local.getAllTask(token);
      }

      final check = forceRefresh || cache.isEmpty;

      if (check) {
        final fetchResult = await _remote.fetchCategories();
        return fetchResult.fold(Left.new, (r) async {
          final models = [
            for (final i in r) CategoryLocal.fromRemote(i),
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
            [for (final i in r) CategoryModel.fromRemote(i)],
          );
        });
      }

      return Right([for (final i in cache) CategoryModel.fromLocal(i)]);
    } on Exception catch (error, stackTrace) {
      log(
        'Fetch categories info list failed: $error',
        stackTrace: stackTrace,
      );
      return Left(ErrorState(error: error, stackTrace: stackTrace));
    }
  }
}
