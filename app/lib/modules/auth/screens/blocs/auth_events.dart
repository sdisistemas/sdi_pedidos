import 'package:sdi_pedidos/modules/auth/domain/signin_params.dart';

abstract class AuthEvents {}

class SigninAuthEvent extends AuthEvents {
  final SignInParams params;

  SigninAuthEvent({
    required this.params,
  });
}
