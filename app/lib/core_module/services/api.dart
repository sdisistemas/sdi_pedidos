import 'dart:io';

import 'package:dio/io.dart';
import 'package:sdi_pedidos/core_module/constants/constants.dart';
import 'package:sdi_pedidos/core_module/services/api_interceptor.dart';
import 'package:sdi_pedidos/interfaces/services/api_interface.dart';
import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:dio/dio.dart';

class Api implements IApiService {
  Dio api;
  IStorage storage;

  Api(this.storage) : api = Dio() {
    api.options.baseUrl = baseUrl;
    api.options.contentType = Headers.formUrlEncodedContentType;

    (api.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    final interceptor = ApiInterceptor(storage, api);
    api.interceptors.add(interceptor);
  }

  // final interceptor = ApiInterceptor();

  // final api = new Dio()
  //   ..options.baseUrl = Endpoints().BASE_URL
  //   ..options.contentType = Headers.formUrlEncodedContentType;

  @override
  Future<Response> get(String endpoint) async {
    final token = await storage.read("access_token");

    return await api.get(endpoint,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  @override
  Future<Response> post(String endpoint, dynamic data) async {
    final token = await storage.read("access_token");
    print("data: ${api.options.baseUrl}");

    return await api.post(endpoint,
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  @override
  Future put(String endpoint, dynamic data) async {
    final token = await storage.read("access_token");

    return await api.put(endpoint,
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  @override
  Future patch(String endpoint, dynamic data) async {
    final token = await storage.read("access_token");

    return await api.patch(endpoint,
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }

  @override
  Future<Response> delete(String endpoint, dynamic data) async {
    final token = await storage.read("access_token");

    return await api.delete(endpoint,
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }
}
