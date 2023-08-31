import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdi_pedidos/modules/sync_data/screens/blocs/sync_data_bloc.dart';
import 'package:sdi_pedidos/modules/sync_data/screens/blocs/sync_data_events.dart';
import 'package:sdi_pedidos/modules/sync_data/screens/blocs/sync_data_states.dart';
import 'package:sdi_pedidos/shared/components/my_snackbar.dart';
import 'package:sdi_pedidos/widgets/loadingModal.dart';

class SyncDataScreen extends StatefulWidget {
  final SyncDataBloc syncDataBloc;
  const SyncDataScreen({
    Key? key,
    required this.syncDataBloc,
  }) : super(key: key);

  @override
  State<SyncDataScreen> createState() => _SyncDataScreenState();
}

class _SyncDataScreenState extends State<SyncDataScreen> {
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();
    sub = widget.syncDataBloc.stream.listen((state) {
      if (state is SuccessSyncDataState) {
        MySnackBar(
          title: 'Sucesso',
          message: 'Dados atualizados com sucesso.',
          type: TypeSnack.success,
        );
      }

      if (state is ErrorSyncDataState) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SyncDataBloc, SyncDataStates>(
        bloc: widget.syncDataBloc,
        builder: (context, state) {
          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Atualização de dados do APP"),
                    const SizedBox(height: 10),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.system_update_alt_outlined),
                      label: const Text("Atualizar dados"),
                      onPressed: () {
                        widget.syncDataBloc.add(SyncDataEvent());
                        print("Atualizar dados");
                      },
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.system_update_alt_outlined),
                      label: const Text("Atualizar Fotos"),
                      onPressed: () {
                        // Implemente a lógica de atualização de fotos aqui
                        print("Atualizar fotos");
                      },
                    ),
                  ],
                ),
              ),
              if (state is LoadingSyncDataState)
                LoadingModal(), // Mostre o widget de carregamento quando o estado for SyncDataLoadingState
            ],
          );
        },
      ),
    );
  }
}
