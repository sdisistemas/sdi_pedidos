import 'dart:convert';

import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ApiInterceptor extends Interceptor {
  final IStorage storage;
  final Dio api;

  ApiInterceptor(this.storage, this.api);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await storage.read('accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';

    handler.next(options);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      final String? access_token = await storage.read('accessToken');
      final String? refresh_token = await storage.read('refreshToken');

      if (access_token != null && !isTokenExpired(access_token)) {
        final newOptions = Options(
          method: error.requestOptions.method,
          headers: {
            ...error.requestOptions.headers,
            'Authorization': 'Bearer $access_token',
          },
          contentType: error.requestOptions.contentType,
        );

        final response = await api.request<dynamic>(
          error.requestOptions.path,
          data: error.requestOptions.data,
          queryParameters: error.requestOptions.queryParameters,
          options: newOptions,
        );
        handler.resolve(response);
        return;
      } else if (refresh_token != null && !isTokenExpired(refresh_token)) {
        await refreshToken();
        final newOptions = Options(
          method: error.requestOptions.method,
          headers: {
            ...error.requestOptions.headers,
            'Authorization': 'Bearer $access_token',
          },
          contentType: error.requestOptions.contentType,
        );

        final response = await api.request<dynamic>(
          error.requestOptions.path,
          data: error.requestOptions.data,
          queryParameters: error.requestOptions.queryParameters,
          options: newOptions,
        );
        handler.resolve(response);
        return;
      } else {
        logout();
        return;
      }
    }

    handler.next(error);
  }

  bool isTokenExpired(String _token) {
    DateTime? expiryDate = Jwt.getExpiryDate(_token);
    bool isExpired = expiryDate!.compareTo(DateTime.now()) < 0;
    return isExpired;
  }

  void logout() async {
    await storage.remove("accessToken");
    await storage.remove("refreshToken");
    await storage.remove("user");

    Modular.to.pushReplacementNamed('/');
  }

  Future<void> refreshToken() async {
    final refreshToken = await this.storage.read('refreshToken');

    if (refreshToken != null && !isTokenExpired(refreshToken)) {
      final response = await this
          .api
          .post('/auth/refresh', data: {'refreshToken': refreshToken});
      print("teve que entrar no refresh");
      print("Refresh token isExpired: ${isTokenExpired(refreshToken)}");
      print("response newAcessToken: $response");
      if (response.statusCode == 200) {
        await storage.save("accessToken", response.data["accessToken"]);
        await storage.save("refreshToken", response.data["refreshToken"]);
        await storage.save("user", json.encode(response.data["user"]));
      }
    }
  }
}
