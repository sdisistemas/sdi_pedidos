import 'dart:convert';

import 'package:sdi_pedidos/modules/auth/domain/signin_params.dart';

class ParamsAdapter {
  static String toJson(SignInParams params) {
    return jsonEncode(
      '{email: ${params.email.value}, password: ${params.password.value}}',
    );
  }
}
