import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../services/networks/api_client.dart';
import '../../models/models.dart';

class CategoryRemoteDataSource {
  const CategoryRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Either<ErrorState, List<CategoryRemote>>> fetchCategories() async {
    try {
      final result = await _apiClient.categories();
      assert(result.list != null, 'Categories model server null');
      return Right(result.list!);
    } on Exception catch (error, stackTrace) {
      log('Fetch categories failed: $error', stackTrace: stackTrace);
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
