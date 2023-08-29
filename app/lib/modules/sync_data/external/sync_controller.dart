import 'package:dio/dio.dart';
import 'package:sdi_pedidos/modules/sync_data/domain/sync_params.dart';
import 'package:sdi_pedidos/modules/sync_data/services/sync_service_interface.dart';

abstract class ISyncController {
  Future<List<Map<String, dynamic>>> syncAllClients(
      SyncAllClientsParams params);
  Future<Map<String, dynamic>> syncSingleClient(SyncSingleClientParams params);
}

class SyncController {
  final ISyncService syncService;

  SyncController(this.syncService);

  Future<List<Map<String, dynamic>>> syncAllClients(
      SyncAllClientsParams params) async {
    try {
      final Response result =
          await syncService.syncAllClients(params.codEmpresa.value);
      print(result.statusCode);
      final statusCode = result.statusCode;

      final List<Map<String, dynamic>> clientsList = result.data;
      print("clientsList ${clientsList}");

      return clientsList;
    } catch (e) {
      throw Exception("Erro ao sincronizar todos os clientes: $e");
    }
  }

  Future<Map<String, dynamic>> syncSingleClient(
      SyncSingleClientParams params) async {
    try {
      final Response result =
          await syncService.syncSingleClient(params.codCliente.value);
      print(result.statusCode);

      final statusCode = result.statusCode;
      return result.data;
    } catch (e) {
      throw Exception("Erro ao sincronizar o cliente: $e");
    }
  }
}
