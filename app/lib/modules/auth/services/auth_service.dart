import 'package:sdi_pedidos/interfaces/services/api_interface.dart';
import 'package:sdi_pedidos/modules/auth/services/auth_service_interface.dart';
import 'package:dio/dio.dart';

import '../../../core_module/constants/constants.dart';

class AuthService implements IAuthService {
  final IApiService api;

  AuthService(this.api);

  @override
  Future getProfile() async {
    try {
      return await api.get(profileEndpoint);
    } catch (e) {}
  }

  @override
  Future login(String user, String password) async {
    try {
      final data = {"user": user, "password": password};

      return await api.post(loginAdminEndpoint, data);
    } on DioException catch (e) {
      print("Error: ${e}");
      return e.response;
    }
  }

  @override
  Future refreshToken(String token) async {
    try {
      final data = {"refresh_token": token};
      return await api.post(refreshTokenEndpoint, data);
    } catch (e) {}
  }

  @override
  Future register(String name, String email, String password) async {
    try {
      final data = {"name": name, "email": email, "password": password};
      return await api.post(registerAdminEndpoint, data);
    } on DioException catch (e) {
      return e.response;
    }
  }
}
