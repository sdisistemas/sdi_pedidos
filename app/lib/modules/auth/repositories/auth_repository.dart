// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sdi_pedidos/core_module/types/my_exception.dart';
import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:sdi_pedidos/modules/auth/domain/signin_params.dart';
import 'package:sdi_pedidos/modules/auth/domain/user_entity.dart';
import 'package:sdi_pedidos/modules/auth/external/auth_controller.dart';
import 'package:sdi_pedidos/modules/auth/repositories/user_adapter.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

abstract class IAuthRepository {
  Future<Result<User, IMyException>> signIn(SignInParams params);
}

class AuthRepository implements IAuthRepository {
  final IAuthController controller;
  final IStorage storage;

  AuthRepository({
    required this.controller,
    required this.storage,
  });

  @override
  Future<Result<User, IMyException>> signIn(SignInParams params) async {
    try {
      final result = await controller.signIn(params);

      final user = UserAdapter.fromMap(result);

      await storage.save("user", UserAdapter.toJson(user));

      return user.toSuccess();
    } on DioException catch (e) {
      return MyException(message: e.message ?? 'Erro ao tentar realizar login')
          .toFailure();
    } on IMyException catch (e) {
      return MyException(message: e.message).toFailure();
    } catch (e) {
      return MyException(message: e.toString()).toFailure();
    }
  }
}
