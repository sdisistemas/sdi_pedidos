import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'package:sdi_pedidos/app_module.dart';
import 'package:sdi_pedidos/app_widget.dart';

void main() {
  return runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
