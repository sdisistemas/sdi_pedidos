abstract class ISyncService {
  Future<dynamic> syncAllClients(String codEmpresa);
  Future<dynamic> syncSingleClient(String codCliente);
}
