import 'package:sdi_pedidos/core_module/services/api.dart';
import 'package:sdi_pedidos/core_module/services/realm/realm_config.dart';
import 'package:sdi_pedidos/core_module/services/storage.dart';
import 'package:sdi_pedidos/core_module/services/themeMode/theme_mode_service.dart';
import 'package:sdi_pedidos/interfaces/services/api_interface.dart';
import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:sdi_pedidos/modules/auth/auth_module.dart';
import 'package:sdi_pedidos/modules/auth/services/auth_service.dart';
import 'package:sdi_pedidos/modules/auth/services/auth_service_interface.dart';
import 'package:sdi_pedidos/modules/configuration/configuration_module.dart';
import 'package:sdi_pedidos/modules/home/home_module.dart';
import 'package:sdi_pedidos/modules/splash/splash_module.dart';
import 'package:sdi_pedidos/shared/stores/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //LOCAL SECURITY STORAGE
        Bind.singleton<IStorage>((i) => Storage()),

        //API
        Bind.singleton<IApiService>((i) => Api(i())),

        //Service
        Bind.singleton<IAuthService>((i) => AuthService(i())),

        //DATABASE
        Bind.instance<Realm>(Realm(config)),

        //STORES
        Bind.singleton<AppStore>((i) => AppStore(i())),

        //THEME MODE
        Bind.factory<IThemeMode>((i) => ThemeModeService(realm: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/configuration', module: ConfigurationModule()),
      ];
}
