import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../data/models/models.dart';
import '../../models/models.dart';
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
