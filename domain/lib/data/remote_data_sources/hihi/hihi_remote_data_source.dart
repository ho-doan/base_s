import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../services/networks/api_client.dart';
import '../../models/data_models.dart';

class HihiRemoteDataSource {
  const HihiRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Either<ErrorState, List<HihiRemote>>> getAll() async {
    try {
      final result = await _apiClient.getAllHihi();
      assert(result.list != null, 'Categories model server null');
      return Right(result.list!);
    } on Exception catch (error, stackTrace) {
      log('get all Hihi failed: $error', stackTrace: stackTrace);
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
