import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/models/data_models.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String? baseUrl,
  }) = _ApiClient;
  @GET('/categories')
  Future<BaseModel<List<CategoryRemote>>> categories();
  @GET('/categories/{id}/products')
  Future<BaseModel<List<ProductRemote>>> productsByCate(@Path('id') int id);
}
