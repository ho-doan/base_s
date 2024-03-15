import 'package:dartz/dartz.dart';

import '../../domain.dart';
import '../../repositories/repositories.dart';

class ProductUseCase {
  ProductUseCase(this._repository);

  final ProductRepository _repository;

  Future<Either<ErrorState, List<ProductModel>>> fetch(
    int categoryId, {
    bool forceRefresh = false,
    RootIsolateToken? token,
  }) =>
      _repository.fetch(categoryId, forceRefresh: forceRefresh, token: token);
}
