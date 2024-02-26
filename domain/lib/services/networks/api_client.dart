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
  @GET('/entries')
  Future<BaseModel<Entries>> entries();
  @GET('/categories')
  Future<BaseModel<CategoryRemote>> categories();
  @GET('/categories/{id}/products')
  Future<BaseModel<ProductRemote>> productsByCate(@Path('id') int id);
}
