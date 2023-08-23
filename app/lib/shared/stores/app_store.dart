import 'package:sdi_pedidos/core_module/services/themeMode/theme_mode_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStore {
  final IThemeMode _service;

  AppStore(this._service) {
    init();
  }

  final themeMode = ValueNotifier(ThemeMode.dark);

  void changeThemeMode() {
    final mode = _service.getThemeMode().themeModeName == ThemeMode.dark.name
        ? ThemeMode.light
        : ThemeMode.dark;

    themeMode.value = mode;

    saveThemeMode();

    //Change color of statusbar icons
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            mode == ThemeMode.dark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  void init() {
    final model = _service.getThemeMode();

    themeMode.value = _getThemeModeByName(model.themeModeName);
  }

  Future saveThemeMode() async {
    await _service.saveThemeMode(themeMode.value.name);
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
