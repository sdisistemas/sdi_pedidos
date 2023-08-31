import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sdi_pedidos/core_module/types/my_exception.dart';
import 'package:sdi_pedidos/entities/adapters/client_adapter.dart';
import 'package:sdi_pedidos/entities/client.dart';
import 'package:sdi_pedidos/interfaces/services/database/client_interface.dart';
import 'package:sdi_pedidos/modules/sync_data/domain/sync_params.dart';
import 'package:sdi_pedidos/modules/sync_data/external/sync_controller.dart';

abstract class ISyncRepository {
  Future<Result<List<Client>, IMyException>> syncAllClients(
      SyncAllClientsParams params);
  Future<Result<void, IMyException>> syncSingleClient(String codCliente);
}

class SyncRepository implements ISyncRepository {
  final ISyncController controller;
  final IClient clientDao;

  SyncRepository({
    required this.controller,
    required this.clientDao,
  });

  @override
  Future<Result<List<Client>, IMyException>> syncAllClients(
      SyncAllClientsParams params) async {
    try {
      final result = await controller.syncAllClients(params);

      final List<Client> clientsFromApi = ClientAdapter.fromMapList(result);

      final resultCreatedClientes = await clientDao.create(clientsFromApi);

      if (resultCreatedClientes) {
        return Success(clientsFromApi);
      } else {
        return Failure(const MyException(message: "Erro ao criar clientes")
            .toFailure() as IMyException);
      }
    } on DioException catch (e) {
      return MyException(
              message: e.message ?? 'Erro ao buscar todos os clientes')
          .toFailure();
    } on IMyException catch (e) {
      return MyException(message: e.message).toFailure();
    } catch (e) {
      print(e);
      return MyException(message: e.toString()).toFailure();
    }
  }

  @override
  Future<Result<void, IMyException>> syncSingleClient(String codCliente) {
    // TODO: implement syncSingleClient
    throw UnimplementedError();
  }
}
