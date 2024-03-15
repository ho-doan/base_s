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

@RestApi()
abstract class ApiClientFigma {
  factory ApiClientFigma(
    Dio dio, {
    String? baseUrl,
  }) = _ApiClientFigma;

  /// * [version]: A specific version ID to get.
  /// Omitting this will get the current version of the file
  /// * [ids]: If specified, only a subset of the document will be returned
  /// corresponding to the nodes listed, their children, and everything
  /// between the root node and the listed nodes
  /// * [depth]: Positive integer representing how deep into the document tree
  /// to traverse. For example, setting this to 1 returns only Pages, setting
  /// it to 2 returns Pages and all top level objects on each page.
  /// Not setting this parameter returns all nodes
  /// * [geometry]: Set to "paths" to export vector data
  /// * [pluginData]: A comma separated list of plugin IDs and/or the string "shared".
  /// Any data present in the document written by those plugins will be
  /// included in the result in the `pluginData` and `sharedPluginData`
  /// properties.
  /// * [branchData]: Set to returns branch metadata for the requested file
  @GET('/files/{key}')
  Future<dynamic> getNode(
    @Path('key') String key,
    @Header('X-Figma-Token') String token, {
    @Query('branch_data') bool? branchData,
    @Query('version') String? version,
    @Query('ids') List<String>? ids,
    @Query('depth') int? depth,
    // TODO(hodoan): enum Geometry name
    @Query('geometry') String? geometry,
    @Query('plugin_data') String? pluginData,
  });
}
