import 'dart:async';

import 'package:sdi_pedidos/modules/auth/domain/signin_params.dart';
import 'package:sdi_pedidos/modules/auth/domain/user_entity.dart';
import 'package:sdi_pedidos/modules/auth/repositories/user_adapter.dart';
import 'package:sdi_pedidos/modules/auth/screens/blocs/auth_bloc.dart';
import 'package:sdi_pedidos/modules/auth/screens/blocs/auth_events.dart';
import 'package:sdi_pedidos/modules/auth/screens/blocs/auth_states.dart';
import 'package:sdi_pedidos/shared/components/my_elevated_button_widget.dart';
import 'package:sdi_pedidos/shared/components/my_input_widget.dart';
import 'package:sdi_pedidos/shared/components/my_snackbar.dart';
import 'package:sdi_pedidos/shared/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatefulWidget {
  final AuthBloc authBloc;

  LoginScreen({
    Key? key,
    required this.authBloc,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _showPassword = false;

  late User user;

  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();

    user = UserAdapter.empty();

    sub = widget.authBloc.stream.listen((state) {
      if (state is ErrorSigninAuthState) {
        MySnackBar(
          title: 'Ops..',
          message: state.message,
          type: TypeSnack.error,
        );
      }

      if (state is SucessSigninAuthState) {
        Modular.to.pushReplacementNamed('/home/');
      }
    });
  }

  @override
  void dispose() {
    sub.cancel();

    super.dispose();
  }

  void initLogin() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final params = SignInParams(
      user: user.user.value,
      password: user.password.value,
    );

    widget.authBloc.add(SigninAuthEvent(params: params));
  }

  Widget returnLabelButton(AuthStates state) {
    if (state is LoadingAuthState) {
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

    if (state is SucessSigninAuthState) {
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
          'Entrar',
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Modular.to.pushNamed('/configuration/');
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyInputWidget(
                  label: 'Usuario',
                  hintText: 'Digite seu usuario',
                  // validator: (v) =>
                  //     user.user.validate('user').exceptionOrNull(),
                  onChanged: user.setUser,
                  value: user.user.value,
                  inputFormaters: [LowerCaseTextFormatter()],
                ),
                const SizedBox(height: 10),
                MyInputWidget(
                  label: 'Senha',
                  hintText: 'Digite sua senha',
                  validator: (v) =>
                      user.password.validate('Senha').exceptionOrNull(),
                  onChanged: user.setPassword,
                  value: user.password.value,
                  suffixIcon: IconButton(
                    icon: Icon(_showPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<AuthBloc, AuthStates>(
                  bloc: widget.authBloc,
                  builder: (context, state) {
                    return MyElevatedButtonWidget(
                      height: 40,
                      onPressed: initLogin,
                      label: returnLabelButton(state),
                    );
                  },
                ),
                const SizedBox(height: 10),

                // MyElevatedButtonWidget(
                //   label: const Text('Troca tema'),
                //   onPressed: () {
                //     ThemeModeController.appStore.changeThemeMode(
                //         ThemeModeController.themeMode == ThemeMode.dark
                //             ? ThemeMode.light
                //             : ThemeMode.dark);
                //   },
                // ),
              ],
            ),
          ),
        ));
  }
}
