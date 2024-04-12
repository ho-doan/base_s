import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../services/networks/api_client.dart';
import '../../models/data_models.dart';

class ProductRemoteDataSource {
  const ProductRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Either<ErrorState, List<ProductRemote>>> getAll() async {
    try {
      final result = await _apiClient.productsByCate(-1);
      assert(result.data != null, 'Categories model server null');
      return Right(result.data!);
    } on Exception catch (error, stackTrace) {
      log('get all Product failed: $error', stackTrace: stackTrace);
      return Left(
        ErrorState(
          error: error,
          type: ErrorType.server,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  Future<Either<ErrorState, List<ProductRemote>>> getAllBy(
    int categoryId,
  ) async {
    try {
      final result = await _apiClient.productsByCate(categoryId);
      assert(result.data != null, 'product model server null');
      return Right(result.data!);
    } on Exception catch (error, stackTrace) {
      log(
        'Fetch product failed: $error',
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
