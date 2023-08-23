import 'package:sdi_pedidos/core_module/vos/value_object.dart';
import 'package:result_dart/src/result.dart';

class BoolVO extends ValueObject<bool> {
  const BoolVO(super.value);

  @override
  Result<ValueObject<bool>, String> validate([Object? object]) {
    throw UnimplementedError();
  }
}
