// Para atualizar todos os clientes de uma empresa
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class SyncAllClientsParams {
  TextVO _codEmpresa;

  TextVO get codEmpresa => _codEmpresa;
  void setCodEmpresa(String value) => _codEmpresa = TextVO(value);

  SyncAllClientsParams({
    required String codEmpresa,
  }) : _codEmpresa = TextVO(codEmpresa);
}

// Para atualizar um único cliente
class SyncSingleClientParams {
  TextVO _codCliente;

  TextVO get codCliente => _codCliente;
  void setCodCliente(String value) => _codCliente = TextVO(value);

  SyncSingleClientParams({
    required String codCliente,
  }) : _codCliente = TextVO(codCliente);
}
