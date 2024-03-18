import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../data/remote_data_sources/remote_data_sources.dart';
import '../../domain.dart';

class FigmaRepository {
  FigmaRepository(this._remote);

  final FigmaRemoteDataSource _remote;

  Future<Either<ErrorState, FigmaFile>> fetchFile() async {
    try {
      final fetchResult = await _remote.fetchFile();
      return fetchResult;
    } catch (error, stackTrace) {
      log(
        'Fetch figma file info list failed: $error',
        stackTrace: stackTrace,
      );
      return Left(ErrorState(error: error, stackTrace: stackTrace));
    }
  }
}
