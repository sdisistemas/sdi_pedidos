import 'package:sdi_pedidos/modules/splash/screens/blocs/splash_bloc.dart';
import 'package:sdi_pedidos/modules/splash/screens/splash_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.factory(
          (i) => SplashBloc(
            storage: i(),
            service: i(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => SplashScreen(
            splashBloc: Modular.get<SplashBloc>(),
          ),
        ),
      ];
}
