import 'package:sdi_pedidos/shared/stores/app_store.dart';
import 'package:sdi_pedidos/shared/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ThemeModeController {
  static ThemeMode get themeMode =>
      NavigationService.navigatorKey.currentContext!
          .watch<AppStore>((store) => store.themeMode)
          .themeMode
          .value;
  static AppStore get appStore => NavigationService.navigatorKey.currentContext!
      .watch<AppStore>((store) => store.themeMode);
}
