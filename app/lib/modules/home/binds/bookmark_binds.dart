// import 'package:sdi_pedidos/modules/bookmark/external/bookmark_controller.dart';
// import 'package:sdi_pedidos/modules/bookmark/repositories/bookmark_repository.dart';
// import 'package:sdi_pedidos/modules/bookmark/screens/blocs/bookmark_bloc.dart';
// import 'package:sdi_pedidos/modules/bookmark/services/bookmark/bookmark_service.dart';
// import 'package:sdi_pedidos/modules/bookmark/services/bookmark/bookmark_service_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class BookMarkBinds {
  static final List<Bind> binds = [
    // //SERVICES
    // Bind.singleton<IBookmarkService>((i) => BookmarkService(i(), i())),

    // //CONTROLLERS
    // Bind.factory<IBookMarkController>(
    //   (i) => BookMarkController(service: i()),
    // ),

    // //REPOSITORIES
    // Bind.factory<IBookMarkRepository>(
    //   (i) => BookMarkRepository(controller: i()),
    // ),

    // //BLOCS
    // BlocBind.factory<BookMarkBloc>(
    //   (i) => BookMarkBloc(repository: i()),
    // ),
  ];
}
