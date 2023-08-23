import 'package:sdi_pedidos/modules/auth/repositories/auth_repository.dart';
import 'package:sdi_pedidos/modules/auth/screens/blocs/auth_events.dart';
import 'package:sdi_pedidos/modules/auth/screens/blocs/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final IAuthRepository repository;

  AuthBloc({
    required this.repository,
  }) : super(InitialAuthState()) {
    on<SigninAuthEvent>(signin);
  }

  Future signin(SigninAuthEvent event, emit) async {
    emit(LoadingAuthState());

    final result = await repository.signIn(event.params);

    result.fold(
      (success) => emit(SucessSigninAuthState(user: success)),
      (failure) => emit(ErrorSigninAuthState(message: failure.message)),
    );
  }
}
