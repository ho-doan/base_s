import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

import '../../../services/networks/api_client.dart';
import '../../models/data_models.dart';

class FigmaRemoteDataSource {
  FigmaRemoteDataSource(this._apiClient);

  final ApiClientFigma _apiClient;

  Future<Either<ErrorState, FigmaFile>> fetchFile() async {
    try {
      final result = await _apiClient.getFile(F.instance.env.figmaKey);
      return Right(result);
    } catch (error, stackTrace) {
      log(
        'Fetch file figma failed: $error',
        stackTrace: stackTrace,
      );
      return Left(
        ErrorState(
          error: error,
          type: ErrorType.server,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
