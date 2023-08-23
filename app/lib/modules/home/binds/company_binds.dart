// import 'package:sdi_pedidos/modules/bookmark/services/bookmark/bookmark_service.dart';
// import 'package:sdi_pedidos/modules/company/external/company_controller.dart';
// import 'package:sdi_pedidos/modules/company/repositories/company_repository.dart';
// import 'package:sdi_pedidos/modules/company/screens/blocs/company_bloc.dart';
// import 'package:sdi_pedidos/modules/company/services/company_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class CompanyBinds {
  static final List<Bind> binds = [
    // //SERVICES
    // Bind.singleton(
    //   (i) => CompanyService(i()),
    // ),
    // Bind.singleton(
    //   (i) => BookmarkService(i(), i()),
    // ),

    // //CONTROLLERS
    // Bind.factory<ICompanyController>((i) => CompanyController(service: i())),

    // //REPOSITORIES
    // Bind.factory<ICompanyRepository>(
    //   (i) => CompanyRepository(controller: i()),
    // ),

    // //BLOCS
    // BlocBind.factory<CompanyBloc>(
    //   (i) => CompanyBloc(repository: i()),
    // ),
  ];
}
