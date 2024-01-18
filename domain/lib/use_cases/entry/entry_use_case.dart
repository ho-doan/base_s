import 'package:dartz/dartz.dart';

import '../../data/models/models.dart';
import '../../repositories/repositories.dart';

class EntryUseCase {
  EntryUseCase(this._repository);

  final EntryRepository _repository;

  Future<Either<ErrorState, List<Entry>>> fetch({
    bool forceRefresh = false,
  }) =>
      _repository.fetch(forceRefresh: forceRefresh);
}
