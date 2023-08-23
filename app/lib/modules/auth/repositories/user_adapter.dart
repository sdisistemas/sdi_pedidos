import 'dart:convert';

import 'package:sdi_pedidos/core_module/vos/id_vo.dart';
import 'package:sdi_pedidos/modules/auth/domain/user_entity.dart';

class UserAdapter {
  static User empty() {
    return User(
      id: IdVO(''),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      active: false,
      name: '',
      email: 'lucas',
      password: '123',
      roles: [],
    );
  }

  static Map<String, dynamic> toMap(User user) {
    return {
      'id': user.id.value,
      'createdAt': user.createdAt.value.toString(),
      'updatedAt': user.updatedAt.value.toString(),
      'deletedAt': user.deletedAt.value.toString(),
      'active': user.active.value,
      'name': user.name.value,
      if (user.avatar?.value != null) 'avatar': user.avatar?.value,
      if (user.cpf?.value != null) 'cpf': user.cpf?.value,
      'email': user.email.value,
      if (user.emailVerifiedAt?.value != null)
        'emailVerifiedAt': user.emailVerifiedAt?.value.toString(),
      if (user.phone?.value != null) 'phone': user.phone?.value,
      if (user.phoneVerifiedAt?.value != null)
        'phoneVerifiedAt': user.phoneVerifiedAt?.value.toString(),
      'roles': user.roles.map((x) => x.toMap()).toList(),
      if (user.addressId?.value != null) 'addressId': user.addressId?.value,
    };
  }

  static String toJson(User user) => jsonEncode(toMap(user));

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: IdVO(map['id']),
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'].toString())
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'].toString())
          : DateTime.now(),
      deletedAt: map['deletedAt'] != null
          ? DateTime.parse(map['deletedAt'].toString())
          : null,
      active: map['active'] as bool,
      name: map['name'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      email: map['email'] as String,
      password: map['password'] ?? '',
      emailVerifiedAt: map['emailVerifiedAt'] != null
          ? DateTime.parse(map['emailVerifiedAt'].toString())
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      phoneVerifiedAt: map['phoneVerifiedAt'] != null
          ? DateTime.parse(map['phoneVerifiedAt'].toString())
          : null,
      roles: (map['roles'] as List<dynamic>)
          .map((role) => TypeUserRoleExtension.fromMap(role as String))
          .toList(),
      addressId: map['addressId'] != null ? map['addressId'] as String : null,
    );
  }
}
