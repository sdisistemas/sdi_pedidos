abstract class ISyncService {
  Future<dynamic> syncAllClients(int codEmpresa);
  Future<dynamic> syncSingleClient(int codCliente);
}
