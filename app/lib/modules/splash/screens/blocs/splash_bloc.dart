// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:sdi_pedidos/modules/auth/services/auth_service_interface.dart';
import 'package:sdi_pedidos/modules/splash/screens/blocs/splash_events.dart';
import 'package:sdi_pedidos/modules/splash/screens/blocs/splash_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';

class SplashBloc extends Bloc<SplashEvents, SplashStates> {
  final IStorage storage;
  final IAuthService service;

  SplashBloc({
    required this.storage,
    required this.service,
  }) : super(InitialSplashState()) {
    on<CheckTokenEvent>(_checkToken);
  }

  Future _checkToken(CheckTokenEvent event, emit) async {
    final accessToken = await storage.read('access_token');
    final refreshToken = await storage.read('refresh_token');

    if (accessToken != null && !isTokenExpired(accessToken)) {
      emit(SuccessCheckSplashState());
    } else if (accessToken != null &&
        isTokenExpired(accessToken) &&
        refreshToken != null &&
        !isTokenExpired(refreshToken)) {
      Response response = await service.refreshToken(refreshToken);
      if (response.statusCode == 200 &&
          response.data["access_token"] is String) {
        await storage.save("access_token", response.data["access_token"]);
        await storage.save("refresh_token", response.data["refresh_token"]);
        await storage.save("user", jsonEncode(response.data["user"]));

        emit(SuccessCheckSplashState());
      }
    } else {
      emit(ErrorSplashState(message: 'Sua sessão expirou.'));
    }
  }

  bool isTokenExpired(String _token) {
    DateTime? expiryDate = Jwt.getExpiryDate(_token);
    bool isExpired = expiryDate!.compareTo(DateTime.now()) < 0;
    return isExpired;
  }
}
