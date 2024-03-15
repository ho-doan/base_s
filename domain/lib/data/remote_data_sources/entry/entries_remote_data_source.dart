import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../services/networks/api_client.dart';
import '../../models/data_models.dart';

class EntryRemoteDataSource {
  EntryRemoteDataSource(this._apiClient, this._clientFigma);

  final ApiClient _apiClient;
  final ApiClientFigma _clientFigma;

  Future<Either<ErrorState, Entries>> fetchEntries() async {
    try {
      final result = await _apiClient.entries();
      final resultF = await _clientFigma.getNode(
        'Vd7Q0UTxSrpTm1n6yEPe55hR',
        'figd_JsfT_-mkMcCAtawNtiDDcl-gf1vrCIEBphdFCgWp',
      );
      log('resultF: $resultF');
      assert(result.data != null, 'Entries model server null');
      return Right(result.data!);
    } catch (error, stackTrace) {
      log(
        'Fetch categories failed: $error',
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
