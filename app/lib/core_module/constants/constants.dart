import 'package:flutter/material.dart';

// const baseUrl = String.fromEnvironment('BASE_URL');
const baseUrl = "https://10.1.1.187:3000/";

const startEndPoint = '';

const loginAdminEndpoint = "/auth/login";
const registerAdminEndpoint = "/auth/register";
const profileEndpoint = "/auth/profile";
const refreshTokenEndpoint = "/auth/refresh";

const getAllclientsEndpoint = "/client/allClients";

const bookmarkEndpoint = "$startEndPoint/bookmark";
const companyEndpoint = "$startEndPoint/company";

const backgroundBlack = Color(0xFF202123);

extension ContextExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  ColorScheme get myTheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

// class GlobalUser {
//   GlobalUser._();

//   static GlobalUser instance = GlobalUser._();

//   late User _user;

//   bool getUser() {
//     final shared = Modular.get<ILocalStorage>();

//     final user = shared.getData('user');

//     if (user != null) {
//       _user = UserAdapter.fromMap(jsonDecode(user));

//       return true;
//     }

//     return false;
//   }

//   User get user => _user;
// }
