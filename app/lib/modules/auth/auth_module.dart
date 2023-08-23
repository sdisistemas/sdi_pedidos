import 'package:sdi_pedidos/modules/auth/external/auth_controller.dart';
import 'package:sdi_pedidos/modules/auth/repositories/auth_repository.dart';
import 'package:sdi_pedidos/modules/auth/screens/blocs/auth_bloc.dart';
import 'package:sdi_pedidos/modules/auth/screens/login_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        //Dataosource
        Bind.factory<IAuthController>(
          (i) => AuthController(
            service: i(),
            storage: i(),
          ),
        ),

        //Repository
        Bind.factory<IAuthRepository>(
          (i) => AuthRepository(
            controller: i(),
            storage: i(),
          ),
        ),

        //BLOC
        BlocBind.factory<AuthBloc>((i) => AuthBloc(repository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => LoginScreen(
            authBloc: Modular.get<AuthBloc>(),
          ),
        ),
        // ModuleRoute('/register', module: RegisterModule()),
      ];
}
