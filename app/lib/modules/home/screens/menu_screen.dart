// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:sdi_pedidos/core_module/services/themeMode/theme_mode_controller.dart';
import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:sdi_pedidos/modules/home/screens/blocs/home_bloc.dart';
import 'package:sdi_pedidos/modules/home/screens/blocs/home_events.dart';
import 'package:sdi_pedidos/modules/home/screens/blocs/home_states.dart';
import 'package:sdi_pedidos/modules/sync_data/repositories/sync_repository.dart';
import 'package:sdi_pedidos/shared/components/my_elevated_button_widget.dart';
import 'package:sdi_pedidos/shared/components/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuScreen extends StatefulWidget {
  final HomeBloc homeBloc;

  const MenuScreen({
    Key? key,
    required this.homeBloc,
  }) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();
    HomeBloc homeBloc = HomeBloc(
      storage: Modular.get<IStorage>(),
    );
    sub = widget.homeBloc.stream.listen((state) {
      if (state is SuccessLogoutState) {
        Modular.to.navigate('/auth/');
      }

      if (state is ErrorHomeState) {
        MySnackBar(
          title: 'Ops...',
          message: state.message,
          type: TypeSnack.error,
        );
      }
    });
  }

  @override
  void dispose() {
    sub.cancel();

    super.dispose();
  }

  logout() async {
    widget.homeBloc.add(LogoutHomeEvent());
  }

  void _handleUpdateData() {
    print('Atualizar dados...');
    // Aqui você pode implementar a lógica de atualização de dados ou chamar uma função do bloc, se necessário
  }

  Widget returnLabelButton(HomeStates state) {
    if (state is LoadingHomeState) {
      return const Center(
        child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    if (state is SuccessLogoutState) {
      return const Center(
        child: Icon(Icons.done_rounded),
      );
    }

    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle_rounded),
        SizedBox(width: 10),
        Text(
          'Sair',
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Menu"),
        const SizedBox(height: 10),
        BlocBuilder<HomeBloc, HomeStates>(
          bloc: widget.homeBloc,
          builder: (context, state) {
            return MyElevatedButtonWidget(
              width: 150,
              onPressed: logout,
              label: returnLabelButton(state),
            );
          },
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: ThemeModeController.appStore.changeThemeMode,
          child: const Text('Trocar Tema'),
        ),
        const SizedBox(height: 10), // Adicione um espaço entre os botões
        OutlinedButton.icon(
          icon: const Icon(Icons.update),
          label: const Text("Atualizar dados"),
          onPressed: () {
            Modular.to.navigate('/sync_data/');
          },
        ),
      ],
    );
  }
}
