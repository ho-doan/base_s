import 'package:dartz/dartz.dart';
import '../../domain.dart';

import '../../repositories/repositories.dart';

class FigmaUseCase {
  FigmaUseCase(this._repository);

  final FigmaRepository _repository;

  Future<Either<ErrorState, FigmaFile>> fetchFile() => _repository.fetchFile();
}
