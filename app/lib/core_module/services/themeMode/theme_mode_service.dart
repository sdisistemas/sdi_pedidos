import 'package:sdi_pedidos/core_module/services/realm/model/theme_mode_model.dart';
import 'package:realm/realm.dart';

abstract class IThemeMode {
  ThemeModeModel getThemeMode();
  Future saveThemeMode(String themeModeName);
}

class ThemeModeService implements IThemeMode {
  final Realm realm;

  ThemeModeService({
    required this.realm,
  });

  @override
  ThemeModeModel getThemeMode() {
    return realm.all<ThemeModeModel>().first;
  }

  @override
  Future saveThemeMode(String themeModeName) async {
    final model = getThemeMode();

    realm.write(() {
      model.themeModeName = themeModeName;
    });
  }
}
