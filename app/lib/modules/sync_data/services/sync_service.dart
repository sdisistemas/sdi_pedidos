import 'package:sdi_pedidos/interfaces/services/api_interface.dart';
import 'package:sdi_pedidos/modules/sync_data/services/sync_service_interface.dart';
import '../../../core_module/constants/constants.dart';

class SyncService implements ISyncService {
  final IApiService api;

  SyncService(this.api);

  @override
  Future syncAllClients(int codEmpresa) async {
    try {
      // Concatenar codEmpresa ao endpoint
      final fullEndpoint = "$getAllclientsEndpoint/$codEmpresa";

      // Chame o método do repositório para obter dados da API
      final clientsFromApi = await api.get(fullEndpoint);

      // print("clientsFromApi: ${clientsFromApi}");

      return clientsFromApi;
    } catch (e) {
      // Tratamento de erros
      print("Erro ao sincronizar todos os clientes: $e");
    }
  }

  @override
  Future syncSingleClient(int codCliente) async {
    try {
      // Chame o método do repositório para obter dados da API
      // final clientFromApi =
      //     await _syncRepository.getSingleClientFromApi(codCliente);

      // Chame o método do repositório para atualizar esse cliente no banco de dados local
      // await _syncRepository.saveSingleClientToDb(clientFromApi);
    } catch (e) {
      // Tratamento de erros
      print("Erro ao sincronizar um único cliente: $e");
    }
  }
}
