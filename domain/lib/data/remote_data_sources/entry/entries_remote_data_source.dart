import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../services/networks/api_client.dart';
import '../../models/data_models.dart';

class EntryRemoteDataSource {
  EntryRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Either<ErrorState, Entries>> fetchEntries() async {
    try {
      final result = await _apiClient.entries();
      assert(result.data != null, 'Entries model server null');
      return Right(result.data!);
    } catch (error, stackTrace) {
      log(
        'Fetch categories failed: $error',
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
