import 'dart:async';

import 'package:sdi_pedidos/modules/splash/screens/blocs/splash_bloc.dart';
import 'package:sdi_pedidos/modules/splash/screens/blocs/splash_events.dart';
import 'package:sdi_pedidos/modules/splash/screens/blocs/splash_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  final SplashBloc splashBloc;

  const SplashScreen({
    Key? key,
    required this.splashBloc,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();

    init();

    sub = widget.splashBloc.stream.listen((state) {
      if (state is ErrorSplashState) {
        Modular.to.navigate('/auth/');
      }

      if (state is SuccessCheckSplashState) {
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

    widget.splashBloc.add(CheckTokenEvent());
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
