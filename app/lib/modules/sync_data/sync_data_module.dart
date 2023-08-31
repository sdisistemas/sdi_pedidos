import 'package:flutter_modular/flutter_modular.dart';
import 'package:sdi_pedidos/modules/sync_data/binds/sync_data_binds.dart';
import 'package:sdi_pedidos/modules/sync_data/screens/blocs/sync_data_bloc.dart';
import 'package:sdi_pedidos/modules/sync_data/screens/sync_data_screen.dart';

class SyncDataModule extends Module {
  @override
  List<Bind> get binds => [...SyncDataBinds.binds];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => SyncDataScreen(
            syncDataBloc: Modular.get<SyncDataBloc>(),
          ),
        ),
      ];
}
