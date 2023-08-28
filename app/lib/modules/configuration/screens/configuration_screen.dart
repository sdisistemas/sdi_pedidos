import 'dart:async';

import 'package:sdi_pedidos/modules/configuration/screens/blocs/configuration_bloc.dart';
import 'package:sdi_pedidos/modules/configuration/screens/blocs/configuration_events.dart';
import 'package:sdi_pedidos/modules/configuration/screens/blocs/configuration_states.dart';
import 'package:sdi_pedidos/shared/components/my_snackbar.dart';
import 'package:flutter/material.dart';

class ConfigurationScreen extends StatefulWidget {
  final ConfigurationBloc configurationBloc;

  const ConfigurationScreen({
    Key? key,
    required this.configurationBloc,
  }) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  late StreamSubscription sub;
  final TextEditingController _internalIPController = TextEditingController();
  final TextEditingController _externalIPController = TextEditingController();
  final TextEditingController _portController = TextEditingController();

  String _selectedIP = 'internal'; // Default to internal
  String _initialInternalIP = '';
  String _initialExternalIP = '';
  String _initialSelectedIP = 'internal';
  String _initialPort = '';

  @override
  void initState() {
    super.initState();

    // Initial load of the configuration
    widget.configurationBloc.add(LoadConfigurationEvent());

    sub = widget.configurationBloc.stream.listen((state) {
      if (state is ErrorConfigurationState) {
        MySnackBar(
          title: 'Ops..',
          message: state.message,
          type: TypeSnack.error,
        );
      }

      if (state is SuccessSaveConfigurationState) {
        MySnackBar(
          title: 'Sucesso',
          message: 'Configurações salvas com sucesso.',
          type: TypeSnack.success,
        );
      }

      if (state is LoadedConfigurationState) {
        _internalIPController.text = state.internalIP ?? '';
        _externalIPController.text = state.externalIP ?? '';
        _portController.text = state.port ?? '';
        _selectedIP = state.selectedIP ?? 'internal';
        _initialInternalIP = state.internalIP ?? '';
        _initialExternalIP = state.externalIP ?? '';
        _initialPort = (state.port ?? '').trim();
      }
    });
  }

  @override
  void dispose() {
    sub.cancel();
    _internalIPController.dispose();
    _externalIPController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _internalIPController,
              decoration: const InputDecoration(labelText: 'IP Interno'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _externalIPController,
              decoration: const InputDecoration(labelText: 'IP Externo'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _portController,
              decoration: const InputDecoration(labelText: 'Porta de Acesso'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedIP,
              items: const [
                DropdownMenuItem(value: 'internal', child: Text('IP Interno')),
                DropdownMenuItem(value: 'external', child: Text('IP Externo')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedIP = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveConfiguration,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveConfiguration() {
    final internalIP = _internalIPController.text.trim();
    final externalIP = _externalIPController.text.trim();
    final port = _portController.text.trim();

    // Validação de campos vazios
    if (internalIP.isEmpty || externalIP.isEmpty || port.isEmpty) {
      MySnackBar(
        title: 'Erro',
        message:
            'Os campos IP Interno, IP Externo e Porta não podem estar vazios.',
        type: TypeSnack.error,
      );
      return;
    }

    // Validação da porta
    final portNumber = int.tryParse(port);
    if (portNumber == null || portNumber <= 0 || portNumber > 65535) {
      MySnackBar(
        title: 'Erro',
        message: 'Por favor, insira uma porta válida (1-65535).',
        type: TypeSnack.error,
      );
      return;
    }

    if (internalIP == _initialInternalIP &&
        externalIP == _initialExternalIP &&
        _selectedIP == _initialSelectedIP &&
        port == _initialPort) {
      MySnackBar(
        title: 'Aviso',
        message: 'Nenhuma modificação detectada.',
        type: TypeSnack.warning,
      );
      return;
    }

    widget.configurationBloc.add(SaveConfigurationEvent(
        internalIP: internalIP,
        externalIP: externalIP,
        port: port,
        selectedIP: _selectedIP));
  }
}
