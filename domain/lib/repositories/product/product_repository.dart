import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';

import '../../data/remote_data_sources/remote_data_sources.dart';
import '../../domain.dart';

class ProductRepository {
  ProductRepository(this._remote);

  final ProductRemoteDataSource _remote;

  Future<Either<ErrorState, List<ProductModel>>> fetch(
    int categoryId, {
    bool forceRefresh = false,
    RootIsolateToken? token,
  }) async {
    try {
      List<ProductLocal> cache;
      if (token == null) {
        cache = [];
      } else {
        cache = [];
      }

      final check = forceRefresh || cache.isEmpty;

      if (check) {
        final fetchResult = await _remote.getAllBy(categoryId);
        return fetchResult.fold(Left.new, (r) async {
          final models = [
            for (final i in r) ProductLocal.fromRemote(i),
          ];
          // unawaited(
          //   computeApp(
          //     _local.insertAllTask,
          //     LocalTaskList(
          //       models: models,
          //       token: !kIsWeb ? token ?? RootIsolateToken.instance! : null,
          //     ),
          //   ),
          // );
          return Right(
            [for (final i in r) ProductModel.fromRemote(i)],
          );
        });
      }

      return Right([for (final i in cache) ProductModel.fromLocal(i)]);
    } on Exception catch (error, stackTrace) {
      log(
        'Fetch products failed: $error',
        stackTrace: stackTrace,
      );
      return Left(ErrorState(error: error, stackTrace: stackTrace));
    }
  }

  Future<Either<ErrorState, List<ProductRemote>?>> fetchLocal() async {
    try {
      final cache = [];

      return Right([for (final i in cache) ProductRemote.fromLocal(i)]);
    } on Exception catch (error, stackTrace) {
      log(
        'Fetch products failed: $error',
        stackTrace: stackTrace,
      );
      return Left(ErrorState(error: error, stackTrace: stackTrace));
    }
  }
}
