import 'package:sdi_pedidos/core_module/types/entity.dart';
import 'package:sdi_pedidos/core_module/vos/bool_vo.dart';
import 'package:sdi_pedidos/core_module/vos/date_time_vo.dart';
import 'package:sdi_pedidos/core_module/vos/email_vo.dart';
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class User extends Entity {
  DateTimeVO _createdAt;
  DateTimeVO _updatedAt;
  DateTimeVO? _deletedAt;
  BoolVO _active;
  TextVO _name;
  TextVO? _avatar;
  TextVO? _cpf;
  EmailVO _email;
  TextVO _password;
  DateTimeVO? _emailVerifiedAt;
  TextVO? _phone;
  DateTimeVO? _phoneVerifiedAt;
  List<TypeUserRole> _roles;
  TextVO? _addressId;

  DateTimeVO get createdAt => _createdAt;
  void setCreatedAt(DateTime value) => _createdAt = DateTimeVO(value);

  DateTimeVO get updatedAt => _updatedAt;
  void setUpdateddAt(DateTime value) => _updatedAt = DateTimeVO(value);

  DateTimeVO get deletedAt => _deletedAt ?? DateTimeVO(DateTime.now());
  void setDeleteddAt(DateTime value) => _deletedAt = DateTimeVO(value);

  BoolVO get active => _active;
  void setActive(bool value) => _active = BoolVO(value);

  TextVO get name => _name;
  void setName(String value) => _name = TextVO(value);

  TextVO? get avatar => _avatar;
  void setAvatar(String value) => _avatar = TextVO(value);

  TextVO? get cpf => _cpf;
  void setCPF(String value) => _cpf = TextVO(value);

  EmailVO get email => _email;
  void setEmail(String value) => _email = EmailVO(value);

  TextVO get password => _password;
  void setPassword(String value) => _password = TextVO(value);

  DateTimeVO? get emailVerifiedAt => _emailVerifiedAt;
  void setEmailVerifiedAt(DateTime value) =>
      _emailVerifiedAt = DateTimeVO(value);

  TextVO? get phone => _phone;
  void setPhone(String value) => _phone = TextVO(value);

  DateTimeVO? get phoneVerifiedAt => _phoneVerifiedAt;
  void setPhoneVerifiedAt(DateTime value) =>
      _phoneVerifiedAt = DateTimeVO(value);

  List<TypeUserRole> get roles => _roles;
  void setTypeUserRole(List<TypeUserRole> value) => _roles = value;

  TextVO? get addressId => _addressId;
  void setAddressId(String value) => _addressId = TextVO(value);

  User({
    required super.id,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    required bool active,
    required String name,
    String? avatar,
    String? cpf,
    required String email,
    required String password,
    DateTime? emailVerifiedAt,
    String? phone,
    DateTime? phoneVerifiedAt,
    required List<TypeUserRole> roles,
    String? addressId,
  })  : _createdAt = DateTimeVO(createdAt),
        _updatedAt = DateTimeVO(updatedAt),
        _active = BoolVO(active),
        _name = TextVO(name),
        _email = EmailVO(email),
        _password = TextVO(password),
        _roles = roles;
}

enum TypeUserRole {
  APP_USER,
  ADMIN,
}

extension TypeUserRoleExtension on TypeUserRole {
  String toMap() {
    return this.toString().split('.').last;
  }

  static TypeUserRole fromMap(String value) {
    switch (value) {
      case 'APP_USER':
        return TypeUserRole.APP_USER;
      case 'ADMIN':
        return TypeUserRole.ADMIN;
      default:
        throw ArgumentError('Invalid TypeUserRole value: $value');
    }
  }
}
