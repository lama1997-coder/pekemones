import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:peko_application/data/constants.dart';
import 'package:peko_application/data/exception.dart';

abstract class RemoteDataSource {
  Future<Response> httpRequest({ required String url,
    bool withUTCUnix = false,
    bool isAuth = false,
    bool withToken = false,
    String methodType = "get",
    dynamic bodyData,});
}

class RemoteDataSourceImp extends RemoteDataSource {
  final Dio client;
  RemoteDataSourceImp({required this.client});
  Future<Response> httpRequest({
    required String url,
    bool withUTCUnix = false,
    bool isAuth = false,
    bool withToken = false,
    String methodType = "get",
    dynamic bodyData,
  }) async {
    
    try {
      final response = await client.get("${Urls.baseUrl}/$url");
      log("in get method ...${response}");
      log("in get method ......${jsonEncode(response)}");
      if (response.statusCode == 200) {
        return response;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint('DioError: ${e.response?.statusMessage}');
      } else {
        throw ServerException();
      }
    }
    return await client.get(Urls.baseUrl);
  }
}
