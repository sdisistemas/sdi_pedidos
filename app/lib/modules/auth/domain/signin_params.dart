import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class SignInParams {
  TextVO _user;
  TextVO _password;

  TextVO get user => _user;
  void setUser(String value) => _user = TextVO(value);

  TextVO get password => _password;
  void setPasswod(String value) => _password = TextVO(value);

  SignInParams({
    required String user,
    required String password,
  })  : _user = TextVO(user),
        _password = TextVO(password);
}
