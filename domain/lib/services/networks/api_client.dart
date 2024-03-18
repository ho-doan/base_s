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

  /// {@template api_client.param.query}
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
  /// {@endtemplate}
  @GET('/files/{key}')
  Future<FigmaFile> getFile(
    @Path('key') String key, {
    @Query('branch_data') bool? branchData,
    @Query('version') String? version,
    @Query('ids') List<String>? ids,
    @Query('depth') int? depth,
    // TODO(hodoan): enum Geometry name
    @Query('geometry') String? geometry,
    @Query('plugin_data') String? pluginData,
  });

  /// {@macro api_client.param.query}
  @GET('/files/{key}/nodes')
  Future<dynamic> getNode(
    @Path('key') String key, {
    @Query('version') String? version,
    @Query('ids') List<String>? ids,
    @Query('depth') int? depth,
    // TODO(hodoan): enum Geometry name
    @Query('geometry') String? geometry,
    @Query('plugin_data') String? pluginData,
  });

  /// * [format]:  A string enum for the image output format
  /// * [scale]: A number between 0.01 and 4, the image scaling factor
  /// * [svgIncludeId]: Whether to include id attributes for all SVG elements.
  ///  `Default: false`
  /// * [svgSimplifyStroke]: Whether to simplify inside/outside strokes and
  /// use stroke attribute if possible instead of <mask>. `Default: true`
  /// * [useAbsoluteBounds]: Use the full dimensions of the node regardless of
  /// whether or not it is cropped or the space around it is empty.
  /// Use this to export text nodes without cropping. `Default: false`
  /// {@macro api_client.param.query}
  @GET('/images/{key}')
  Future<dynamic> getImage(
    @Path('key') String key, {
    @Query('version') String? version,
    @Query('ids') List<String>? ids,
    @Query('scale') int? scale,
    // TODO(hodoan): enum Geometry name
    @Query('geometry') String? geometry,
    // TODO(hodoan): enum Format name
    @Query('format') String? format,
    @Query('svg_include_id') bool? svgIncludeId,
    @Query('svg_simplify_stroke') bool? svgSimplifyStroke,
    @Query('use_absolute_bounds') bool? useAbsoluteBounds,
  });

  @GET('/files/{key}/images')
  Future<dynamic> getImageFills(@Path('key') String key);
}
