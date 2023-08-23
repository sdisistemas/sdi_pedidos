import 'package:sdi_pedidos/modules/home/screens/blocs/home_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class HomeBinds {
  static final List<Bind> binds = [
    BlocBind.factory<HomeBloc>((i) => HomeBloc(storage: i())),
  ];
}
