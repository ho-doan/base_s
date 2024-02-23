import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../services/networks/api_client.dart';
import '../../models/models.dart';

class ProductRemoteDataSource {
  ProductRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Either<ErrorState, List<ProductRemote>>> fetchCategories(
    int categoryId,
  ) async {
    try {
      final result = await _apiClient.productsByCate(categoryId);
      assert(result.list != null, 'product model server null');
      return Right(result.list!);
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
