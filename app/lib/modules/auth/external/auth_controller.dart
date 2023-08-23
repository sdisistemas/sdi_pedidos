import 'package:sdi_pedidos/core_module/types/my_exception.dart';
import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:sdi_pedidos/modules/auth/domain/signin_params.dart';
import 'package:sdi_pedidos/modules/auth/services/auth_service_interface.dart';
import 'package:dio/dio.dart';

abstract class IAuthController {
  Future<Map<String, dynamic>> signIn(SignInParams params);
}

class AuthController implements IAuthController {
  final IAuthService service;
  final IStorage storage;

  AuthController({
    required this.service,
    required this.storage,
  });

  @override
  Future<Map<String, dynamic>> signIn(SignInParams params) async {
    final Response result = await service.login(
      params.email.value,
      params.password.value,
    );

    final statusCode = result.statusCode;

    if (statusCode == 400) {
      throw const MyException(message: 'Usuário ou senha inválidos');
    }

    if (statusCode == 404) {
      throw const MyException(message: 'Usuário não encontrado');
    }

    if (statusCode != 200) {
      throw const MyException(
        message: 'Erro ao tentar realizar login. Por favor tente novamente.',
      );
    }

    await storage.save("access_token", result.data["access_token"]);
    await storage.save("refresh_token", result.data["refresh_token"]);

    return result.data['user'];
  }
}
