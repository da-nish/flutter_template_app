import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poc_flutter_app/app/screens/login_screen/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'package:http/http.dart' as http;

// import 'login_state.dart';

// final loginControllerProvider =
//     StateNotifierProvider<LoginController, LoginState>(
//   (ref) => LoginController(),
// );

// final loginControllerProvider =
//     NotifierProvider<LoginController, LoginState>(
//   LoginController.new,
//   isAutoDispose: true,
// );

// final loginControllerProvider = NotifierProvider.family<LoginController, LoginState, String?>(
//       (arg) => LoginController(arg),
//       isAutoDispose: true,
// );

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {

   @override
  LoginState build(String? initialState) {
    emailController.text = initialState ?? "---";
    return LoginState(email: initialState ?? "");
  }

  final TextEditingController emailController = TextEditingController(text: "email");

  void updateEmail(String email) {
    emailController.text = email;
    state = state.copyWith(email: email);
    print("updating email: $email");
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> login() async {
    if (!state.isButtonEnabled) return;

    state = state.copyWith(isLoading: true);

    try {
      final response = null;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print('Login Success');
        print('Token: ${data['token']}');
      } else {
        print('Login Failed');
        print(response.body);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}