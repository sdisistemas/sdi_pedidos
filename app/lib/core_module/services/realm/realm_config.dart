import 'package:sdi_pedidos/core_module/services/realm/model/theme_mode_model.dart';
import 'package:realm/realm.dart';

LocalConfiguration config =
    Configuration.local([ThemeModeModel.schema], initialDataCallback: (realm) {
  realm.add(ThemeModeModel('dark'));
});
