import 'package:sdi_pedidos/modules/home/binds/home_binds.dart';
import 'package:sdi_pedidos/modules/home/screens/blocs/home_bloc.dart';
import 'package:sdi_pedidos/modules/home/screens/home_screen.dart';
import 'package:sdi_pedidos/modules/home/screens/main_screen.dart';
import 'package:sdi_pedidos/modules/home/screens/menu_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        ...HomeBinds.binds,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => MainScreen(),
          children: [
            ChildRoute(
              '/home',
              child: (context, args) => HomeScreen(),
              transition: TransitionType.fadeIn,
            ),
            ChildRoute(
              '/menu',
              child: (context, args) => MenuScreen(
                homeBloc: Modular.get<HomeBloc>(),
              ),
              transition: TransitionType.fadeIn,
            ),
          ],
        ),
      ];
}
