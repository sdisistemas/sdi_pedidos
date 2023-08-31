import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:sdi_pedidos/modules/sync_data/external/sync_controller.dart';
import 'package:sdi_pedidos/modules/sync_data/repositories/sync_repository.dart';
import 'package:sdi_pedidos/modules/sync_data/screens/blocs/sync_data_bloc.dart';
import 'package:sdi_pedidos/modules/sync_data/services/sync_service.dart';

class SyncDataBinds {
  static final List<Bind> binds = [
    //SERVICES
    Bind.singleton(
      (i) => SyncService(i()),
    ),

    //CONTROLLER
    Bind.factory<ISyncController>(
      (i) => SyncController(
        syncService: i(),
      ),
    ),
    //REPOSITORIES
    Bind.factory<ISyncRepository>(
      (i) => SyncRepository(
        controller: i(),
        clientDao: i(),
      ),
    ),

    BlocBind.factory<SyncDataBloc>((i) => SyncDataBloc(
          storage: i(),
          syncRepository: i(),
        )),
  ];
}
