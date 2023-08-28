import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/entities/client.dart';

abstract class IClient {
  Future<dynamic> create(List<Client> clients);
  Future<Client?> getOne(IntVO codCliente);
  Future<List<Client>> getAll();
  Future<dynamic> update(Client client);
  Future<dynamic> delete(IntVO codCliente);
  Future<dynamic> deleteAll();
}
