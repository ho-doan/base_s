import 'dart:io';

import 'package:dio/dio.dart';

import '../../models/model.dart';

Future<FigmaFile?> fetchFile(String key, String token) async {
  final headers = {'X-Figma-Token': token};
  final dio = Dio();
  final response = await dio.request<dynamic>(
    'https://api.figma.com/v1/files/$key',
    options: Options(
      method: 'GET',
      headers: headers,
    ),
  );

  if (response.statusCode == 200) {
    return FigmaFile.fromJson(response.data);
  } else {
    stdout.writeln(response.statusMessage);
    return null;
  }
}

Future<List<ImgResult>> fetchIcons(String key, String token, String ids) async {
  final headers = {'X-Figma-Token': token};
  final dio = Dio();
  dio.options.queryParameters = {
    'ids': ids,
    'format': 'svg',
    'use_absolute_bounds': true,
  };

  final response = await dio.request<dynamic>(
    'https://api.figma.com/v1/images/$key',
    options: Options(
      method: 'GET',
      headers: headers,
    ),
  );

  if (response.statusCode == 200) {
    final imgLst = FigmaImageResponse.fromJson(response.data)
        .images
        ?.entries
        .map((e) => ImgResult(e.key, e.value))
        .toList();
    return imgLst ?? <ImgResult>[];
  } else {
    stdout.writeln(response.statusMessage);
    return [];
  }
}

Future<List<ImgResult>> fetchImages(String key, String token) async {
  final headers = {'X-Figma-Token': token};
  final dio = Dio();
  final response = await dio.request<dynamic>(
    'https://api.figma.com/v1/files/$key/images',
    options: Options(
      method: 'GET',
      headers: headers,
    ),
  );

  if (response.statusCode == 200) {
    final imgLst = FigmaImageResponse.fromJson(response.data)
        .meta
        ?.images
        ?.entries
        .map((e) => ImgResult(e.key, e.value))
        .toList();
    return imgLst ?? <ImgResult>[];
  } else {
    stdout.writeln(response.statusMessage);
    return [];
  }
}

Future<List<int>> download(String image) async {
  final dio = Dio();
  final response = await dio.get<dynamic>(
    image,
    onReceiveProgress: (count, total) {
      if (total != -1) {
        stdout.writeln(
          'Downloading... ${(count / total * 100).toStringAsFixed(0)}%',
        );
      }
    },
    options: Options(
      responseType: ResponseType.bytes,
      followRedirects: false,
      validateStatus: (status) {
        return (status ?? 0) < 500;
      },
    ),
  );

  if (response.statusCode == 200) {
    return response.data;
  } else {
    stdout.writeln(response.statusMessage);
    return [];
  }
}
