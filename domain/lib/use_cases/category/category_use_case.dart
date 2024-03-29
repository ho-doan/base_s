import 'package:dartz/dartz.dart';
import '../../domain.dart';

import '../../repositories/repositories.dart';

class CategoryUseCase {
  CategoryUseCase(this._repository);

  final CategoryRepository _repository;

  Future<Either<ErrorState, List<CategoryModel>>> fetch({
    bool forceRefresh = false,
    RootIsolateToken? token,
  }) =>
      _repository.fetch(forceRefresh: forceRefresh, token: token);
}
