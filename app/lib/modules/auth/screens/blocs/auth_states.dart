import 'package:sdi_pedidos/modules/auth/domain/user_entity.dart';

abstract class AuthStates {}

class InitialAuthState extends AuthStates {}

class LoadingAuthState extends AuthStates {}

class SucessSigninAuthState extends AuthStates {
  final User user;

  SucessSigninAuthState({
    required this.user,
  });
}

class ErrorSigninAuthState extends AuthStates {
  final String message;

  ErrorSigninAuthState({
    required this.message,
  });
}
