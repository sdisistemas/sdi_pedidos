import 'package:sdi_pedidos/core_module/vos/email_vo.dart';
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class SignInParams {
  EmailVO _email;
  TextVO _password;

  EmailVO get email => _email;
  void setEmail(String value) => _email = EmailVO(value);

  TextVO get password => _password;
  void setPasswod(String value) => _password = TextVO(value);

  SignInParams({
    required String email,
    required String password,
  })  : _email = EmailVO(email),
        _password = TextVO(password);
}
