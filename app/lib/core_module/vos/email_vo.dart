import 'package:sdi_pedidos/core_module/vos/value_object.dart';
import 'package:result_dart/result_dart.dart';
import 'package:string_validator/string_validator.dart';

class EmailVO extends ValueObject<String> {
  const EmailVO(super.value);

  @override
  Result<EmailVO, String> validate([Object? object]) {
    if (value.isEmpty) {
      return '$object não pode ser vazio'.toFailure();
    }

    if (!isEmail(value)) {
      return '$object inválido'.toFailure();
    }

    return Success(this);
  }
}
