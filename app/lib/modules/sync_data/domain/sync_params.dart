// Para atualizar todos os clientes de uma empresa
import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class SyncAllClientsParams {
  IntVO _codEmpresa;

  IntVO get codEmpresa => _codEmpresa;
  void setCodEmpresa(int value) => _codEmpresa = IntVO(value);

  SyncAllClientsParams({
    required int codEmpresa,
  }) : _codEmpresa = IntVO(codEmpresa);
}

// Para atualizar um único cliente
class SyncSingleClientParams {
  IntVO _codCliente;

  IntVO get codCliente => _codCliente;
  void setCodCliente(int value) => _codCliente = IntVO(value);

  SyncSingleClientParams({
    required int codCliente,
  }) : _codCliente = IntVO(codCliente);
}
