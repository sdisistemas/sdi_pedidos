import 'package:sdi_pedidos/core_module/types/entity.dart';
import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class User extends Entity {
  IntVO _cod_empresa;
  TextVO _user;
  TextVO _password;

  IntVO? get cod_empresa => _cod_empresa;
  void setAvatar(int value) => _cod_empresa = IntVO(value);

  TextVO get user => _user;
  void setUser(String value) => _user = TextVO(value);

  TextVO get password => _password;
  void setPassword(String value) => _password = TextVO(value);

  User({
    required super.id,
    required int cod_empresa,
    required String user,
    required String password,
  })  : _cod_empresa = IntVO(cod_empresa),
        _user = TextVO(user),
        _password = TextVO(password);
}
