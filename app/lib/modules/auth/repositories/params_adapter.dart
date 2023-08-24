import 'dart:convert';

import 'package:sdi_pedidos/modules/auth/domain/signin_params.dart';

class ParamsAdapter {
  static String toJson(SignInParams params) {
    return jsonEncode(
      '{user: ${params.user.value}, password: ${params.password.value}}',
    );
  }
}
