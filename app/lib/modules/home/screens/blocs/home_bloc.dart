// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:sdi_pedidos/modules/home/screens/blocs/home_events.dart';
import 'package:sdi_pedidos/modules/home/screens/blocs/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final IStorage storage;

  HomeBloc({
    required this.storage,
  }) : super(InitialHomeState()) {
    on<LogoutHomeEvent>(_logout);
  }

  Future _logout(LogoutHomeEvent event, emit) async {
    emit(LoadingHomeState());

    try {
      await storage.remove("access_token");
      await storage.remove("refresh_token");
      await storage.remove("user");

      await Future.delayed(Duration(milliseconds: 500));

      emit(SuccessLogoutState());
    } catch (e) {
      emit(ErrorHomeState(message: e.toString()));
    }
  }
}
