import 'package:sdi_pedidos/modules/configuration/screens/blocs/configuration_bloc.dart';
import 'package:sdi_pedidos/modules/configuration/screens/configuration_screen.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ConfigurationModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.factory(
          (i) => ConfigurationBloc(
            storage: i(),
            service: i(),
            api: i(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => ConfigurationScreen(
            configurationBloc: Modular.get<ConfigurationBloc>(),
          ),
        ),
      ];
}
