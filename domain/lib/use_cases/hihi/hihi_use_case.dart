import 'package:dartz/dartz.dart';
import '../../domain.dart';
import '../../repositories/repositories.dart';

class HihiUseCase {
  const HihiUseCase(this._repository);

  final HihiRepository _repository;

  Future<Either<ErrorState, List<HihiModel>>> getAll({
    bool forceRefresh = false,
    RootIsolateToken? token,
  }) async =>
      _repository.getAll(forceRefresh: forceRefresh, token: token);
}
