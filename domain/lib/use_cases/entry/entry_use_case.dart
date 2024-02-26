import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../data/models/data_models.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

class EntryUseCase {
  EntryUseCase(this._repository);

  final EntryRepository _repository;

  Future<Either<ErrorState, List<EntryModel>>> fetch({
    bool forceRefresh = false,
    RootIsolateToken? token,
  }) =>
      _repository.fetch(forceRefresh: forceRefresh, token: token);
}
