import 'dart:async';

import 'package:sdi_pedidos/modules/configuration/screens/blocs/configuration_bloc.dart';
import 'package:sdi_pedidos/modules/configuration/screens/blocs/configuration_events.dart';
import 'package:sdi_pedidos/modules/configuration/screens/blocs/configuration_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

  @override
  void initState() {
    super.initState();

    init();

    sub = widget.configurationBloc.stream.listen((state) {
      if (state is ErrorConfigurationState) {
        Modular.to.navigate('/auth/');
      }

      if (state is SuccessCheckConfigurationState) {
        Modular.to.navigate('/home/');
      }
    });
  }

  @override
  void dispose() {
    sub.cancel();

    super.dispose();
  }

  Future init() async {
    await Future.delayed(const Duration(seconds: 1));

    widget.configurationBloc.add(CheckTokenEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SDI Pedidos'),
      ),
    );
  }
}
