import 'dart:convert';

import 'package:sdi_pedidos/core_module/vos/id_vo.dart';
import 'package:sdi_pedidos/modules/auth/domain/user_entity.dart';

class UserAdapter {
  static User empty() {
    return User(
      id: IdVO(''),
      cod_empresa: 1,
      user: 'lucas',
      password: '123',
    );
  }

  static Map<String, dynamic> toMap(User user) {
    return {
      'id': user.id.value,
      'email': user.user.value,
      if (user.cod_empresa?.value != null)
        'cod_empresa': user.cod_empresa?.value.toString(),
    };
  }

  static String toJson(User user) => jsonEncode(toMap(user));

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: IdVO(map['id'].toString()),
      user: map['user'] as String,
      password: map['password'] ?? '',
      cod_empresa: map['cod_empresa'],
    );
  }
}
